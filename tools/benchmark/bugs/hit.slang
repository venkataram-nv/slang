import common;

[shader("anyhit")]
void shadow(inout ShadowHitInfo payload, Attributes attrib)
{
    // payload.isHit = scene_data_infos[0].GetKind() == SCENE_DATA_KIND_VERTEX;
    payload.isHit = GetKind() == SCENE_DATA_KIND_VERTEX;
}