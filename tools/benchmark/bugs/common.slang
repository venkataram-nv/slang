module common;

[UnscopedEnum]
public enum SceneDataKind
{
    SCENE_DATA_KIND_NONE = 0,
    SCENE_DATA_KIND_VERTEX = 1,
    SCENE_DATA_KIND_INSTANCE = 2,
};

// Infos about the interleaved vertex layout (compressed)
public struct SceneDataInfo
{
    // /// Scope a scene data element belongs to (4 bits)
    // public inline SceneDataKind GetKind()
    // {
    //     return (SceneDataKind) ((packed_data.x & 0xF0000000u) >> 28);
    // }

    // use getter function to unpack, see scene.cpp for corresponding c++ code for packing
    uint2 packed_data;
};

public StructuredBuffer<SceneDataInfo> scene_data_infos;

public inline SceneDataKind GetKind()
{
    return (SceneDataKind) ((scene_data_infos[0].packed_data.x & 0xF0000000u) >> 28);
}

public struct ShadowHitInfo
{
    public bool isHit;
    public uint seed;
};

public struct Attributes
{
    public float2 bary;
};