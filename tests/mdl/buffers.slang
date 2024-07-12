import common;

cbuffer SceneConstants
{
    float total_time;
    float delta_time;

    // (progressive) rendering
    uint progressive_iteration;
    uint max_ray_depth;
    uint iterations_per_frame;

    // tone mapping
    float exposure_compensation;
    float firefly_clamp_threshold;
    float burn_out;

    // one additional point light for illustration
    uint point_light_enabled;
    float3 point_light_position;
    float3 point_light_intensity;

    // gamma correction while rendering to the frame buffer
    float output_gamma_correction;

    // when auxiliary buffers are enabled, this index is used to select to one to display
    uint display_buffer_index;

    // enable animation mode, progression is limited, mdl state will have an animation_time
    uint enable_animiation;

    /// replace the background with a constant color when visible to the camera
    uint background_color_enabled;
    float3 background_color;

    /// uv transformations
    float2 uv_scale;
    float2 uv_offset;
    uint uv_repeat;
    uint uv_saturate;

    // defines the scale of the scene
    float meters_per_scene_unit;

    // far plane that defines the maximum ray travel distance
    float far_plane_distance;
}

// per target data
ByteAddressBuffer mdl_ro_data_segment;

// per material data
// - argument block contains dynamic parameter data exposed in class compilation mode
ByteAddressBuffer mdl_argument_block;

// - texture views, unbound and overlapping for 2D and 3D resources
Texture2D mdl_textures_2d[];
Texture3D mdl_textures_3d[];
// - buffer views, unbound. contains sampling and albedo buffers for MBSDFs and sampling buffers for light profiles
StructuredBuffer<float> mdl_buffers[];

// mesh data, includes the per mesh scene data
ByteAddressBuffer vertices;

// instance data
// - scene data buffer for object/instance data
ByteAddressBuffer scene_data;
StructuredBuffer<SceneDataInfo> scene_data_infos;

// global samplers
SamplerState mdl_sampler_tex;
SamplerState mdl_sampler_light_profile;
SamplerState mdl_sampler_mbsdf;
