public static const float M_PI = 3.14159265358979323846;
public static const float M_ONE_OVER_PI = 0.318309886183790671538;
public static const float DIRAC = -1.0f;

// Ray typed, has to match with CPU version
public enum RayType : uint
{
    RAY_TYPE_RADIANCE = 0,
    RAY_TYPE_SHADOW,

    RAY_TYPE_COUNT,
    RAY_TYPE_FORCE_32_BIT = 0xffffffffU
};

[UnscopedEnum]
public enum RadianceHitInfoFlags
{
    FLAG_NONE = 0,
    FLAG_INSIDE = 1,
    FLAG_DONE = 2,
    FLAG_FIRST_PATH_SEGMENT = 4,
    FLAG_LAST_PATH_SEGMENT = 8,
    FLAG_CAMERA_RAY = 16
};

/// Information passed to GPU for mapping id requested in the runtime functions to texture
/// views of the corresponding type.
public struct Mdl_texture_info
{
    // index into the tex2d, tex3d, ... buffers, depending on the type requested
    public uint gpu_resource_array_start;

    // number resources (e.g. uv-tiles) that belong to this resource
    public uint gpu_resource_array_size;

    // frame number of the first texture/uv-tile
    public int gpu_resource_frame_first;

    // coordinate of the left bottom most uv-tile (also bottom left corner)
    public int2 gpu_resource_uvtile_min;

    // in case of uv-tiled textures, required to calculate a linear index (u + v * width
    public uint gpu_resource_uvtile_width;
    public uint gpu_resource_uvtile_height;

    // get the last frame of an animated texture
    public int get_last_frame()
    {
        return gpu_resource_array_size / (gpu_resource_uvtile_width * gpu_resource_uvtile_height)
            + gpu_resource_frame_first - 1;
    }

    // return the resource view index for a given uv-tile id. (see compute_uvtile_and_update_uv(...))
    // returning of -1 indicates out of bounds, 0 refers to the invalid resource.
    public int compute_uvtile_id(float frame, int2 uv_tile)
    {
        if (gpu_resource_array_size == 1) // means no uv-tiles
            return int(gpu_resource_array_start);

        // simplest handling possible
        int frame_number = floor(frame) - gpu_resource_frame_first;

        uv_tile -= gpu_resource_uvtile_min;
        const int offset = uv_tile.x +
                           uv_tile.y * int(gpu_resource_uvtile_width) +
                           frame_number * int(gpu_resource_uvtile_width) * int(gpu_resource_uvtile_height);
        if (frame_number < 0 || uv_tile.x < 0 || uv_tile.y < 0 ||
            uv_tile.x >= int(gpu_resource_uvtile_width) ||
            uv_tile.y >= int(gpu_resource_uvtile_height) ||
            offset >= gpu_resource_array_size)
            return -1; // out of bounds

        return int(gpu_resource_array_start) + offset;
    }

    // for uv-tiles, uv coordinate implicitly specifies which resource to use
    // the index of the resource is returned while the uv mapped into the uv-tile
    // if uv-tiles are not used, the data is just passed through
    // returning of -1 indicates out of bounds, 0 refers to the invalid resource.
    public int compute_uvtile_id_and_update_uv(float frame, inout float2 uv)
    {
        if(gpu_resource_array_size == 1) // means no uv-tiles
            return int(gpu_resource_array_start);

        // uv-coordinate in the tile
        const int2 uv_tile = abs(int2(floor(uv))); // abs because there are negative tile addresses
        uv = frac(uv);

        // compute a linear index
        return compute_uvtile_id(frame, uv_tile);
    }
};

/// Information passed to the GPU for each light profile resource
public struct Mdl_light_profile_info
{
    // angular resolution of the grid and its inverse
    public uint2 angular_resolution;
    public float2 inv_angular_resolution;

    // starting angles of the grid
    public float2 theta_phi_start;

    // angular step size and its inverse
    public float2 theta_phi_delta;
    public float2 theta_phi_inv_delta;

    // factor to rescale the normalized data
    // also represents the maximum candela value of the data
    public float candela_multiplier;

    // power (radiant flux)
    public float total_power;

    // index into the textures_2d array
    // -  texture contains normalized data sampled on grid
    public uint eval_data_index;

    // index into the buffers
    // - CDFs for sampling a light profile
    public uint sample_data_index;
};

/// Information passed to the GPU for each BSDF measurement resource
public struct Mdl_mbsdf_info
{
    // if the MBSDF has data for reflection (0) and transmission (1)
    public uint2 has_data;

    // index into the texture_3d array for both parts
    // - texture contains the measurement values for evaluation
    public uint2 eval_data_index;

    // indices into the buffers array for both parts
    // - sample_data buffer contains CDFs for sampling
    // - albedo_data buffer contains max albedos for each theta (isotropic)
    public uint2 sample_data_index;
    public uint2 albedo_data_index;

    // maximum albedo values for both parts, used for limiting the multiplier
    public float2 max_albedo;

    // discrete angular resolution for both parts
    public uint2 angular_resolution_theta;
    public uint2 angular_resolution_phi;

    // number of color channels (1 for scalar, 3 for rgb) for both parts
    public uint2 num_channels;
};

//-------------------------------------------------------------------------------------------------
// Scene Data API
//-------------------------------------------------------------------------------------------------

/// interpolation of the data over the primitive
// TODO: enumerations.slang for all enums
// #if defined(WITH_ENUM_SUPPORT)
[UnscopedEnum]
public enum SceneDataInterpolationMode
{
    SCENE_DATA_INTERPOLATION_MODE_NONE = 0,
    SCENE_DATA_INTERPOLATION_MODE_LINEAR = 1,
    SCENE_DATA_INTERPOLATION_MODE_NEAREST = 2,
};
// #else
//     #define SceneDataInterpolationMode uint
//     #define SCENE_DATA_INTERPOLATION_MODE_NONE      0
//     #define SCENE_DATA_INTERPOLATION_MODE_LINEAR    1
//     #define SCENE_DATA_INTERPOLATION_MODE_NEAREST   2
// #endif

/// Scope a scene data element belongs to
// #if defined(WITH_ENUM_SUPPORT)
[UnscopedEnum]
public enum SceneDataKind
{
    SCENE_DATA_KIND_NONE = 0,
    SCENE_DATA_KIND_VERTEX = 1,
    SCENE_DATA_KIND_INSTANCE = 2,
};
// #else
//     #define SceneDataKind uint
//     #define SCENE_DATA_KIND_NONE        0
//     #define SCENE_DATA_KIND_VERTEX      1
//     #define SCENE_DATA_KIND_INSTANCE    2
// #endif

/// Basic element type of the scene data
// #if defined(WITH_ENUM_SUPPORT)
[UnscopedEnum]
public enum SceneDataElementType
{
    SCENE_DATA_ELEMENT_TYPE_FLOAT = 0,
    SCENE_DATA_ELEMENT_TYPE_INT = 1,
    SCENE_DATA_ELEMENT_TYPE_COLOR = 2
};
// #else
//     #define SceneDataElementType uint
//     #define SCENE_DATA_ELEMENT_TYPE_FLOAT   0
//     #define SCENE_DATA_ELEMENT_TYPE_INT     1
//     #define SCENE_DATA_ELEMENT_TYPE_COLOR   2
// #endif

// Infos about the interleaved vertex layout (compressed)
public struct SceneDataInfo
{
    /// Scope a scene data element belongs to (4 bits)
    public inline SceneDataKind GetKind()
    {
        return (SceneDataKind) ((packed_data.x & 0xF0000000u) >> 28);
    }

    /// Basic element type of the scene data (4 bits)
    public inline SceneDataElementType GetElementType()
    {
        return (SceneDataElementType) ((packed_data.x & 0x0F000000u) >> 24);
    }

    /// Interpolation of the data over the primitive (4 bits)
    public SceneDataInterpolationMode GetInterpolationMode()
    {
        return (SceneDataInterpolationMode) ((packed_data.x & 0x00F00000u) >> 20);
    }

    /// Indicates whether there the scene data is uniform. (1 bit)
    public bool GetUniform()
    {
        return (packed_data.x & 0x00010000u) > 0;
    }

    /// Offset between two elements. For interleaved vertex buffers, this is the vertex size in byte.
    /// For non-interleaved buffers, this is the element size in byte. (16 bit)
    public uint GetByteStride()
    {
        return (packed_data.x & 0x0000FFFFu);
    }

    /// The offset to the data element within an interleaved vertex buffer, or the absolute
    /// offset to the base (e.g. of the geometry data) in non-interleaved buffers
    public uint GetByteOffset()
    {
        return packed_data.y;
    }

    // use getter function to unpack, see scene.cpp for corresponding c++ code for packing
    uint2 packed_data;
};

public void add_flag(inout uint flags, uint to_add)
{
    flags |= to_add;
}

public void toggle_flag(inout uint flags, uint to_toggle)
{
    flags ^= to_toggle;
}

public void remove_flag(inout uint flags, uint to_remove)
{
    flags &= ~to_remove;
}

public bool has_flag(int flags, uint to_check)
{
    return (flags & to_check) != 0;
}

// payload for RAY_TYPE_RADIANCE
public struct RadianceHitInfo
{
    public float3 contribution;
    public float3 weight;

    public float3 ray_origin_next;
    public float3 ray_direction_next;

    public uint seed;
    public float last_bsdf_pdf;
    public uint flags;
};

// payload for RAY_TYPE_SHADOW
public struct ShadowHitInfo
{
    public bool isHit;
    public uint seed;
};

// Attributes output by the ray tracing when hitting a surface
public struct Attributes
{
    public float2 bary;
};

// Helper to make NaN and INF values visible in the output image.
public float3 encode_errors(float3 color)
{
    return any(isnan(color) | isinf(color)) ? float3(0.0f, 0.0f, 1.0e+30f) : color;
}

// Positions, normals, and tangents are mandatory for this renderer. The vertex buffer always
// contains this data at the beginning of the (interleaved) per vertex data.
// #if defined(WITH_ENUM_SUPPORT)
[UnscopedEnum]
public enum VertexByteOffset : uint
{
	VERT_BYTEOFFSET_POSITION = 0,
	VERT_BYTEOFFSET_NORMAL = 12,
	VERT_BYTEOFFSET_TANGENT = 24,
};
// #else
//     #define VertexByteOffset uint
//     #define VERT_BYTEOFFSET_POSITION    0
//     #define VERT_BYTEOFFSET_NORMAL      12
//     #define VERT_BYTEOFFSET_TANGENT     24
// #endif

//-------------------------------------------------------------------------------------------------
// random number generator based on the Optix SDK
//-------------------------------------------------------------------------------------------------
uint tea(uint N, uint val0, uint val1)
{
    uint v0 = val0;
    uint v1 = val1;
    uint s0 = 0;

    for (uint n = 0; n < N; n++)
    {
        s0 += 0x9e3779b9;
        v0 += ((v1 << 4) + 0xa341316c) ^ (v1 + s0) ^ ((v1 >> 5) + 0xc8013ea4);
        v1 += ((v0 << 4) + 0xad90777d) ^ (v0 + s0) ^ ((v0 >> 5) + 0x7e95761e);
    }

    return v0;
}

// Generate random uint in [0, 2^24)
uint lcg(inout uint prev)
{
    const uint LCG_A = 1664525u;
    const uint LCG_C = 1013904223u;
    prev = (LCG_A * prev + LCG_C);
    return prev & 0x00FFFFFF;
}

// Generate random float in [0, 1)
public float rnd(inout uint prev)
{
    return ((float) lcg(prev) / (float) 0x01000000);
}

public float2 rnd2(inout uint prev)
{
    return float2((float) lcg(prev) / (float) 0x01000000,
                  (float) lcg(prev) / (float) 0x01000000);
}

public float3 rnd3(inout uint prev)
{
    return float3((float) lcg(prev) / (float) 0x01000000,
                  (float) lcg(prev) / (float) 0x01000000,
                  (float) lcg(prev) / (float) 0x01000000);
}

public float4 rnd4(inout uint prev)
{
    return float4((float) lcg(prev) / (float) 0x01000000,
                  (float) lcg(prev) / (float) 0x01000000,
                  (float) lcg(prev) / (float) 0x01000000,
                  (float) lcg(prev) / (float) 0x01000000);
}

//-------------------------------------------------------------------------------------------------
// Math helper
//-------------------------------------------------------------------------------------------------

// convert float4x3 to 4x4, to be compatible with the slang compiler
public float4x4 to4x4(float3x4 source)
{
    return float4x4(source[0], source[1], source[2], float4(0.0f, 0.0f, 0.0f, 1.0f));
}

//-------------------------------------------------------------------------------------------------
// Avoiding self intersections (see Ray Tracing Gems, Ch. 6)
//-------------------------------------------------------------------------------------------------

public float3 offset_ray(const float3 p, const float3 n)
{
    const float origin = 1.0f / 32.0f;
    const float float_scale = 1.0f / 65536.0f;
    const float int_scale = 256.0f;

    const int3 of_i = int3(int_scale * n);

    float3 p_i = float3(asfloat(asint(p.x) + ((p.x < 0.0f) ? -of_i.x : of_i.x)),
                        asfloat(asint(p.y) + ((p.y < 0.0f) ? -of_i.y : of_i.y)),
                        asfloat(asint(p.z) + ((p.z < 0.0f) ? -of_i.z : of_i.z)));

    return float3(abs(p.x) < origin ? p.x + float_scale * n.x : p_i.x,
                  abs(p.y) < origin ? p.y + float_scale * n.y : p_i.y,
                  abs(p.z) < origin ? p.z + float_scale * n.z : p_i.z);
}
