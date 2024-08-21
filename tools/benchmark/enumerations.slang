module enumerations;

[UnscopedEnum]
public enum MaterialFlags
{
    MATERIAL_FLAG_NONE          = 0,
    MATERIAL_FLAG_OPAQUE        = 1 << 0, // allows to skip opacity evaluation
    MATERIAL_FLAG_SINGLE_SIDED  = 1 << 1  // geometry is only visible from the front side
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
public enum Edf_event_type
{
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

/// interpolation of the data over the primitive
[UnscopedEnum]
public enum SceneDataInterpolationMode
{
    SCENE_DATA_INTERPOLATION_MODE_NONE = 0,
    SCENE_DATA_INTERPOLATION_MODE_LINEAR = 1,
    SCENE_DATA_INTERPOLATION_MODE_NEAREST = 2,
};

/// Scope a scene data element belongs to
[UnscopedEnum]
public enum SceneDataKind
{
    SCENE_DATA_KIND_NONE = 0,
    SCENE_DATA_KIND_VERTEX = 1,
    SCENE_DATA_KIND_INSTANCE = 2,
};

/// Basic element type of the scene data
[UnscopedEnum]
public enum SceneDataElementType
{
    SCENE_DATA_ELEMENT_TYPE_FLOAT = 0,
    SCENE_DATA_ELEMENT_TYPE_INT = 1,
    SCENE_DATA_ELEMENT_TYPE_COLOR = 2,
};

// Positions, normals, and tangents are mandatory for this renderer. The vertex buffer always
// contains this data at the beginning of the (interleaved) per vertex data.
[UnscopedEnum]
public enum VertexByteOffset : uint
{
	VERT_BYTEOFFSET_POSITION = 0,
	VERT_BYTEOFFSET_NORMAL = 12,
	VERT_BYTEOFFSET_TANGENT = 24,
};
