import common;

module environment;

SamplerState sampler_latlong;

public cbuffer SceneConstants
{
    // environment light
    public float environment_intensity_factor;
    float environment_inv_integral;

    // rotation of the environment [0, 1]
    float environment_rotation;
}

public struct Environment_sample_data
{
    uint alias;
    float q;
};

public float3 environment_evaluate(Texture2D<float4> lat_long_tex,
                            StructuredBuffer<Environment_sample_data> sample_buffer,
                            float3 normalized_dir,
                            out float pdf)
{
    // assuming lat long
    float u = atan2(normalized_dir.z, normalized_dir.x) * 0.5f * M_ONE_OVER_PI + 0.5f;
    u -= environment_rotation;
    if (u < 0.0f)
        u += 1.0f;
    const float v = acos(-normalized_dir.y) * M_ONE_OVER_PI;

    // get radiance and calculate pdf
    float3 t = lat_long_tex.SampleLevel(sampler_latlong, float2(u, v), 0.0f, 0).xyz;
    pdf = max(t.x, max(t.y, t.z)) * environment_inv_integral;
    return t * environment_intensity_factor;
}

public float3 environment_sample(Texture2D<float4> lat_long_tex,
                                 StructuredBuffer<Environment_sample_data> sample_buffer,
                                 inout uint seed,
                                 out float3 to_light,
                                 out float pdf)
{
    float3 xi;
    xi.x = rnd(seed);
    xi.y = rnd(seed);
    xi.z = rnd(seed);


    uint width;
    uint height;
    lat_long_tex.GetDimensions(width, height);

    const uint size = width * height;
    const uint idx = min(uint(xi.x * float(size)), size - 1);

    uint env_idx;
    if (xi.y < sample_buffer[idx].q)
    {
        env_idx = idx;
        xi.y /= sample_buffer[idx].q;
    }
    else
    {
        env_idx = sample_buffer[idx].alias;
        xi.y = (xi.y - sample_buffer[idx].q) / (1.0f - sample_buffer[idx].q);
    }

    const uint py = env_idx / width;
    const uint px = env_idx % width;

    // uniformly sample spherical area of pixel
    const float u = float(px + xi.y) / float(width);
    float u_rot = u + environment_rotation;
    if (u_rot > 1.0f)
        u_rot -= 1.0f;

    const float phi = u_rot * (2.0f * M_PI) - M_PI;
    float sin_phi;
    float cos_phi;
    sincos(phi, sin_phi, cos_phi);

    const float step_theta = M_PI / float(height);
    const float theta0 = float(py) * step_theta;
    const float cos_theta = cos(theta0) * (1.0f - xi.z) + cos(theta0 + step_theta) * xi.z;
    const float theta = acos(cos_theta);
    const float sin_theta = sin(theta);
    to_light = float3(cos_phi * sin_theta, -cos_theta, sin_phi * sin_theta);

    // lookup filtered value and calculate pdf
    const float v = theta * M_ONE_OVER_PI;
    float3 t = lat_long_tex.SampleLevel(sampler_latlong, float2(u, v), 0.0f, 0).xyz;
    pdf = max(t.x, max(t.y, t.z)) * environment_inv_integral;
    return t * environment_intensity_factor;
}
