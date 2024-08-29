module shading;

import types;

static const int MDL_NUM_TEXTURE_RESULTS = 32;

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
    public Derived_float3    position;

    /// The result of state::animation_time().
    /// It represents the time of the current sample in seconds.
    public float             animation_time;

    /// An array containing the results of state::texture_coordinate(i).
    /// The i-th entry represents the texture coordinates of the i-th texture space at the
    /// current position.
    public Derived_float3    text_coords[1];

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
