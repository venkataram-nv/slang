module buffers;

import common;

public cbuffer SceneConstants
{
    public float total_time;
    public float delta_time;

    // (progressive) rendering
    public uint progressive_iteration;
    public uint max_ray_depth;
    public uint iterations_per_frame;

    // tone mapping
    public float exposure_compensation;
    public float firefly_clamp_threshold;
    public float burn_out;

    // one additional point light for illustration
    public uint point_light_enabled;
    public float3 point_light_position;
    public float3 point_light_intensity;

    // gamma correction while rendering to the frame buffer
    public float output_gamma_correction;

    // when auxiliary buffers are enabled, this index is used to select to one to display
    public uint display_buffer_index;

    // enable animation mode, progression is limited, mdl state will have an animation_time
    public uint enable_animiation;

    /// replace the background with a constant color when visible to the camera
    public uint background_color_enabled;
    public float3 background_color;

    /// uv transformations
    public float2 uv_scale;
    public float2 uv_offset;

    public uint uv_repeat;
    public uint uv_saturate;

    // defines the scale of the scene
    public float meters_per_scene_unit;

    // far plane that defines the maximum ray travel distance
    public float far_plane_distance;
}

// per target data
public ByteAddressBuffer mdl_ro_data_segment;

// per material data
// - argument block contains dynamic parameter data exposed in class compilation mode
public ByteAddressBuffer mdl_argument_block;

// - texture views, unbound and overlapping for 2D and 3D resources
public Texture2D mdl_textures_2d[];
public Texture3D mdl_textures_3d[];

// - buffer views, unbound. contains sampling and albedo buffers for MBSDFs and sampling buffers for light profiles
public StructuredBuffer<float> mdl_buffers[];

// mesh data, includes the per mesh scene data
public ByteAddressBuffer vertices;

// instance data
// - scene data buffer for object/instance data
public ByteAddressBuffer scene_data;
public StructuredBuffer<SceneDataInfo> scene_data_infos;

// global samplers
public SamplerState mdl_sampler_tex;
public SamplerState mdl_sampler_light_profile;
public SamplerState mdl_sampler_mbsdf;