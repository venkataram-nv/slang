static const int MDL_NUM_TEXTURE_RESULTS = 16;

public struct Derived_float {
    public float val;
    public float dx;
    public float dy;
}

public struct Derived_float2 {
    public float2 val;
    public float2 dx;
    public float2 dy;
}

public struct Derived_float3 {
    public float3 val;
    public float3 dx;
    public float3 dy;
}

public struct Derived_float4 {
    public float4 val;
    public float4 dx;
    public float4 dy;
}

/// The texture wrap modes as defined by \c tex::wrap_mode in the MDL specification.
/// It determines the texture lookup behavior if a lookup coordinate
/// is exceeding the normalized half-open texture space range of [0, 1).
[UnscopedEnum]
public enum Tex_wrap_mode {
    /// \c tex::wrap_clamp: clamps the lookup coordinate to the range
    TEX_WRAP_CLAMP           = 0,

    /// \c tex::wrap_repeat: takes the fractional part of the lookup coordinate
    /// effectively repeating the texture along this axis
    TEX_WRAP_REPEAT          = 1,

    /// \c tex::wrap_mirrored_repeat: like wrap_repeat but takes one minus the fractional part
    /// every other interval to mirror every second instance of the texture
    TEX_WRAP_MIRRORED_REPEAT = 2,

    /// \c tex::wrap_clip: makes the texture lookup return zero for texture coordinates outside
    /// of the range
    TEX_WRAP_CLIP            = 3
};

/// The type of events created by BSDF importance sampling.
[UnscopedEnum]
public enum Bsdf_event_type
{
    BSDF_EVENT_ABSORB       = 0,

    BSDF_EVENT_DIFFUSE      = 1,
    BSDF_EVENT_GLOSSY       = 1 << 1,
    BSDF_EVENT_SPECULAR     = 1 << 2,
    BSDF_EVENT_REFLECTION   = 1 << 3,
    BSDF_EVENT_TRANSMISSION = 1 << 4,

    BSDF_EVENT_DIFFUSE_REFLECTION    = BSDF_EVENT_DIFFUSE  | BSDF_EVENT_REFLECTION,
    BSDF_EVENT_DIFFUSE_TRANSMISSION  = BSDF_EVENT_DIFFUSE  | BSDF_EVENT_TRANSMISSION,
    BSDF_EVENT_GLOSSY_REFLECTION     = BSDF_EVENT_GLOSSY   | BSDF_EVENT_REFLECTION,
    BSDF_EVENT_GLOSSY_TRANSMISSION   = BSDF_EVENT_GLOSSY   | BSDF_EVENT_TRANSMISSION,
    BSDF_EVENT_SPECULAR_REFLECTION   = BSDF_EVENT_SPECULAR | BSDF_EVENT_REFLECTION,
    BSDF_EVENT_SPECULAR_TRANSMISSION = BSDF_EVENT_SPECULAR | BSDF_EVENT_TRANSMISSION,

    BSDF_EVENT_FORCE_32_BIT = 0xffffffffU
};

/// The type of events created by EDF importance sampling.
[UnscopedEnum]
public enum Edf_event_type {
    EDF_EVENT_NONE          = 0,
    EDF_EVENT_EMISSION      = 1,

    EDF_EVENT_FORCE_32_BIT  = 0xffffffffU
};

/// MBSDFs can consist of two parts, which can be selected using this enumeration.
[UnscopedEnum]
public enum Mbsdf_part
{
    /// the bidirectional reflection distribution function (BRDF)
    MBSDF_DATA_REFLECTION = 0,

    /// the bidirectional transmission distribution function (BTDF)
    MBSDF_DATA_TRANSMISSION = 1
};

/// The calling code can mark the \c x component of an IOR field in *_data with
/// \c BSDF_USE_MATERIAL_IOR, to make the BSDF functions use the MDL material's IOR
/// for this IOR field.
public static const float BSDF_USE_MATERIAL_IOR = -1.0f;

/// Input and output structure for BSDF sampling data.
public struct Bsdf_sample_data {
    public float3 ior1;                    ///< mutual input: IOR current medium
    public float3 ior2;                    ///< mutual input: IOR other side
    public float3 k1;                      ///< mutual input: outgoing direction

    public float3 k2;                      ///< output: incoming direction
    public float4 xi;                      ///< input: pseudo-random sample numbers in range [0, 1)
    public float pdf;                      ///< output: pdf (non-projected hemisphere)
    public float3 bsdf_over_pdf;           ///< output: bsdf * dot(normal, k2) / pdf
    public Bsdf_event_type event_type;     ///< output: the type of event for the generated sample
    public int handle;                     ///< output: handle of the sampled elemental BSDF (lobe)
};

/// Input and output structure for BSDF evaluation data.
public struct Bsdf_evaluate_data {
    public float3 ior1;                    ///< mutual input: IOR current medium
    public float3 ior2;                    ///< mutual input: IOR other side
    public float3 k1;                      ///< mutual input: outgoing direction

    public float3 k2;                      ///< input: incoming direction
	public float3 bsdf_diffuse;            ///< output: (diffuse part of the) bsdf * dot(normal, k2)
	public float3 bsdf_glossy;             ///< output: (glossy part of the) bsdf * dot(normal, k2)
    public float pdf;                      ///< output: pdf (non-projected hemisphere)
};

/// Input and output structure for BSDF auxiliary calculation data.
public struct Bsdf_auxiliary_data {
    public float3 ior1;                    ///< mutual input: IOR current medium
    public float3 ior2;                    ///< mutual input: IOR other side
    public float3 k1;                      ///< mutual input: outgoing direction
	public float3 albedo_diffuse;         ///< output: (diffuse part of the) albedo
	public float3 albedo_glossy;          ///< output: (glossy part of the) albedo
	public float3 normal;                 ///< output: normal
	public float3 roughness;              ///< output: glossy rougness_u,
};

/// Input and output structure for BSDF PDF calculation data.
public struct Bsdf_pdf_data {
    public float3 ior1;             ///< mutual input: IOR current medium
    public float3 ior2;             ///< mutual input: IOR other side
    public float3 k1;               ///< mutual input: outgoing direction

    public float3 k2;               ///< input: incoming direction
    public float pdf;               ///< output: pdf (non-projected hemisphere)
};

/// Input and output structure for EDF sampling data.
public struct Edf_sample_data
{
    float4 xi;                      ///< input: pseudo-random sample numbers in range [0, 1)
    float3 k1;                      ///< output: outgoing direction
    float pdf;                      ///< output: pdf (non-projected hemisphere)
    float3 edf_over_pdf;            ///< output: edf * dot(normal,k1) / pdf
    Edf_event_type event_type;      ///< output: the type of event for the generated sample
    int handle;                     ///< output: handle of the sampled elemental EDF (lobe)
};

/// Input and output structure for EDF evaluation data.
public struct Edf_evaluate_data
{
    float3 k1;                      ///< input: outgoing direction
    int handle_offset;
    float cos;                      ///< output: dot(normal, k1)
    float3 edf;                     ///< output: edf
    float pdf;                      ///< output: pdf (non-projected hemisphere)
};

/// Input and output structure for EDF PDF calculation data.
public struct Edf_pdf_data
{
    float3 k1;                      ///< input: outgoing direction
    float pdf;                      ///< output: pdf (non-projected hemisphere)
};

/// Input and output structure for EDF PDF calculation data.
public struct Edf_auxiliary_data
{
    float3 k1;                      ///< input: outgoing direction
    int handle_offset;
};

// renderer state object that is passed to mdl runtime functions
public struct DXRRendererState
{
    // index offset for the first info object relevant for this geometry
    public uint scene_data_info_offset;

    // global offset in the data buffer (for object, geometry, ...)
    public uint scene_data_geometry_byte_offset;

    // vertex indices if the hit triangle (from index buffer)
    public uint3 hit_vertex_indices;

    // barycentric coordinates of the hit point within the triangle
    public float3 barycentric;

    // true if the hit point was on the backside of a triangle, based on geom normal and ray direction
    public bool hit_backface;
};

public typealias RENDERER_STATE_TYPE = DXRRendererState;

public struct Shading_state_material
{
    /// The result of state::normal().
    /// It represents the shading normal as determined by the renderer.
    /// This field will be updated to the result of \c "geometry.normal" by BSDF init functions,
    /// if requested during code generation.
    public float3            normal;

    /// The result of state::geometry_normal().
    /// It represents the geometry normal as determined by the renderer.
    public float3            geom_normal;

    /// The result of state::position().
    /// It represents the position where the material should be evaluated.
    public float3            position;

    /// The result of state::animation_time().
    /// It represents the time of the current sample in seconds.
    public float             animation_time;

    /// An array containing the results of state::texture_coordinate(i).
    /// The i-th entry represents the texture coordinates of the i-th texture space at the
    /// current position.
    public float3            text_coords[1];

    /// An array containing the results of state::texture_tangent_u(i).
    /// The i-th entry represents the texture tangent vector of the i-th texture space at the
    /// current position, which points in the direction of the projection of the tangent to the
    /// positive u axis of this texture space onto the plane defined by the original
    /// surface normal.
    public float3            tangent_u[1];

    /// An array containing the results of state::texture_tangent_v(i).
    /// The i-th entry represents the texture bitangent vector of the i-th texture space at the
    /// current position, which points in the general direction of the positive v axis of this
    /// texture space, but is orthogonal to both the original surface normal and the tangent
    /// of this texture space.
    public float3            tangent_v[1];

    /// The texture results lookup table.
    /// Values will be modified by BSDF init functions to avoid duplicate texture fetches
    /// and duplicate calculation of values.
    /// This field is only relevant for code generated with
    /// #mi::neuraylib::IMdl_backend::translate_material_df() or
    /// #mi::neuraylib::ILink_unit::add_material_df(). In other cases this may be NULL.
    public float4            text_results[MDL_NUM_TEXTURE_RESULTS];

    /// An offset for accesses to the read-only data segment. Will be added before
    /// calling any "mdl_read_rodata_as_*" function.
    /// The data of the read-only data segment is accessible as the first segment
    /// (index 0) returned by #mi::neuraylib::ITarget_code::get_ro_data_segment_data().
    public uint              ro_data_segment_offset;

    /// A 4x4 transformation matrix transforming from world to object coordinates.
    /// It is used by the state::transform_*() methods.
    /// This field is only used if the uniform state is included.
    public float4x4          world_to_object;

    /// A 4x4 transformation matrix transforming from object to world coordinates.
    /// It is used by the state::transform_*() methods.
    /// This field is only used if the uniform state is included.
    public float4x4          object_to_world;

    /// The result of state::object_id().
    /// It is an application-specific identifier of the hit object as provided in a scene.
    /// It can be used to make instanced objects look different in spite of the same used material.
    /// This field is only used if the uniform state is included.
    public uint              object_id;

    /// The result of state::meters_per_scene_unit().
    /// The field is only used if the \c "fold_meters_per_scene_unit" option is set to false.
    /// Otherwise, the value of the \c "meters_per_scene_unit" option will be used in the code.
    public float             meters_per_scene_unit;

    /// An offset to add to any argument block read accesses.
    public uint              arg_block_offset;

    /// A user-defined structure that allows to pass renderer information; for instance about the
    /// hit-point or buffer references; to mdl run-time functions. This is especially required for
    /// the scene data access. The fields of this structure are not altered by generated code.
    public RENDERER_STATE_TYPE renderer_state;
};
