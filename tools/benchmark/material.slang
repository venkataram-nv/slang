import types;
import buffers;
import runtime;
import enumerations;
import shading;

// user defined structs
struct _ZN4base23texture_coordinate_infoE {
    float3 position;
    float3 tangent_u;
    float3 tangent_v;
    int source_flags;
};
struct deriv_type0 {
    _ZN4base23texture_coordinate_infoE val;
    _ZN4base23texture_coordinate_infoE dx;
    _ZN4base23texture_coordinate_infoE dy;
};
struct structtype0 {
    float3 m_0;
    float m_1;
};
struct deriv_type97 {
    float4x4 val;
    float4x4 dx;
    float4x4 dy;
};
// functions
Derived_float3 constr_Derived_float3(float3 val, float3 dx, float3 dy)
{
    Derived_float3 res;
    res.val = val;
    res.dx = dx;
    res.dy = dy;
    return res;
}

deriv_type97 constr_deriv_type97(float4x4 val, float4x4 dx, float4x4 dy)
{
    deriv_type97 res;
    res.val = val;
    res.dx = dx;
    res.dy = dy;
    return res;
}

_ZN4base23texture_coordinate_infoE constr__ZN4base23texture_coordinate_infoE(
    float3 position,
    float3 tangent_u,
    float3 tangent_v,
    int source_flags)
{
    _ZN4base23texture_coordinate_infoE res;
    res.position = position;
    res.tangent_u = tangent_u;
    res.tangent_v = tangent_v;
    res.source_flags = source_flags;
    return res;
}

deriv_type0 constr_deriv_type0(_ZN4base23texture_coordinate_infoE val, _ZN4base23texture_coordinate_infoE dx, _ZN4base23texture_coordinate_infoE dy)
{
    deriv_type0 res;
    res.val = val;
    res.dx = dx;
    res.dy = dy;
    return res;
}

Derived_float2 constr_Derived_float2(float2 val, float2 dx, float2 dy)
{
    Derived_float2 res;
    res.val = val;
    res.dx = dx;
    res.dy = dy;
    return res;
}

structtype0 constr_structtype0(float3 m_0, float m_1)
{
    structtype0 res;
    res.m_0 = m_0;
    res.m_1 = m_1;
    return res;
}

Derived_float constr_Derived_float(float val, float dx, float dy)
{
    Derived_float res;
    res.val = val;
    res.dx = dx;
    res.dy = dy;
    return res;
}

Derived_float3 _ZN5state16transform_vectorEN5state16coordinate_spaceEN5state16coordinate_spaceEu6float3(
    in Shading_state_material state,
    in int from,
    in int to,
    in Derived_float3 vector0)
{
    int tmp1;
    Derived_float3 phi_in;
    Derived_float3 phi_out;
    Derived_float3 tmp8;
    tmp1 = from == 0 ? 2 : from;
    phi_in = vector0;
    if (tmp1 != (to == 0 ? 2 : to)) {
        float4x4 tmp2 = float4x4(state.object_to_world[0], state.object_to_world[1], state.object_to_world[2], state.object_to_world[3]);
        float4x4 tmp3 = float4x4(state.world_to_object[0], state.world_to_object[1], state.world_to_object[2], state.world_to_object[3]);
        float4x4 tmp4 = tmp1 == 2 ? tmp3 : tmp2;
        float3 val = vector0.val;
        float4 tmp5 = tmp4[0];
        float4 tmp6 = tmp4[1];
        float4 tmp7 = tmp4[2];
        float3 dx = vector0.dx;
        float3 dy = vector0.dy;
        tmp8 = constr_Derived_float3(float3(tmp5.x * val.x + tmp5.y * val.y + tmp5.z * val.z, tmp6.x * val.x + tmp6.y * val.y + tmp6.z * val.z, tmp7.x * val.x + tmp7.y * val.y + tmp7.z * val.z), float3(tmp5.x * dx.x + tmp5.y * dx.y + tmp5.z * dx.z, tmp6.x * dx.x + tmp6.y * dx.y + tmp6.z * dx.z, tmp7.x * dx.x + tmp7.y * dx.y + tmp7.z * dx.z), float3(tmp5.x * dy.x + tmp5.y * dy.y + tmp5.z * dy.z, tmp6.x * dy.x + tmp6.y * dy.y + tmp6.z * dy.z, tmp7.x * dy.x + tmp7.y * dy.y + tmp7.z * dy.z));
        phi_in = tmp8;
    }
    phi_out = phi_in;
    return phi_out;
}

deriv_type0 _ZN11OmniSurface9OmniImage28compute_texture_coordinate_2EU7uniformN4base25texture_coordinate_systemEU7uniformiU7uniformfU7uniformfU7uniformfU7uniformfU7uniformbU7uniformbU7uniformbU7uniformN11OmniSurface9OmniImage15projection_modeEU7uniformu6float3U7uniformu6float3U7uniformu6float3(
    in Shading_state_material state,
    in int texture_coordinate_system,
    in int uv_set,
    in Derived_float s_offset,
    in Derived_float t_offset,
    in Derived_float s_scale,
    in Derived_float t_scale,
    in bool s_flip,
    in bool t_flip,
    in bool swap_st,
    in int extended_projection_mode,
    in Derived_float3 projection_translate,
    in Derived_float3 projection_rotate,
    in Derived_float3 projection_scale)
{
    bool tmp0;
    float3 phi_in;
    float3 phi_out;
    float3 tmp1;
    float3 phi_in2;
    float3 phi_out3;
    float3 tmp4;
    float3 phi_in5;
    float3 phi_out6;
    float3 phi_in7;
    float3 phi_out8;
    int phi_in9;
    int phi_out10;
    float3 phi_in11;
    float3 phi_out12;
    float3 tmp13;
    int tmp14;
    float3 tmp15;
    float3 phi_in16;
    float3 phi_out17;
    float3 tmp21;
    float3 tmp24;
    float3 tmp27;
    float3 tmp53;
    bool phi_in54;
    bool phi_out55;
    int phi_in56;
    int phi_out57;
    float tmp80;
    float tmp81;
    float tmp82;
    float4 tmp83;
    float tmp84;
    float tmp85;
    float tmp86;
    float4 tmp87;
    float tmp88;
    float tmp89;
    float tmp90;
    float4 tmp91;
    float tmp92;
    float tmp93;
    float tmp94;
    float4 tmp95;
    deriv_type97 tmp96;
    float3 tmp104;
    float3 tmp105;
    float3 tmp106;
    float3 tmp111;
    float3 tmp113;
    float3 phi_in114;
    float3 phi_out115;
    float3 phi_in116;
    float3 phi_out117;
    float3 phi_in118;
    float3 phi_out119;
    float3 phi_in120;
    float3 phi_out121;
    float3 phi_in122;
    float3 phi_out123;
    float3 tmp124;
    float3 tmp125;
    float3 tmp126;
    float3 tmp127;
    float3 tmp128;
    int phi_in129;
    int phi_out130;
    float phi_in131;
    float phi_out132;
    float phi_in133;
    float phi_out134;
    float phi_in135;
    float phi_out136;
    deriv_type97 phi_in137;
    deriv_type97 phi_out138;
    int phi_in139;
    int phi_out140;
    int phi_in141;
    int phi_out142;
    float phi_in143;
    float phi_out144;
    float phi_in145;
    float phi_out146;
    float phi_in147;
    float phi_out148;
    deriv_type97 phi_in149;
    deriv_type97 phi_out150;
    int phi_in151;
    int phi_out152;
    int phi_in153;
    int phi_out154;
    int phi_in155;
    int phi_out156;
    float phi_in157;
    float phi_out158;
    float phi_in159;
    float phi_out160;
    float phi_in161;
    float phi_out162;
    deriv_type97 phi_in163;
    deriv_type97 phi_out164;
    float4 tmp166;
    float tmp167;
    float tmp168;
    int phi_in169;
    int phi_out170;
    int phi_in171;
    int phi_out172;
    int phi_in173;
    int phi_out174;
    float phi_in175;
    float phi_out176;
    float phi_in177;
    float phi_out178;
    float phi_in179;
    float phi_out180;
    deriv_type97 phi_in181;
    deriv_type97 phi_out182;
    deriv_type97 tmp183;
    deriv_type97 tmp188;
    float tmp189;
    deriv_type97 tmp190;
    deriv_type97 tmp195;
    deriv_type97 tmp196;
    float tmp197;
    float tmp198;
    float tmp199;
    float tmp200;
    float tmp201;
    float tmp202;
    float tmp203;
    float tmp204;
    float tmp205;
    bool tmp206;
    float tmp207;
    float tmp208;
    float tmp209;
    float tmp210;
    float tmp211;
    float tmp212;
    float tmp213;
    float tmp214;
    float tmp215;
    float phi_in216;
    float phi_out217;
    float phi_in218;
    float phi_out219;
    float phi_in220;
    float phi_out221;
    float tmp224;
    float tmp227;
    float tmp228;
    float3 phi_in229;
    float3 phi_out230;
    float3 phi_in231;
    float3 phi_out232;
    float3 phi_in233;
    float3 phi_out234;
    float3 tmp236;
    float3 tmp237;
    float3 tmp238;
    float tmp243;
    float3 tmp244;
    float3 tmp245;
    float3 tmp246;
    float phi_in247;
    float phi_out248;
    float phi_in249;
    float phi_out250;
    float phi_in251;
    float phi_out252;
    float phi_in253;
    float phi_out254;
    float phi_in255;
    float phi_out256;
    float3 phi_in257;
    float3 phi_out258;
    float3 phi_in259;
    float3 phi_out260;
    float3 phi_in261;
    float3 phi_out262;
    float tmp263;
    float tmp264;
    float tmp265;
    float tmp266;
    float tmp267;
    deriv_type97 tmp364;
    float phi_in365;
    float phi_out366;
    float phi_in367;
    float phi_out368;
    float phi_in369;
    float phi_out370;
    deriv_type97 phi_in371;
    deriv_type97 phi_out372;
    bool tmp373;
    float tmp375;
    float tmp376;
    float tmp377;
    float tmp378;
    float tmp379;
    float tmp380;
    float tmp381;
    float tmp382;
    float tmp383;
    float tmp384;
    float tmp385;
    float tmp386;
    float tmp387;
    float4 tmp388;
    int phi_in389;
    int phi_out390;
    float4 phi_in391;
    float4 phi_out392;
    float4 phi_in393;
    float4 phi_out394;
    float4 phi_in395;
    float4 phi_out396;
    float4 phi_in397;
    float4 phi_out398;
    float4 phi_in399;
    float4 phi_out400;
    float4 phi_in401;
    float4 phi_out402;
    float4 phi_in403;
    float4 phi_out404;
    float4 phi_in405;
    float4 phi_out406;
    float4 phi_in407;
    float4 phi_out408;
    float4 phi_in409;
    float4 phi_out410;
    float4 phi_in411;
    float4 phi_out412;
    float4 phi_in413;
    float4 phi_out414;
    float tmp415;
    float4 tmp416;
    float4 tmp417;
    float4 tmp418;
    float4 tmp419;
    float4 phi_in420;
    float4 phi_out421;
    float4 phi_in422;
    float4 phi_out423;
    float4 phi_in424;
    float4 phi_out425;
    float4 phi_in426;
    float4 phi_out427;
    float4 phi_in428;
    float4 phi_out429;
    float4 phi_in430;
    float4 phi_out431;
    float4 phi_in432;
    float4 phi_out433;
    float4 phi_in434;
    float4 phi_out435;
    float4 phi_in436;
    float4 phi_out437;
    float4 phi_in438;
    float4 phi_out439;
    float4 phi_in440;
    float4 phi_out441;
    float4 phi_in442;
    float4 phi_out443;
    float tmp444;
    float tmp445;
    float tmp447;
    float tmp448;
    float phi_in449;
    float phi_out450;
    float phi_in451;
    float phi_out452;
    float phi_in453;
    float phi_out454;
    float phi_in455;
    float phi_out456;
    float phi_in457;
    float phi_out458;
    float phi_in459;
    float phi_out460;
    float phi_in461;
    float phi_out462;
    float tmp463;
    float tmp464;
    float tmp466;
    float tmp467;
    float tmp469;
    float tmp470;
    float4 tmp525;
    float4 tmp527;
    float4 tmp529;
    float4 tmp531;
    float4 tmp533;
    float4 tmp535;
    float4 tmp537;
    float4 tmp539;
    float4 tmp541;
    float4 tmp542;
    float4 tmp543;
    float4 tmp544;
    deriv_type97 tmp545;
    float4x4 tmp546;
    float4x4 tmp547;
    float4 tmp549;
    float3 tmp553;
    bool tmp554;
    float3 tmp556;
    float tmp557;
    float tmp558;
    float phi_in559;
    float phi_out560;
    float phi_in561;
    float phi_out562;
    float3 phi_in563;
    float3 phi_out564;
    float3 phi_in565;
    float3 phi_out566;
    float3 tmp574;
    float3 tmp575;
    float tmp576;
    float tmp577;
    float3 tmp579;
    float3 tmp580;
    int phi_in582;
    int phi_out583;
    float3 phi_in584;
    float3 phi_out585;
    float3 phi_in586;
    float3 phi_out587;
    float3 tmp596;
    float3 tmp598;
    float3 tmp600;
    float3 phi_in601;
    float3 phi_out602;
    float3 phi_in603;
    float3 phi_out604;
    int tmp605;
    float3 tmp607;
    float3 tmp608;
    float3 tmp609;
    float tmp610;
    float tmp611;
    float tmp612;
    float tmp613;
    float tmp614;
    float tmp615;
    float3 tmp631;
    float3 tmp632;
    float3 tmp634;
    float3 tmp636;
    float3 tmp637;
    float3 phi_in638;
    float3 phi_out639;
    float3 phi_in640;
    float3 phi_out641;
    float3 phi_in642;
    float3 phi_out643;
    float3 phi_in644;
    float3 phi_out645;
    float3 phi_in646;
    float3 phi_out647;
    float3 tmp663;
    float3 tmp664;
    float3 tmp666;
    float3 tmp668;
    float3 tmp669;
    float3 tmp690;
    float3 tmp693;
    float3 tmp694;
    if (texture_coordinate_system == 0) {
        tmp0 = uv_set == 0;
        phi_in = float3(0.0f, 0.0f, 0.0f);
        if (tmp0) {
            tmp1 = state.text_coords[0].val;
            phi_in = tmp1;
        }
        phi_out = phi_in;
        phi_in2 = float3(0.0f, 0.0f, 0.0f);
        if (tmp0) {
            tmp4 = state.tangent_u[0];
            phi_in2 = tmp4;
        }
        phi_out3 = phi_in2;
        phi_in5 = phi_out3;
        phi_in7 = float3(0.0f, 0.0f, 0.0f);
        phi_in9 = 0;
        phi_in11 = phi_out;
        if (tmp0) {
            tmp13 = state.tangent_v[0];
            phi_in5 = phi_out3;
            phi_in7 = tmp13;
            phi_in9 = 0;
            phi_in11 = phi_out;
        }
    } else if (extended_projection_mode == 10) {
        bool cond = texture_coordinate_system == 1;
        tmp14 = cond ? 2 : 1;
        tmp15 = state.position.val;
        phi_in16 = tmp15;
        if (!cond) {
            float4 tmp18 = state.world_to_object[0];
            float4 tmp19 = state.world_to_object[1];
            float4 tmp20 = state.world_to_object[2];
            tmp21 = float3(tmp18.y * tmp15.y + tmp18.w + tmp18.x * tmp15.x + tmp18.z * tmp15.z, tmp19.y * tmp15.y + tmp19.w + tmp19.x * tmp15.x + tmp19.z * tmp15.z, tmp20.y * tmp15.y + tmp20.w + tmp20.x * tmp15.x + tmp20.z * tmp15.z);
            phi_in16 = tmp21;
        }
        phi_out17 = phi_in16;
        float3 tmp22 = _ZN5state16transform_vectorEN5state16coordinate_spaceEN5state16coordinate_spaceEu6float3(state, 0, tmp14, constr_Derived_float3(state.tangent_u[0], float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f))).val;
        float3 tmp23 = float3(sqrt(tmp22.x * tmp22.x + tmp22.y * tmp22.y + tmp22.z * tmp22.z), 0.0f, 0.0f);
        tmp24 = tmp22 / tmp23.xxx;
        float3 tmp25 = _ZN5state16transform_vectorEN5state16coordinate_spaceEN5state16coordinate_spaceEu6float3(state, 0, tmp14, constr_Derived_float3(state.tangent_v[0], float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f))).val;
        float3 tmp26 = float3(sqrt(tmp25.x * tmp25.x + tmp25.y * tmp25.y + tmp25.z * tmp25.z), 0.0f, 0.0f);
        tmp27 = tmp25 / tmp26.xxx;
        float3 tmp28 = float3(sqrt(phi_out17.x * phi_out17.x + phi_out17.y * phi_out17.y + phi_out17.z * phi_out17.z), 0.0f, 0.0f);
        float3 tmp29 = phi_out17 / tmp28.xxx;
        float3 tmp30 = projection_rotate.val;
        float tmp31 = tmp30.x * 6.283185482f;
        float tmp32 = cos(tmp31);
        float tmp33 = sin(tmp31);
        float tmp34 = tmp29.y * tmp32 + tmp29.z * tmp33;
        float tmp35 = tmp29.z * tmp32 - tmp29.y * tmp33;
        float tmp36 = tmp30.y * 6.283185482f + -1.570796371f;
        float tmp37 = cos(tmp36);
        float tmp38 = sin(tmp36);
        float tmp39 = tmp34 * tmp38 + tmp29.x * tmp37;
        float tmp40 = tmp34 * tmp37 - tmp29.x * tmp38;
        float3 tmp41 = float3(0.0f, tmp40, 0.0f);
        float tmp42 = tmp30.z * 6.283185482f;
        float tmp43 = cos(tmp42);
        float tmp44 = sin(tmp42);
        float tmp45 = tmp39 * tmp43 + tmp35 * tmp44;
        float tmp46 = tmp35 * tmp43 - tmp39 * tmp44;
        float3 tmp47 = float3(tmp45, tmp46, 0.0f);
        float3 tmp48 = float3(tmp47.x, tmp41.y, tmp47.y);
        float3 tmp49 = float3(-tmp45, -tmp46, 0.0f);
        float3 tmp50 = float3(sqrt(tmp46 * tmp46 + tmp40 * tmp40 + tmp45 * tmp45), 0.0f, 0.0f);
        float3 tmp51 = float3(tmp49.x, tmp49.y, tmp48.y) / tmp50.xxx;
        float3 tmp52 = float3(atan2(tmp51.x, -tmp51.z) * 0.1591549367f + 0.5f, asin(-tmp51.y) * 0.3183098733f + 0.5f, 0.0f);
        tmp53 = float3(tmp52.x, tmp52.y, tmp48.z);
        phi_in5 = tmp24;
        phi_in7 = tmp27;
        phi_in9 = texture_coordinate_system;
        phi_in11 = tmp53;
    } else {
        if (extended_projection_mode == 1) {
            phi_in54 = false;
            phi_in56 = extended_projection_mode;
        } else if (extended_projection_mode == 2) {
            phi_in54 = false;
            phi_in56 = extended_projection_mode;
        } else if (extended_projection_mode == 3) {
            phi_in54 = false;
            phi_in56 = extended_projection_mode;
        } else if (extended_projection_mode == 4) {
            phi_in54 = false;
            phi_in56 = extended_projection_mode;
        } else if (extended_projection_mode == 9) {
            phi_in54 = false;
            phi_in56 = extended_projection_mode;
        } else if (extended_projection_mode == 6) {
            phi_in54 = true;
            phi_in56 = extended_projection_mode;
        } else if (extended_projection_mode == 7) {
            phi_in54 = false;
            phi_in56 = extended_projection_mode;
        } else if (extended_projection_mode == 8) {
            phi_in54 = false;
            phi_in56 = extended_projection_mode;
        } else {
            phi_in54 = false;
            phi_in56 = 5;
        }
        phi_out55 = phi_in54;
        phi_out57 = phi_in56;
        float3 tmp58 = projection_scale.val;
        float3 tmp59 = projection_translate.val;
        float tmp60 = tmp59.x + -0.5f;
        float tmp61 = tmp59.y + -0.5f;
        float tmp62 = tmp59.z + -0.5f;
        float3 tmp63 = projection_rotate.val;
        float tmp64 = sin(tmp63.x);
        float tmp65 = sin(tmp63.y);
        float tmp66 = sin(tmp63.z);
        float tmp67 = cos(tmp63.x);
        float tmp68 = cos(tmp63.y);
        float tmp69 = cos(tmp63.z);
        float tmp70 = tmp68 * tmp69;
        float tmp71 = tmp64 * tmp65;
        float tmp72 = tmp71 * tmp69 - tmp67 * tmp66;
        float tmp73 = tmp67 * tmp65;
        float tmp74 = tmp73 * tmp69 + tmp64 * tmp66;
        float tmp75 = tmp68 * tmp66;
        float tmp76 = tmp71 * tmp66 + tmp67 * tmp69;
        float tmp77 = tmp73 * tmp66 - tmp64 * tmp69;
        float tmp78 = tmp64 * tmp68;
        float tmp79 = tmp67 * tmp68;
        tmp80 = tmp70 * tmp58.x;
        tmp81 = tmp72 * tmp58.x;
        tmp82 = tmp74 * tmp58.x;
        tmp83 = float4(tmp80, tmp81, tmp82, 0.0f);
        tmp84 = tmp75 * tmp58.y;
        tmp85 = tmp76 * tmp58.y;
        tmp86 = tmp77 * tmp58.y;
        tmp87 = float4(tmp84, tmp85, tmp86, 0.0f);
        tmp88 = tmp58.z * -tmp65;
        tmp89 = tmp78 * tmp58.z;
        tmp90 = tmp79 * tmp58.z;
        tmp91 = float4(tmp88, tmp89, tmp90, 0.0f);
        tmp92 = 0.5f - tmp65 * tmp62 + tmp75 * tmp61 + tmp70 * tmp60;
        tmp93 = tmp78 * tmp62 + 0.5f + tmp76 * tmp61 + tmp72 * tmp60;
        tmp94 = tmp79 * tmp62 + 0.5f + tmp77 * tmp61 + tmp74 * tmp60;
        tmp95 = float4(tmp92, tmp93, tmp94, 1.0f);
        tmp96 = constr_deriv_type97(float4x4(tmp83, tmp87, tmp91, tmp95), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
        if (texture_coordinate_system == 2) {
            float3 tmp98 = state.position.val;
            float3 tmp99 = state.position.dx;
            float3 tmp100 = state.position.dy;
            float4 tmp101 = state.world_to_object[0];
            float4 tmp102 = state.world_to_object[1];
            float4 tmp103 = state.world_to_object[2];
            tmp104 = float3(tmp101.y * tmp98.y + tmp101.w + tmp101.x * tmp98.x + tmp101.z * tmp98.z, tmp102.y * tmp98.y + tmp102.w + tmp102.x * tmp98.x + tmp102.z * tmp98.z, tmp103.y * tmp98.y + tmp103.w + tmp103.x * tmp98.x + tmp103.z * tmp98.z);
            tmp105 = float3(tmp101.x * tmp99.x + tmp101.y * tmp99.y + tmp101.z * tmp99.z, tmp102.x * tmp99.x + tmp102.y * tmp99.y + tmp102.z * tmp99.z, tmp103.x * tmp99.x + tmp103.y * tmp99.y + tmp103.z * tmp99.z);
            tmp106 = float3(tmp101.x * tmp100.x + tmp101.y * tmp100.y + tmp101.z * tmp100.z, tmp102.x * tmp100.x + tmp102.y * tmp100.y + tmp102.z * tmp100.z, tmp103.x * tmp100.x + tmp103.y * tmp100.y + tmp103.z * tmp100.z);
            float3 tmp107 = state.normal;
            float4 tmp108 = state.object_to_world[0];
            float4 tmp109 = state.object_to_world[1];
            float4 tmp110 = state.object_to_world[2];
            tmp111 = float3(tmp109.x * tmp107.y + tmp108.x * tmp107.x + tmp110.x * tmp107.z, tmp109.y * tmp107.y + tmp108.y * tmp107.x + tmp110.y * tmp107.z, tmp109.z * tmp107.y + tmp108.z * tmp107.x + tmp110.z * tmp107.z);
            float3 tmp112 = state.geom_normal;
            tmp113 = float3(tmp112.y * tmp109.x + tmp112.x * tmp108.x + tmp112.z * tmp110.x, tmp112.y * tmp109.y + tmp112.x * tmp108.y + tmp112.z * tmp110.y, tmp112.y * tmp109.z + tmp112.x * tmp108.z + tmp112.z * tmp110.z);
            phi_in114 = tmp113;
            phi_in116 = tmp111;
            phi_in118 = tmp106;
            phi_in120 = tmp105;
            phi_in122 = tmp104;
        } else if (texture_coordinate_system == 1) {
            tmp124 = state.position.val;
            tmp125 = state.position.dx;
            tmp126 = state.position.dy;
            tmp127 = state.normal;
            tmp128 = state.geom_normal;
            phi_in114 = tmp128;
            phi_in116 = tmp127;
            phi_in118 = tmp126;
            phi_in120 = tmp125;
            phi_in122 = tmp124;
        } else {
            phi_in114 = float3(0.0f, 0.0f, 0.0f);
            phi_in116 = float3(0.0f, 0.0f, 0.0f);
            phi_in118 = float3(0.0f, 0.0f, 0.0f);
            phi_in120 = float3(0.0f, 0.0f, 0.0f);
            phi_in122 = float3(0.0f, 0.0f, 0.0f);
        }
        phi_out115 = phi_in114;
        phi_out117 = phi_in116;
        phi_out119 = phi_in118;
        phi_out121 = phi_in120;
        phi_out123 = phi_in122;
        phi_in129 = 1;
        phi_in131 = 0.0f;
        phi_in133 = 0.0f;
        phi_in135 = 0.0f;
        phi_in137 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
        if (phi_out57 != 3) {
            phi_in129 = 1;
            phi_in131 = 0.0f;
            phi_in133 = 0.0f;
            phi_in135 = 0.0f;
            phi_in137 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
            if (phi_out57 != 4) {
                phi_in129 = 1;
                phi_in131 = 0.0f;
                phi_in133 = 0.0f;
                phi_in135 = 0.0f;
                phi_in137 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                if (phi_out57 != 7) {
                    phi_in129 = 1;
                    phi_in131 = 0.0f;
                    phi_in133 = 0.0f;
                    phi_in135 = 0.0f;
                    phi_in137 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                    if (phi_out57 != 8) {
                        phi_in139 = 0;
                        phi_in141 = 0;
                        phi_in143 = 0.0f;
                        phi_in145 = 0.0f;
                        phi_in147 = 0.0f;
                        phi_in149 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                        if (phi_out57 != 2) {
                            phi_in139 = 0;
                            phi_in141 = 0;
                            phi_in143 = 0.0f;
                            phi_in145 = 0.0f;
                            phi_in147 = 0.0f;
                            phi_in149 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                            if (phi_out57 != 6) {
                                phi_in151 = 0;
                                phi_in153 = 0;
                                phi_in155 = 0;
                                phi_in157 = 0.0f;
                                phi_in159 = 0.0f;
                                phi_in161 = 0.0f;
                                phi_in163 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                                if (phi_out57 != 9) {
                                    phi_in151 = 0;
                                    phi_in153 = 0;
                                    phi_in155 = 0;
                                    phi_in157 = 0.0f;
                                    phi_in159 = 0.0f;
                                    phi_in161 = 0.0f;
                                    phi_in163 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                                    if (phi_out57 != 1) {
                                        phi_in151 = 1;
                                        phi_in153 = 1;
                                        phi_in155 = 0;
                                        phi_in157 = phi_out123.z;
                                        phi_in159 = phi_out123.y;
                                        phi_in161 = phi_out123.x;
                                        phi_in163 = tmp96;
                                    }
                                }
                                phi_out152 = phi_in151;
                                phi_out154 = phi_in153;
                                phi_out156 = phi_in155;
                                phi_out158 = phi_in157;
                                phi_out160 = phi_in159;
                                phi_out162 = phi_in161;
                                phi_out164 = phi_in163;
                                phi_in139 = phi_out154;
                                phi_in141 = phi_out156;
                                phi_in143 = phi_out158;
                                phi_in145 = phi_out160;
                                phi_in147 = phi_out162;
                                phi_in149 = phi_out164;
                                if (phi_out152 == 0) {
                                    float4 tmp165 = float4(phi_out117.x * tmp80 + phi_out117.y * tmp84 + phi_out117.z * tmp88, phi_out117.x * tmp81 + phi_out117.y * tmp85 + phi_out117.z * tmp89, phi_out117.x * tmp82 + phi_out117.y * tmp86 + phi_out117.z * tmp90, 0.0f);
                                    tmp166 = (phi_out123.y * tmp84 + tmp92 + phi_out123.x * tmp80 + phi_out123.z * tmp88) * (phi_out115.x * tmp80 + phi_out115.y * tmp84 + phi_out115.z * tmp88) + (phi_out123.y * tmp85 + tmp93 + phi_out123.x * tmp81 + phi_out123.z * tmp89) * (phi_out115.x * tmp81 + phi_out115.y * tmp85 + phi_out115.z * tmp89) + (phi_out123.y * tmp86 + tmp94 + phi_out123.x * tmp82 + phi_out123.z * tmp90) * (phi_out115.x * tmp82 + phi_out115.y * tmp86 + phi_out115.z * tmp90) < 0.0f ? -tmp165 : tmp165;
                                    tmp167 = abs(tmp166.x);
                                    tmp168 = abs(tmp166.y);
                                    phi_in169 = 0;
                                    phi_in171 = 0;
                                    phi_in173 = 0;
                                    phi_in175 = 0.0f;
                                    phi_in177 = 0.0f;
                                    phi_in179 = 0.0f;
                                    phi_in181 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                                    if (!(tmp167 < tmp168)) {
                                        phi_in169 = 0;
                                        phi_in171 = 0;
                                        phi_in173 = 0;
                                        phi_in175 = 0.0f;
                                        phi_in177 = 0.0f;
                                        phi_in179 = 0.0f;
                                        phi_in181 = constr_deriv_type97(float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                                        if (!(tmp167 < abs(tmp166.z))) {
                                            if (tmp166.x > 0.0f) {
                                                tmp183 = constr_deriv_type97(float4x4(tmp83.yzxw, tmp87.yzxw, tmp91.yzxw, tmp95.yzxw), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                                                phi_in169 = 1;
                                                phi_in171 = 1;
                                                phi_in173 = 0;
                                                phi_in175 = phi_out123.z;
                                                phi_in177 = phi_out123.y;
                                                phi_in179 = phi_out123.x;
                                                phi_in181 = tmp183;
                                            } else {
                                                float4 tmp184 = float4(-tmp81, 0.0f, 0.0f, 0.0f);
                                                float4 tmp185 = float4(-tmp85, 0.0f, 0.0f, 0.0f);
                                                float4 tmp186 = float4(-tmp89, 0.0f, 0.0f, 0.0f);
                                                float4 tmp187 = float4(-tmp93, 0.0f, 0.0f, 0.0f);
                                                tmp188 = constr_deriv_type97(float4x4(float4(tmp184.x, tmp83.z, tmp83.x, tmp83.w), float4(tmp185.x, tmp87.z, tmp87.x, tmp87.w), float4(tmp186.x, tmp91.z, tmp91.x, tmp91.w), float4(tmp187.x, tmp95.z, tmp95.x, tmp95.w)), float4x4(float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f)));
                                                phi_in169 = 1;
                                                phi_in171 = 1;
                                                phi_in173 = 0;
                                                phi_in175 = phi_out123.z;
                                                phi_in177 = phi_out123.y;
                                                phi_in179 = phi_out123.x;
                                                phi_in181 = tmp188;
                                            }
                                        }
                                    }
                                    phi_out170 = phi_in169;
                                    phi_out172 = phi_in171;
                                    phi_out174 = phi_in173;
                                    phi_out176 = phi_in175;
                                    phi_out178 = phi_in177;
                                    phi_out180 = phi_in179;
                                    phi_out182 = phi_in181;
                                    phi_in139 = phi_out172;
                                    phi_in141 = phi_out174;
                                    phi_in143 = phi_out176;
                                    phi_in145 = phi_out178;
                                    phi_in147 = phi_out180;
                                    phi_in149 = phi_out182;
                                    if (phi_out170 == 0) {
                                        tmp189 = abs(tmp166.z);
                                        if (tmp168 < tmp167 || tmp168 < tmp189) {
                                            phi_in139 = 1;
                                            phi_in141 = 0;
                                            phi_in143 = phi_out123.z;
                                            phi_in145 = phi_out123.y;
                                            phi_in147 = phi_out123.x;
                                            phi_in149 = tmp96;
                                            if (!(tmp189 < tmp167)) {
                                                phi_in139 = 1;
                                                phi_in141 = 0;
                                                phi_in143 = phi_out123.z;
                                                phi_in145 = phi_out123.y;
                                                phi_in147 = phi_out123.x;
                                                phi_in149 = tmp96;
                                                if (tmp189 >= tmp168 && tmp166.z < 0.0f) {
                                                    tmp190 = constr_deriv_type97(float4x4(float4(-tmp80, tmp83.y, tmp83.z, tmp83.w), float4(-tmp84, tmp87.y, tmp87.z, tmp87.w), float4(-tmp88, tmp91.y, tmp91.z, tmp91.w), float4(-tmp92, tmp95.y, tmp95.z, tmp95.w)), float4x4(float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f)));
                                                    phi_in139 = 1;
                                                    phi_in141 = 0;
                                                    phi_in143 = phi_out123.z;
                                                    phi_in145 = phi_out123.y;
                                                    phi_in147 = phi_out123.x;
                                                    phi_in149 = tmp190;
                                                }
                                            }
                                        } else if (tmp166.y > 0.0f) {
                                            float4 tmp191 = float4(-tmp80, 0.0f, 0.0f, 0.0f);
                                            float4 tmp192 = float4(-tmp84, 0.0f, 0.0f, 0.0f);
                                            float4 tmp193 = float4(-tmp88, 0.0f, 0.0f, 0.0f);
                                            float4 tmp194 = float4(-tmp92, 0.0f, 0.0f, 0.0f);
                                            tmp195 = constr_deriv_type97(float4x4(float4(tmp191.x, tmp83.z, tmp83.y, tmp83.w), float4(tmp192.x, tmp87.z, tmp87.y, tmp87.w), float4(tmp193.x, tmp91.z, tmp91.y, tmp91.w), float4(tmp194.x, tmp95.z, tmp95.y, tmp95.w)), float4x4(float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f), float4(-0.0f, 0.0f, 0.0f, 0.0f)));
                                            phi_in139 = 1;
                                            phi_in141 = 0;
                                            phi_in143 = phi_out123.z;
                                            phi_in145 = phi_out123.y;
                                            phi_in147 = phi_out123.x;
                                            phi_in149 = tmp195;
                                        } else {
                                            tmp196 = constr_deriv_type97(float4x4(tmp83.xzyw, tmp87.xzyw, tmp91.xzyw, tmp95.xzyw), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)), float4x4(float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 0.0f)));
                                            phi_in139 = 1;
                                            phi_in141 = 0;
                                            phi_in143 = phi_out123.z;
                                            phi_in145 = phi_out123.y;
                                            phi_in147 = phi_out123.x;
                                            phi_in149 = tmp196;
                                        }
                                    }
                                }
                            }
                        }
                        phi_out140 = phi_in139;
                        phi_out142 = phi_in141;
                        phi_out144 = phi_in143;
                        phi_out146 = phi_in145;
                        phi_out148 = phi_in147;
                        phi_out150 = phi_in149;
                        phi_in129 = phi_out142;
                        phi_in131 = phi_out144;
                        phi_in133 = phi_out146;
                        phi_in135 = phi_out148;
                        phi_in137 = phi_out150;
                        if (phi_out140 == 0) {
                            tmp197 = phi_out123.y * tmp84 + tmp92 + phi_out123.x * tmp80 + phi_out123.z * tmp88;
                            tmp198 = phi_out121.z * tmp88 + phi_out121.x * tmp80 + phi_out121.y * tmp84;
                            tmp199 = phi_out119.z * tmp88 + phi_out119.x * tmp80 + phi_out119.y * tmp84;
                            tmp200 = phi_out123.y * tmp85 + tmp93 + phi_out123.x * tmp81 + phi_out123.z * tmp89;
                            tmp201 = phi_out121.z * tmp89 + phi_out121.x * tmp81 + phi_out121.y * tmp85;
                            tmp202 = phi_out119.z * tmp89 + phi_out119.x * tmp81 + phi_out119.y * tmp85;
                            tmp203 = phi_out123.y * tmp86 + tmp94 + phi_out123.x * tmp82 + phi_out123.z * tmp90;
                            tmp204 = phi_out121.z * tmp90 + phi_out121.x * tmp82 + phi_out121.y * tmp86;
                            tmp205 = phi_out119.z * tmp90 + phi_out119.x * tmp82 + phi_out119.y * tmp86;
                            tmp206 = tmp197 != 0.0f || tmp200 != 0.0f;
                            tmp207 = tmp197 * tmp197;
                            tmp208 = tmp200 * tmp200;
                            if (tmp203 != 0.0f || tmp206) {
                                tmp209 = tmp200 * tmp202;
                                tmp210 = tmp197 * tmp199;
                                tmp211 = (tmp210 + tmp209) * 2.0f;
                                tmp212 = tmp200 * tmp201;
                                tmp213 = tmp197 * tmp198;
                                tmp214 = (tmp213 + tmp212) * 2.0f;
                                tmp215 = tmp207 + tmp208;
                                phi_in216 = 0.3183098733f;
                                phi_in218 = 0.0f;
                                phi_in220 = 0.0f;
                                if (!phi_out55) {
                                    float tmp222 = tmp203 * 2.0f;
                                    float tmp223 = tmp215 + tmp203 * tmp203;
                                    tmp224 = sqrt(tmp223);
                                    float tmp225 = 0.5f / tmp224;
                                    bool tmp226 = tmp223 <= 0.0f;
                                    tmp227 = tmp226 ? 0.0f : tmp225 * (tmp214 + tmp222 * tmp204);
                                    tmp228 = tmp226 ? 0.0f : tmp225 * (tmp211 + tmp222 * tmp205);
                                    phi_in216 = tmp224;
                                    phi_in218 = tmp227;
                                    phi_in220 = tmp228;
                                }
                                phi_out217 = phi_in216;
                                phi_out219 = phi_in218;
                                phi_out221 = phi_in220;
                                phi_in229 = float3(0.0f, 0.0f, 0.0f);
                                phi_in231 = float3(0.0f, 0.0f, 0.0f);
                                phi_in233 = float3(0.0f, 0.0f, 0.0f);
                                if (tmp206) {
                                    float tmp235 = atan2(tmp200, tmp197);
                                    tmp236 = float3(tmp235 * phi_out217, 0.0f, 0.0f);
                                    tmp237 = float3(tmp235 * phi_out219 + phi_out217 * (tmp197 * tmp201 - tmp200 * tmp198) / tmp215, 0.0f, 0.0f);
                                    tmp238 = float3(tmp235 * phi_out221 + phi_out217 * (tmp197 * tmp202 - tmp200 * tmp199) / tmp215, 0.0f, 0.0f);
                                    phi_in229 = tmp238;
                                    phi_in231 = tmp237;
                                    phi_in233 = tmp236;
                                }
                                phi_out230 = phi_in229;
                                phi_out232 = phi_in231;
                                phi_out234 = phi_in233;
                                float tmp239 = sqrt(tmp215);
                                float tmp240 = 0.5f / tmp239;
                                bool tmp241 = tmp215 <= 0.0f;
                                float tmp242 = atan2(tmp203, tmp239);
                                tmp243 = tmp215 + tmp203 * tmp203;
                                tmp244 = float3(phi_out234.x, tmp242 * phi_out217, phi_out217);
                                tmp245 = float3(phi_out232.x, tmp242 * phi_out219 + phi_out217 * (tmp239 * tmp204 - (tmp241 ? 0.0f : tmp240 * tmp214) * tmp203) / tmp243, phi_out219);
                                tmp246 = float3(phi_out230.x, tmp242 * phi_out221 + phi_out217 * (tmp239 * tmp205 - (tmp241 ? 0.0f : tmp240 * tmp211) * tmp203) / tmp243, phi_out221);
                                phi_in247 = tmp210;
                                phi_in249 = tmp209;
                                phi_in251 = tmp213;
                                phi_in253 = tmp212;
                                phi_in255 = tmp243;
                                phi_in257 = tmp246;
                                phi_in259 = tmp245;
                                phi_in261 = tmp244;
                            } else {
                                tmp263 = tmp207 + tmp208 + tmp203 * tmp203;
                                tmp264 = tmp200 * tmp201;
                                tmp265 = tmp197 * tmp198;
                                tmp266 = tmp200 * tmp202;
                                tmp267 = tmp197 * tmp199;
                                phi_in247 = tmp267;
                                phi_in249 = tmp266;
                                phi_in251 = tmp265;
                                phi_in253 = tmp264;
                                phi_in255 = tmp263;
                                phi_in257 = float3(0.0f, 0.0f, 0.0f);
                                phi_in259 = float3(0.0f, 0.0f, 0.0f);
                                phi_in261 = float3(0.0f, 0.0f, 0.0f);
                            }
                            phi_out248 = phi_in247;
                            phi_out250 = phi_in249;
                            phi_out252 = phi_in251;
                            phi_out254 = phi_in253;
                            phi_out256 = phi_in255;
                            phi_out258 = phi_in257;
                            phi_out260 = phi_in259;
                            phi_out262 = phi_in261;
                            float tmp268 = -phi_out123.x;
                            float3 tmp269 = float3(tmp197, tmp200, tmp203);
                            float tmp270 = sqrt(phi_out256);
                            float tmp271 = 1.0f / tmp270;
                            bool tmp272 = phi_out256 <= 0.0f;
                            float3 tmp273 = float3(tmp270, 0.0f, 0.0f);
                            float3 tmp274 = tmp273.xxx;
                            float3 tmp275 = tmp273 * tmp273;
                            float3 tmp276 = tmp275.xxx;
                            float3 tmp277 = tmp269 / tmp274;
                            float3 tmp278 = float3(tmp272 ? 0.0f : tmp271 * (phi_out252 + tmp203 * tmp204 + phi_out254), 0.0f, 0.0f);
                            float3 tmp279 = (tmp274 * float3(tmp198, tmp201, tmp204) - tmp278.xxx * tmp269) / tmp276;
                            float3 tmp280 = float3(tmp272 ? 0.0f : tmp271 * (phi_out248 + tmp203 * tmp205 + phi_out250), 0.0f, 0.0f);
                            float3 tmp281 = (tmp274 * float3(tmp199, tmp202, tmp205) - tmp280.xxx * tmp269) / tmp276;
                            float3 tmp282 = tmp277.zxy;
                            float3 tmp283 = tmp277.yzx;
                            float3 tmp284 = tmp282 * float3(0.0f, 1.0f, 0.0f) - tmp283 * float3(1.0f, 0.0f, 0.0f);
                            float3 tmp285 = tmp279.zxy;
                            float3 tmp286 = tmp279.yzx;
                            float3 tmp287 = tmp285 * float3(0.0f, 1.0f, 0.0f) - tmp286 * float3(1.0f, 0.0f, 0.0f);
                            float3 tmp288 = tmp281.zxy;
                            float3 tmp289 = tmp281.yzx;
                            float3 tmp290 = tmp288 * float3(0.0f, 1.0f, 0.0f) - tmp289 * float3(1.0f, 0.0f, 0.0f);
                            float tmp291 = tmp284.x * tmp284.x + tmp284.y * tmp284.y + tmp284.z * tmp284.z;
                            float tmp292 = sqrt(tmp291);
                            float tmp293 = 1.0f / tmp292;
                            bool tmp294 = tmp291 <= 0.0f;
                            float3 tmp295 = float3(tmp292, 0.0f, 0.0f);
                            float3 tmp296 = tmp295.xxx;
                            float3 tmp297 = tmp295 * tmp295;
                            float3 tmp298 = tmp297.xxx;
                            float3 tmp299 = tmp284 / tmp296;
                            float3 tmp300 = float3(tmp294 ? 0.0f : (tmp287.z * tmp284.z + tmp287.x * tmp284.x + tmp287.y * tmp284.y) * tmp293, 0.0f, 0.0f);
                            float3 tmp301 = (tmp296 * tmp287 - tmp300.xxx * tmp284) / tmp298;
                            float3 tmp302 = float3(tmp294 ? 0.0f : (tmp290.z * tmp284.z + tmp290.x * tmp284.x + tmp290.y * tmp284.y) * tmp293, 0.0f, 0.0f);
                            float3 tmp303 = (tmp296 * tmp290 - tmp302.xxx * tmp284) / tmp298;
                            float3 tmp304 = tmp299.zxy;
                            float3 tmp305 = tmp299.yzx;
                            float3 tmp306 = tmp304 * tmp283 - tmp305 * tmp282;
                            float3 tmp307 = tmp301.zxy * tmp283 + tmp304 * tmp286 - (tmp301.yzx * tmp282 + tmp305 * tmp285);
                            float3 tmp308 = tmp303.zxy * tmp283 + tmp304 * tmp289 - (tmp303.yzx * tmp282 + tmp305 * tmp288);
                            float tmp309 = tmp306.x * tmp306.x + tmp306.y * tmp306.y + tmp306.z * tmp306.z;
                            float tmp310 = sqrt(tmp309);
                            float tmp311 = 1.0f / tmp310;
                            bool tmp312 = tmp309 <= 0.0f;
                            float3 tmp313 = float3(tmp310, 0.0f, 0.0f);
                            float3 tmp314 = tmp313.xxx;
                            float3 tmp315 = tmp313 * tmp313;
                            float3 tmp316 = tmp315.xxx;
                            float3 tmp317 = tmp306 / tmp314;
                            float3 tmp318 = float3(tmp312 ? 0.0f : (tmp307.z * tmp306.z + tmp307.x * tmp306.x + tmp307.y * tmp306.y) * tmp311, 0.0f, 0.0f);
                            float3 tmp319 = (tmp307 * tmp314 - tmp318.xxx * tmp306) / tmp316;
                            float3 tmp320 = float3(tmp312 ? 0.0f : (tmp308.z * tmp306.z + tmp308.x * tmp306.x + tmp308.y * tmp306.y) * tmp311, 0.0f, 0.0f);
                            float3 tmp321 = (tmp308 * tmp314 - tmp320.xxx * tmp306) / tmp316;
                            float4 tmp322 = tmp317.zzzz;
                            float4 tmp323 = tmp317.yyyy;
                            float4 tmp324 = tmp317.xxxx;
                            float4 tmp325 = tmp319.zzzz;
                            float4 tmp326 = tmp319.yyyy;
                            float4 tmp327 = tmp319.xxxx;
                            float4 tmp328 = tmp321.zzzz;
                            float4 tmp329 = tmp321.yyyy;
                            float4 tmp330 = tmp321.xxxx;
                            float4 tmp331 = tmp299.zzzz;
                            float4 tmp332 = tmp299.yyyy;
                            float4 tmp333 = tmp301.zzzz;
                            float4 tmp334 = tmp301.yyyy;
                            float4 tmp335 = tmp303.zzzz;
                            float4 tmp336 = tmp303.yyyy;
                            float4 tmp337 = tmp277.zzzz;
                            float4 tmp338 = tmp277.yyyy;
                            float4 tmp339 = tmp277.xxxx;
                            float4 tmp340 = tmp279.zzzz;
                            float4 tmp341 = tmp279.yyyy;
                            float4 tmp342 = tmp279.xxxx;
                            float4 tmp343 = tmp281.zzzz;
                            float4 tmp344 = tmp281.yyyy;
                            float4 tmp345 = tmp281.xxxx;
                            float4 tmp346 = float4(tmp299.xxxx.x, tmp299.xxxx.y, tmp299.xxxx.z, 0.0f);
                            float4 tmp347 = float4(tmp346.x, tmp324.x, tmp346.x, tmp346.w);
                            float4 tmp348 = float4(tmp301.xxxx.x, tmp301.xxxx.y, tmp301.xxxx.z, 0.0f);
                            float4 tmp349 = float4(tmp348.x, tmp327.x, tmp348.x, tmp348.w);
                            float4 tmp350 = float4(tmp303.xxxx.x, tmp303.xxxx.y, tmp303.xxxx.z, 0.0f);
                            float4 tmp351 = float4(tmp350.x, tmp330.x, tmp350.x, tmp350.w);
                            float4 tmp352 = float4(tmp332.y, tmp332.y, tmp332.y, 0.0f);
                            float4 tmp353 = float4(tmp352.x, tmp323.y, tmp352.x, tmp352.w);
                            float4 tmp354 = float4(tmp334.y, tmp334.y, tmp334.y, 0.0f);
                            float4 tmp355 = float4(tmp354.x, tmp326.y, tmp354.x, tmp354.w);
                            float4 tmp356 = float4(tmp336.y, tmp336.y, tmp336.y, 0.0f);
                            float4 tmp357 = float4(tmp356.x, tmp329.y, tmp356.x, tmp356.w);
                            float4 tmp358 = float4(tmp331.z, tmp331.z, tmp331.z, 0.0f);
                            float4 tmp359 = float4(tmp358.x, tmp322.z, tmp358.x, tmp358.w);
                            float4 tmp360 = float4(tmp333.z, tmp333.z, tmp333.z, 0.0f);
                            float4 tmp361 = float4(tmp360.x, tmp325.z, tmp360.x, tmp360.w);
                            float4 tmp362 = float4(tmp335.z, tmp335.z, tmp335.z, 0.0f);
                            float4 tmp363 = float4(tmp362.x, tmp328.z, tmp362.x, tmp362.w);
                            tmp364 = constr_deriv_type97(float4x4(float4(tmp347.x, tmp347.y, tmp339.x, tmp347.w), float4(tmp353.x, tmp353.y, tmp338.y, tmp353.w), float4(tmp359.x, tmp359.y, tmp337.z, tmp359.w), float4(phi_out262.x - (tmp299.y * phi_out123.y + tmp299.x * phi_out123.x + tmp299.z * phi_out123.z), phi_out262.y - (tmp317.y * phi_out123.y + tmp317.x * phi_out123.x + tmp317.z * phi_out123.z), -(tmp277.z * phi_out123.z + tmp277.y * phi_out123.y + tmp277.x * phi_out123.x), 1.0f)), float4x4(float4(tmp349.x, tmp349.y, tmp342.x, tmp349.w), float4(tmp355.x, tmp355.y, tmp341.y, tmp355.w), float4(tmp361.x, tmp361.y, tmp340.z, tmp361.w), float4(phi_out260.x - (tmp299.x * phi_out121.x + tmp299.z * phi_out121.z + tmp299.y * phi_out121.y + tmp301.z * phi_out123.z + tmp301.x * phi_out123.x + tmp301.y * phi_out123.y), phi_out260.y - (tmp317.x * phi_out121.x + tmp317.z * phi_out121.z + tmp317.y * phi_out121.y + tmp319.z * phi_out123.z + tmp319.x * phi_out123.x + tmp319.y * phi_out123.y), tmp279.x * tmp268 - (tmp277.x * phi_out121.x + tmp277.z * phi_out121.z + tmp277.y * phi_out121.y + tmp279.y * phi_out123.y + tmp279.z * phi_out123.z), 0.0f)), float4x4(float4(tmp351.x, tmp351.y, tmp345.x, tmp351.w), float4(tmp357.x, tmp357.y, tmp344.y, tmp357.w), float4(tmp363.x, tmp363.y, tmp343.z, tmp363.w), float4(phi_out258.x - (tmp299.x * phi_out119.x + tmp299.z * phi_out119.z + tmp299.y * phi_out119.y + tmp303.z * phi_out123.z + tmp303.x * phi_out123.x + tmp303.y * phi_out123.y), phi_out258.y - (tmp317.x * phi_out119.x + tmp317.z * phi_out119.z + tmp317.y * phi_out119.y + tmp321.z * phi_out123.z + tmp321.x * phi_out123.x + tmp321.y * phi_out123.y), tmp281.x * tmp268 - (tmp277.x * phi_out119.x + tmp277.z * phi_out119.z + tmp277.y * phi_out119.y + tmp281.y * phi_out123.y + tmp281.z * phi_out123.z), 0.0f)));
                            phi_in129 = 0;
                            phi_in131 = phi_out123.z;
                            phi_in133 = phi_out123.y;
                            phi_in135 = phi_out123.x;
                            phi_in137 = tmp364;
                        }
                    }
                }
            }
        }
        phi_out130 = phi_in129;
        phi_out132 = phi_in131;
        phi_out134 = phi_in133;
        phi_out136 = phi_in135;
        phi_out138 = phi_in137;
        phi_in365 = phi_out132;
        phi_in367 = phi_out134;
        phi_in369 = phi_out136;
        phi_in371 = phi_out138;
        if (phi_out130 != 0) {
            tmp373 = uint(phi_out57 + -7) < 2u;
            float4 tmp374 = float4(phi_out117.x * tmp80 + phi_out117.y * tmp84 + phi_out117.z * tmp88, phi_out117.x * tmp81 + phi_out117.y * tmp85 + phi_out117.z * tmp89, phi_out117.x * tmp82 + phi_out117.y * tmp86 + phi_out117.z * tmp90, 0.0f);
            tmp375 = phi_out123.y * tmp84 + tmp92 + phi_out123.x * tmp80 + phi_out123.z * tmp88;
            tmp376 = phi_out121.z * tmp88 + phi_out121.x * tmp80 + phi_out121.y * tmp84;
            tmp377 = phi_out119.z * tmp88 + phi_out119.x * tmp80 + phi_out119.y * tmp84;
            tmp378 = phi_out123.y * tmp85 + tmp93 + phi_out123.x * tmp81 + phi_out123.z * tmp89;
            tmp379 = phi_out121.z * tmp89 + phi_out121.x * tmp81 + phi_out121.y * tmp85;
            tmp380 = phi_out119.z * tmp89 + phi_out119.x * tmp81 + phi_out119.y * tmp85;
            tmp381 = phi_out121.x * tmp82;
            tmp382 = phi_out119.x * tmp82;
            tmp383 = phi_out121.y * tmp86;
            tmp384 = phi_out119.y * tmp86;
            tmp385 = phi_out121.z * tmp90;
            tmp386 = phi_out119.z * tmp90;
            tmp387 = phi_out123.y * tmp86 + tmp94 + phi_out123.x * tmp82 + phi_out123.z * tmp90;
            tmp388 = tmp375 * (phi_out115.x * tmp80 + phi_out115.y * tmp84 + phi_out115.z * tmp88) + tmp378 * (phi_out115.x * tmp81 + phi_out115.y * tmp85 + phi_out115.z * tmp89) + tmp387 * (phi_out115.x * tmp82 + phi_out115.y * tmp86 + phi_out115.z * tmp90) < 0.0f ? -tmp374 : tmp374;
            phi_in389 = 1;
            phi_in391 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in393 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in395 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in397 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in399 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in401 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in403 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in405 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in407 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in409 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in411 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            phi_in413 = float4(0.0f, 0.0f, 0.0f, 0.0f);
            if (phi_out57 != 8) {
                phi_in389 = 1;
                phi_in391 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in393 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in395 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in397 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in399 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in401 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in403 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in405 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in407 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in409 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in411 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                phi_in413 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                if (phi_out57 != 4) {
                    tmp415 = abs(tmp388.z);
                    phi_in389 = 1;
                    phi_in391 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in393 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in395 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in397 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in399 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in401 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in403 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in405 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in407 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in409 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in411 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    phi_in413 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                    if (!(tmp415 < abs(tmp388.x))) {
                        phi_in389 = 1;
                        phi_in391 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in393 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in395 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in397 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in399 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in401 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in403 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in405 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in407 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in409 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in411 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        phi_in413 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                        if (!(tmp415 < abs(tmp388.y))) {
                            phi_in389 = 0;
                            phi_in391 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in393 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in395 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in397 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in399 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in401 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in403 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in405 = float4(0.0f, 0.0f, 0.0f, 0.0f);
                            phi_in407 = tmp95;
                            phi_in409 = tmp91;
                            phi_in411 = tmp87;
                            phi_in413 = tmp83;
                            if (tmp388.z < 0.0f) {
                                tmp416 = float4(-tmp80, tmp83.y, tmp83.z, tmp83.w);
                                tmp417 = float4(-tmp84, tmp87.y, tmp87.z, tmp87.w);
                                tmp418 = float4(-tmp88, tmp91.y, tmp91.z, tmp91.w);
                                tmp419 = float4(-tmp92, tmp95.y, tmp95.z, tmp95.w);
                                phi_in389 = 0;
                                phi_in391 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in393 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in395 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in397 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in399 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in401 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in403 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in405 = float4(-0.0f, 0.0f, 0.0f, 0.0f);
                                phi_in407 = tmp419;
                                phi_in409 = tmp418;
                                phi_in411 = tmp417;
                                phi_in413 = tmp416;
                            }
                        }
                    }
                }
            }
            phi_out390 = phi_in389;
            phi_out392 = phi_in391;
            phi_out394 = phi_in393;
            phi_out396 = phi_in395;
            phi_out398 = phi_in397;
            phi_out400 = phi_in399;
            phi_out402 = phi_in401;
            phi_out404 = phi_in403;
            phi_out406 = phi_in405;
            phi_out408 = phi_in407;
            phi_out410 = phi_in409;
            phi_out412 = phi_in411;
            phi_out414 = phi_in413;
            phi_in420 = phi_out392;
            phi_in422 = phi_out394;
            phi_in424 = phi_out396;
            phi_in426 = phi_out398;
            phi_in428 = phi_out400;
            phi_in430 = phi_out402;
            phi_in432 = phi_out404;
            phi_in434 = phi_out406;
            phi_in436 = phi_out408;
            phi_in438 = phi_out410;
            phi_in440 = phi_out412;
            phi_in442 = phi_out414;
            if (phi_out390 != 0) {
                if (tmp373) {
                    tmp444 = tmp375 * tmp375 + tmp378 * tmp378;
                    tmp445 = sqrt(tmp444);
                    float tmp446 = 1.0f / tmp445;
                    tmp447 = (tmp375 * tmp376 + tmp378 * tmp379) * tmp446;
                    tmp448 = tmp446 * (tmp375 * tmp377 + tmp378 * tmp380);
                    phi_in449 = tmp448;
                    phi_in451 = tmp447;
                    phi_in453 = tmp445;
                    phi_in455 = tmp444;
                    phi_in457 = 0.0f;
                    phi_in459 = 0.0f;
                    phi_in461 = 0.3183098733f;
                } else {
                    tmp463 = tmp375 * tmp375 + tmp378 * tmp378;
                    tmp464 = sqrt(tmp463);
                    float tmp465 = 1.0f / tmp464;
                    tmp466 = tmp465 * (tmp375 * tmp376 + tmp378 * tmp379);
                    tmp467 = tmp465 * (tmp375 * tmp377 + tmp378 * tmp380);
                    bool tmp468 = tmp463 <= 0.0f;
                    tmp469 = tmp468 ? 0.0f : tmp466;
                    tmp470 = tmp468 ? 0.0f : tmp467;
                    phi_in449 = tmp467;
                    phi_in451 = tmp466;
                    phi_in453 = tmp464;
                    phi_in455 = tmp463;
                    phi_in457 = tmp470;
                    phi_in459 = tmp469;
                    phi_in461 = tmp464;
                }
                phi_out450 = phi_in449;
                phi_out452 = phi_in451;
                phi_out454 = phi_in453;
                phi_out456 = phi_in455;
                phi_out458 = phi_in457;
                phi_out460 = phi_in459;
                phi_out462 = phi_in461;
                float tmp471 = atan2(tmp378, tmp375);
                float tmp472 = -phi_out123.x;
                float3 tmp473 = float3(tmp375, tmp378, 0.0f);
                bool tmp474 = phi_out456 <= 0.0f;
                float3 tmp475 = float3(phi_out454, 0.0f, 0.0f);
                float3 tmp476 = tmp475.xxx;
                float3 tmp477 = tmp475 * tmp475;
                float3 tmp478 = tmp477.xxx;
                float3 tmp479 = tmp473 / tmp476;
                float3 tmp480 = float3(tmp474 ? 0.0f : phi_out452, 0.0f, 0.0f);
                float3 tmp481 = (tmp476 * float3(tmp376, tmp379, 0.0f) - tmp480.xxx * tmp473) / tmp478;
                float3 tmp482 = float3(tmp474 ? 0.0f : phi_out450, 0.0f, 0.0f);
                float3 tmp483 = (tmp476 * float3(tmp377, tmp380, 0.0f) - tmp482.xxx * tmp473) / tmp478;
                float3 tmp484 = tmp479 * float3(1.0f, 0.0f, 0.0f);
                float3 tmp485 = tmp479 * float3(0.0f, 1.0f, 0.0f);
                float3 tmp486 = tmp484.zxy - tmp485.yzx;
                float3 tmp487 = tmp481 * float3(1.0f, 0.0f, 0.0f);
                float3 tmp488 = tmp481 * float3(0.0f, 1.0f, 0.0f);
                float3 tmp489 = tmp487.zxy - tmp488.yzx;
                float3 tmp490 = tmp483 * float3(1.0f, 0.0f, 0.0f);
                float3 tmp491 = tmp483 * float3(0.0f, 1.0f, 0.0f);
                float3 tmp492 = tmp490.zxy - tmp491.yzx;
                float tmp493 = tmp486.x * tmp486.x + tmp486.y * tmp486.y + tmp486.z * tmp486.z;
                float tmp494 = sqrt(tmp493);
                float tmp495 = 1.0f / tmp494;
                bool tmp496 = tmp493 <= 0.0f;
                float3 tmp497 = float3(tmp494, 0.0f, 0.0f);
                float3 tmp498 = tmp497.xxx;
                float3 tmp499 = tmp497 * tmp497;
                float3 tmp500 = tmp499.xxx;
                float3 tmp501 = tmp486 / tmp498;
                float3 tmp502 = float3(tmp496 ? 0.0f : (tmp489.z * tmp486.z + tmp489.x * tmp486.x + tmp489.y * tmp486.y) * tmp495, 0.0f, 0.0f);
                float3 tmp503 = (tmp498 * tmp489 - tmp502.xxx * tmp486) / tmp500;
                float3 tmp504 = float3(tmp496 ? 0.0f : (tmp492.z * tmp486.z + tmp492.x * tmp486.x + tmp492.y * tmp486.y) * tmp495, 0.0f, 0.0f);
                float3 tmp505 = (tmp498 * tmp492 - tmp504.xxx * tmp486) / tmp500;
                float4 tmp506 = tmp501.zzzz;
                float4 tmp507 = tmp501.yyyy;
                float4 tmp508 = tmp501.xxxx;
                float4 tmp509 = tmp503.zzzz;
                float4 tmp510 = tmp503.yyyy;
                float4 tmp511 = tmp503.xxxx;
                float4 tmp512 = tmp505.zzzz;
                float4 tmp513 = tmp505.yyyy;
                float4 tmp514 = tmp505.xxxx;
                float4 tmp515 = tmp479.zzzz;
                float4 tmp516 = tmp479.yyyy;
                float4 tmp517 = tmp479.xxxx;
                float4 tmp518 = tmp481.zzzz;
                float4 tmp519 = tmp481.yyyy;
                float4 tmp520 = tmp481.xxxx;
                float4 tmp521 = tmp483.zzzz;
                float4 tmp522 = tmp483.yyyy;
                float4 tmp523 = tmp483.xxxx;
                float4 tmp524 = float4(tmp508.x, 0.0f, tmp508.x, 0.0f);
                tmp525 = float4(tmp524.x, tmp524.y, tmp517.x, tmp524.w);
                float4 tmp526 = float4(tmp511.x, 0.0f, tmp511.x, 0.0f);
                tmp527 = float4(tmp526.x, tmp526.y, tmp520.x, tmp526.w);
                float4 tmp528 = float4(tmp514.x, 0.0f, tmp514.x, 0.0f);
                tmp529 = float4(tmp528.x, tmp528.y, tmp523.x, tmp528.w);
                float4 tmp530 = float4(tmp507.y, 0.0f, tmp507.y, 0.0f);
                tmp531 = float4(tmp530.x, tmp530.y, tmp516.y, tmp530.w);
                float4 tmp532 = float4(tmp510.y, 0.0f, tmp510.y, 0.0f);
                tmp533 = float4(tmp532.x, tmp532.y, tmp519.y, tmp532.w);
                float4 tmp534 = float4(tmp513.y, 0.0f, tmp513.y, 0.0f);
                tmp535 = float4(tmp534.x, tmp534.y, tmp522.y, tmp534.w);
                float4 tmp536 = float4(tmp506.z, 1.0f, tmp506.z, 0.0f);
                tmp537 = float4(tmp536.x, tmp536.y, tmp515.z, tmp536.w);
                float4 tmp538 = float4(tmp509.z, 0.0f, tmp509.z, 0.0f);
                tmp539 = float4(tmp538.x, tmp538.y, tmp518.z, tmp538.w);
                float4 tmp540 = float4(tmp512.z, 0.0f, tmp512.z, 0.0f);
                tmp541 = float4(tmp540.x, tmp540.y, tmp521.z, tmp540.w);
                tmp542 = float4(tmp471 * phi_out462 - (tmp501.y * phi_out123.y + tmp501.x * phi_out123.x + tmp501.z * phi_out123.z), tmp387 - phi_out123.z, -(tmp479.z * phi_out123.z + tmp479.y * phi_out123.y + tmp479.x * phi_out123.x), 1.0f);
                tmp543 = float4(phi_out462 * (tmp375 * tmp379 - tmp378 * tmp376) / phi_out456 + tmp471 * phi_out460 - (tmp501.x * phi_out121.x + tmp501.z * phi_out121.z + tmp501.y * phi_out121.y + tmp503.z * phi_out123.z + tmp503.x * phi_out123.x + tmp503.y * phi_out123.y), tmp385 - phi_out121.z + tmp381 + tmp383, tmp481.x * tmp472 - (tmp479.x * phi_out121.x + tmp479.z * phi_out121.z + tmp479.y * phi_out121.y + tmp481.y * phi_out123.y + tmp481.z * phi_out123.z), 0.0f);
                tmp544 = float4(phi_out462 * (tmp375 * tmp380 - tmp378 * tmp377) / phi_out456 + tmp471 * phi_out458 - (tmp501.x * phi_out119.x + tmp501.z * phi_out119.z + tmp501.y * phi_out119.y + tmp505.z * phi_out123.z + tmp505.x * phi_out123.x + tmp505.y * phi_out123.y), tmp386 - phi_out119.z + tmp382 + tmp384, tmp483.x * tmp472 - (tmp479.x * phi_out119.x + tmp479.z * phi_out119.z + tmp479.y * phi_out119.y + tmp483.y * phi_out123.y + tmp483.z * phi_out123.z), 0.0f);
                phi_in420 = tmp544;
                phi_in422 = tmp541;
                phi_in424 = tmp535;
                phi_in426 = tmp529;
                phi_in428 = tmp543;
                phi_in430 = tmp539;
                phi_in432 = tmp533;
                phi_in434 = tmp527;
                phi_in436 = tmp542;
                phi_in438 = tmp537;
                phi_in440 = tmp531;
                phi_in442 = tmp525;
            }
            phi_out421 = phi_in420;
            phi_out423 = phi_in422;
            phi_out425 = phi_in424;
            phi_out427 = phi_in426;
            phi_out429 = phi_in428;
            phi_out431 = phi_in430;
            phi_out433 = phi_in432;
            phi_out435 = phi_in434;
            phi_out437 = phi_in436;
            phi_out439 = phi_in438;
            phi_out441 = phi_in440;
            phi_out443 = phi_in442;
            tmp545 = constr_deriv_type97(float4x4(phi_out443, phi_out441, phi_out439, phi_out437), float4x4(phi_out435, phi_out433, phi_out431, phi_out429), float4x4(phi_out427, phi_out425, phi_out423, phi_out421));
            phi_in365 = phi_out123.z;
            phi_in367 = phi_out123.y;
            phi_in369 = phi_out123.x;
            phi_in371 = tmp545;
        }
        phi_out366 = phi_in365;
        phi_out368 = phi_in367;
        phi_out370 = phi_in369;
        phi_out372 = phi_in371;
        tmp546 = phi_out372.dy;
        tmp547 = phi_out372.dx;
        float4x4 tmp548 = phi_out372.val;
        tmp549 = tmp548[3];
        float4 tmp550 = tmp548[2];
        float4 tmp551 = tmp548[1];
        float4 tmp552 = tmp548[0];
        tmp553 = float3(tmp552.y, tmp551.y, tmp550.y);
        tmp554 = texture_coordinate_system == 1;
        if (tmp554) {
            float3 tmp555 = float3(sqrt(tmp552.x * tmp552.x + tmp551.x * tmp551.x + tmp550.x * tmp550.x), 0.0f, 0.0f);
            tmp556 = float3(tmp552.x, tmp551.x, tmp550.x) / tmp555.xxx;
            tmp557 = tmp552.y * tmp552.y + tmp551.y * tmp551.y;
            tmp558 = tmp550.y * tmp550.y;
            phi_in559 = tmp558;
            phi_in561 = tmp557;
            phi_in563 = tmp553;
            phi_in565 = tmp556;
        } else {
            float4 tmp567 = state.object_to_world[0];
            float4 tmp568 = state.object_to_world[1];
            float4 tmp569 = state.object_to_world[2];
            float tmp570 = tmp567.x * tmp552.x + tmp567.y * tmp551.x + tmp567.z * tmp550.x;
            float tmp571 = tmp568.x * tmp552.x + tmp568.y * tmp551.x + tmp568.z * tmp550.x;
            float tmp572 = tmp569.x * tmp552.x + tmp569.y * tmp551.x + tmp569.z * tmp550.x;
            float3 tmp573 = float3(sqrt(tmp571 * tmp571 + tmp570 * tmp570 + tmp572 * tmp572), 0.0f, 0.0f);
            tmp574 = float3(tmp570, tmp571, tmp572) / tmp573.xxx;
            tmp575 = _ZN5state16transform_vectorEN5state16coordinate_spaceEN5state16coordinate_spaceEu6float3(state, 1, 0, constr_Derived_float3(tmp553, float3(tmp547[0].y, tmp547[1].y, tmp547[2].y), float3(tmp546[0].y, tmp546[1].y, tmp546[2].y))).val;
            tmp576 = tmp575.x * tmp575.x + tmp575.y * tmp575.y;
            tmp577 = tmp575.z * tmp575.z;
            phi_in559 = tmp577;
            phi_in561 = tmp576;
            phi_in563 = tmp575;
            phi_in565 = tmp574;
        }
        phi_out560 = phi_in559;
        phi_out562 = phi_in561;
        phi_out564 = phi_in563;
        phi_out566 = phi_in565;
        float3 tmp578 = float3(sqrt(phi_out562 + phi_out560), 0.0f, 0.0f);
        tmp579 = phi_out564 / tmp578.xxx;
        tmp580 = state.normal;
        float3 tmp581 = tmp580 * tmp579;
        phi_in582 = 1;
        phi_in584 = float3(0.0f, 0.0f, 0.0f);
        phi_in586 = float3(0.0f, 0.0f, 0.0f);
        if (!(abs(tmp581.x + tmp581.y + tmp581.z) > 0.9990000129f)) {
            float3 tmp588 = tmp580 * phi_out566;
            phi_in582 = 1;
            phi_in584 = float3(0.0f, 0.0f, 0.0f);
            phi_in586 = float3(0.0f, 0.0f, 0.0f);
            if (!(abs(tmp588.x + tmp588.y + tmp588.z) > 0.9990000129f)) {
                float3 tmp589 = tmp580.zxy;
                float3 tmp590 = tmp580.yzx;
                float3 tmp591 = tmp589 * tmp579.yzx - tmp590 * tmp579.zxy;
                float3 tmp592 = float3(sqrt(tmp591.x * tmp591.x + tmp591.y * tmp591.y + tmp591.z * tmp591.z), 0.0f, 0.0f);
                float3 tmp593 = tmp591 / tmp592.xxx;
                float3 tmp594 = tmp593.zxy * tmp590 - tmp593.yzx * tmp589;
                float3 tmp595 = float3(sqrt(tmp594.x * tmp594.x + tmp594.y * tmp594.y + tmp594.z * tmp594.z), 0.0f, 0.0f);
                tmp596 = tmp594 / tmp595.xxx;
                float3 tmp597 = tmp593 * phi_out566;
                tmp598 = tmp597.x + tmp597.y + tmp597.z < 0.0f ? -tmp593 : tmp593;
                float3 tmp599 = tmp596 * tmp579;
                phi_in582 = 0;
                phi_in584 = tmp598;
                phi_in586 = tmp596;
                if (tmp599.x + tmp599.y + tmp599.z < 0.0f) {
                    tmp600 = -tmp596;
                    phi_in582 = 0;
                    phi_in584 = tmp598;
                    phi_in586 = tmp600;
                }
            }
        }
        phi_out583 = phi_in582;
        phi_out585 = phi_in584;
        phi_out587 = phi_in586;
        phi_in601 = phi_out585;
        phi_in603 = phi_out587;
        if (phi_out583 != 0) {
            tmp605 = tmp554 ? 2 : 1;
            Derived_float3 tmp606 = _ZN5state16transform_vectorEN5state16coordinate_spaceEN5state16coordinate_spaceEu6float3(state, 0, tmp605, constr_Derived_float3(tmp580, float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f)));
            tmp607 = tmp606.val;
            tmp608 = tmp606.dx;
            tmp609 = tmp606.dy;
            tmp610 = tmp607.z * -tmp607.y;
            tmp611 = tmp607.z * -tmp608.y - tmp607.y * tmp608.z;
            tmp612 = tmp607.z * -tmp609.y - tmp607.y * tmp609.z;
            tmp613 = -tmp609.x;
            tmp614 = -tmp608.x;
            tmp615 = -tmp607.x;
            if (abs(tmp607.z) > 0.9999899864f) {
                float tmp616 = tmp607.y * tmp615;
                float tmp617 = tmp607.y * tmp614 - tmp607.x * tmp608.y;
                float tmp618 = tmp607.y * tmp613 - tmp607.x * tmp609.y;
                float tmp619 = tmp607.y * 2.0f;
                float tmp620 = tmp619 * tmp608.y;
                float tmp621 = tmp619 * tmp609.y;
                float tmp622 = 1.0f - tmp607.y * tmp607.y;
                float3 tmp623 = float3(tmp616, tmp622, tmp610);
                float tmp624 = tmp616 * tmp616 + tmp622 * tmp622 + tmp610 * tmp610;
                float tmp625 = sqrt(tmp624);
                float tmp626 = 1.0f / tmp625;
                bool tmp627 = tmp624 <= 0.0f;
                float3 tmp628 = float3(tmp625, 0.0f, 0.0f);
                float3 tmp629 = tmp628.xxx;
                float3 tmp630 = tmp628 * tmp628;
                tmp631 = tmp630.xxx;
                tmp632 = tmp623 / tmp629;
                float3 tmp633 = float3(tmp627 ? 0.0f : tmp626 * (tmp617 * tmp616 - tmp620 * tmp622 + tmp611 * tmp610), 0.0f, 0.0f);
                tmp634 = (tmp629 * float3(tmp617, -tmp620, tmp611) - tmp633.xxx * tmp623) / tmp631;
                float3 tmp635 = float3(tmp627 ? 0.0f : tmp626 * (tmp618 * tmp616 - tmp621 * tmp622 + tmp612 * tmp610), 0.0f, 0.0f);
                tmp636 = tmp635.xxx * tmp623;
                tmp637 = tmp629 * float3(tmp618, -tmp621, tmp612);
                phi_in638 = tmp636;
                phi_in640 = tmp637;
                phi_in642 = tmp631;
                phi_in644 = tmp632;
                phi_in646 = tmp634;
            } else {
                float tmp648 = tmp607.z * tmp615;
                float tmp649 = tmp607.z * tmp614 - tmp607.x * tmp608.z;
                float tmp650 = tmp607.z * tmp613 - tmp607.x * tmp609.z;
                float tmp651 = tmp607.z * 2.0f;
                float tmp652 = tmp651 * tmp608.z;
                float tmp653 = tmp651 * tmp609.z;
                float tmp654 = 1.0f - tmp607.z * tmp607.z;
                float3 tmp655 = float3(tmp648, tmp610, tmp654);
                float tmp656 = tmp648 * tmp648 + tmp610 * tmp610 + tmp654 * tmp654;
                float tmp657 = sqrt(tmp656);
                float tmp658 = 1.0f / tmp657;
                bool tmp659 = tmp656 <= 0.0f;
                float3 tmp660 = float3(tmp657, 0.0f, 0.0f);
                float3 tmp661 = tmp660.xxx;
                float3 tmp662 = tmp660 * tmp660;
                tmp663 = tmp662.xxx;
                tmp664 = tmp655 / tmp661;
                float3 tmp665 = float3(tmp659 ? 0.0f : tmp658 * (tmp649 * tmp648 - tmp652 * tmp654 + tmp611 * tmp610), 0.0f, 0.0f);
                tmp666 = (tmp661 * float3(tmp649, tmp611, -tmp652) - tmp665.xxx * tmp655) / tmp663;
                float3 tmp667 = float3(tmp659 ? 0.0f : tmp658 * (tmp650 * tmp648 - tmp653 * tmp654 + tmp612 * tmp610), 0.0f, 0.0f);
                tmp668 = tmp667.xxx * tmp655;
                tmp669 = tmp661 * float3(tmp650, tmp612, -tmp653);
                phi_in638 = tmp668;
                phi_in640 = tmp669;
                phi_in642 = tmp663;
                phi_in644 = tmp664;
                phi_in646 = tmp666;
            }
            phi_out639 = phi_in638;
            phi_out641 = phi_in640;
            phi_out643 = phi_in642;
            phi_out645 = phi_in644;
            phi_out647 = phi_in646;
            float3 tmp670 = (phi_out641 - phi_out639) / phi_out643;
            float3 tmp671 = phi_out645.yzx;
            float3 tmp672 = tmp607.zxy;
            float3 tmp673 = phi_out645.zxy;
            float3 tmp674 = tmp607.yzx;
            float3 tmp675 = tmp671 * tmp672 - tmp673 * tmp674;
            float3 tmp676 = phi_out647.yzx * tmp672 + tmp671 * tmp608.zxy - (phi_out647.zxy * tmp674 + tmp673 * tmp608.yzx);
            float3 tmp677 = tmp670.yzx * tmp672 + tmp671 * tmp609.zxy - (tmp670.zxy * tmp674 + tmp673 * tmp609.yzx);
            float tmp678 = tmp675.x * tmp675.x + tmp675.y * tmp675.y + tmp675.z * tmp675.z;
            float tmp679 = sqrt(tmp678);
            float tmp680 = 1.0f / tmp679;
            bool tmp681 = tmp678 <= 0.0f;
            float3 tmp682 = float3(tmp679, 0.0f, 0.0f);
            float3 tmp683 = tmp682.xxx;
            float3 tmp684 = tmp682 * tmp682;
            float3 tmp685 = tmp684.xxx;
            float3 tmp686 = float3(tmp681 ? 0.0f : tmp680 * (tmp676.z * tmp675.z + tmp676.x * tmp675.x + tmp676.y * tmp675.y), 0.0f, 0.0f);
            float3 tmp687 = float3(tmp681 ? 0.0f : (tmp677.z * tmp675.z + tmp677.x * tmp675.x + tmp677.y * tmp675.y) * tmp680, 0.0f, 0.0f);
            float3 tmp688 = _ZN5state16transform_vectorEN5state16coordinate_spaceEN5state16coordinate_spaceEu6float3(state, tmp605, 0, constr_Derived_float3(phi_out645, phi_out647, tmp670)).val;
            float3 tmp689 = float3(sqrt(tmp688.x * tmp688.x + tmp688.y * tmp688.y + tmp688.z * tmp688.z), 0.0f, 0.0f);
            tmp690 = tmp688 / tmp689.xxx;
            float3 tmp691 = _ZN5state16transform_vectorEN5state16coordinate_spaceEN5state16coordinate_spaceEu6float3(state, tmp605, 0, constr_Derived_float3(tmp675 / tmp683, (tmp683 * tmp676 - tmp686.xxx * tmp675) / tmp685, (tmp683 * tmp677 - tmp687.xxx * tmp675) / tmp685)).val;
            float3 tmp692 = float3(sqrt(tmp691.x * tmp691.x + tmp691.y * tmp691.y + tmp691.z * tmp691.z), 0.0f, 0.0f);
            tmp693 = tmp691 / tmp692.xxx;
            phi_in601 = tmp693;
            phi_in603 = tmp690;
        }
        phi_out602 = phi_in601;
        phi_out604 = phi_in603;
        tmp694 = float3(tmp551.x * phi_out368 + tmp549.x + tmp552.x * phi_out370 + tmp550.x * phi_out366, tmp551.y * phi_out368 + tmp549.y + tmp552.y * phi_out370 + tmp550.y * phi_out366, 0.0f);
        phi_in5 = phi_out602;
        phi_in7 = phi_out604;
        phi_in9 = 0;
        phi_in11 = tmp694;
    }
    phi_out6 = phi_in5;
    phi_out8 = phi_in7;
    phi_out10 = phi_in9;
    phi_out12 = phi_in11;
    float tmp695 = ((swap_st ? phi_out12.y : phi_out12.x) + s_offset.val) * s_scale.val;
    float tmp696 = ((swap_st ? phi_out12.x : phi_out12.y) + t_offset.val) * t_scale.val;
    float3 tmp697 = float3(s_flip ? -tmp695 : tmp695, t_flip ? -tmp696 : tmp696, 0.0f);
    float3 tmp698 = float3(s_flip ? -0.0f : 0.0f, t_flip ? -0.0f : 0.0f, 0.0f);
    return constr_deriv_type0(constr__ZN4base23texture_coordinate_infoE(float3(tmp697.x, tmp697.y, phi_out12.z), phi_out6, phi_out8, phi_out10), constr__ZN4base23texture_coordinate_infoE(tmp698, float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f), 0), constr__ZN4base23texture_coordinate_infoE(tmp698, float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f), 0));
}

structtype0 _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(
    in int texture0,
    in bool ignore_missing_texture,
    in float3 missing_color,
    in bool use_uv_coords,
    in Derived_float2 uv_coords,
    in int s_wrap,
    in int t_wrap,
    in deriv_type0 texture_coordinate_info)
{
    float3 tmp1;
    float3 tmp2;
    float3 tmp3;
    int phi_in;
    int phi_out;
    float phi_in4;
    float phi_out5;
    float3 phi_in6;
    float3 phi_out7;
    float phi_in8;
    float phi_out9;
    float3 phi_in10;
    float3 phi_out11;
    float3 sel;
    float3 sel4;
    float3 sel5;
    int phi_in12;
    int phi_out13;
    int phi_in14;
    int phi_out15;
    float phi_in16;
    float phi_out17;
    float3 phi_in18;
    float3 phi_out19;
    int phi_in20;
    int phi_out21;
    int phi_in22;
    int phi_out23;
    float phi_in24;
    float phi_out25;
    float3 phi_in26;
    float3 phi_out27;
    float3 tmp29;
    tmp1 = texture_coordinate_info.val.position;
    tmp2 = texture_coordinate_info.dx.position;
    tmp3 = texture_coordinate_info.dy.position;
    phi_in = 0;
    phi_in4 = 0.0f;
    phi_in6 = float3(0.0f, 0.0f, 0.0f);
    if (ignore_missing_texture) {
        phi_in = 0;
        phi_in4 = 0.0f;
        phi_in6 = float3(0.0f, 0.0f, 0.0f);
        if (!tex_texture_isvalid(texture0)) {
            phi_in = 1;
            phi_in4 = 0.0f;
            phi_in6 = missing_color;
        }
    }
    phi_out = phi_in;
    phi_out5 = phi_in4;
    phi_out7 = phi_in6;
    phi_in8 = phi_out5;
    phi_in10 = phi_out7;
    if (phi_out == 0) {
        phi_in8 = 0.0f;
        phi_in10 = missing_color;
        if (tex_width_2d(texture0, int2(0, 0), 0.0f) != 0) {
            phi_in8 = 0.0f;
            phi_in10 = missing_color;
            if (tex_height_2d(texture0, int2(0, 0), 0.0f) != 0) {
                float2 val = uv_coords.val;
                sel = use_uv_coords ? float3(0.0f, 0.0f, 0.0f) : tmp2;
                sel4 = use_uv_coords ? float3(0.0f, 0.0f, 0.0f) : tmp3;
                sel5 = use_uv_coords ? val.xyx : tmp1;
                if (s_wrap == 0) {
                    phi_in12 = 0;
                    phi_in14 = 1;
                    phi_in16 = 0.0f;
                    phi_in18 = float3(0.0f, 0.0f, 0.0f);
                } else if (s_wrap == 5) {
                    phi_in12 = 0;
                    phi_in14 = 3;
                    phi_in16 = 0.0f;
                    phi_in18 = float3(0.0f, 0.0f, 0.0f);
                    if (sel5.x < 0.0f || sel5.x > 1.0f) {
                        phi_in12 = 1;
                        phi_in14 = 0;
                        phi_in16 = 0.0f;
                        phi_in18 = missing_color;
                    }
                } else if (s_wrap == 2) {
                    phi_in12 = 0;
                    phi_in14 = 0;
                    phi_in16 = 0.0f;
                    phi_in18 = float3(0.0f, 0.0f, 0.0f);
                } else if (s_wrap == 3) {
                    phi_in12 = 0;
                    phi_in14 = 2;
                    phi_in16 = 0.0f;
                    phi_in18 = float3(0.0f, 0.0f, 0.0f);
                } else {
                    phi_in12 = 0;
                    phi_in14 = 3;
                    phi_in16 = 0.0f;
                    phi_in18 = float3(0.0f, 0.0f, 0.0f);
                }
                phi_out13 = phi_in12;
                phi_out15 = phi_in14;
                phi_out17 = phi_in16;
                phi_out19 = phi_in18;
                phi_in8 = phi_out17;
                phi_in10 = phi_out19;
                if (phi_out13 == 0) {
                    if (t_wrap == 0) {
                        phi_in20 = 0;
                        phi_in22 = 1;
                        phi_in24 = 0.0f;
                        phi_in26 = float3(0.0f, 0.0f, 0.0f);
                    } else if (t_wrap == 5) {
                        phi_in20 = 0;
                        phi_in22 = 3;
                        phi_in24 = 0.0f;
                        phi_in26 = float3(0.0f, 0.0f, 0.0f);
                        if (sel5.y < 0.0f || sel5.y > 1.0f) {
                            phi_in20 = 1;
                            phi_in22 = 0;
                            phi_in24 = 0.0f;
                            phi_in26 = missing_color;
                        }
                    } else if (t_wrap == 2) {
                        phi_in20 = 0;
                        phi_in22 = 0;
                        phi_in24 = 0.0f;
                        phi_in26 = float3(0.0f, 0.0f, 0.0f);
                    } else if (t_wrap == 3) {
                        phi_in20 = 0;
                        phi_in22 = 2;
                        phi_in24 = 0.0f;
                        phi_in26 = float3(0.0f, 0.0f, 0.0f);
                    } else {
                        phi_in20 = 0;
                        phi_in22 = 3;
                        phi_in24 = 0.0f;
                        phi_in26 = float3(0.0f, 0.0f, 0.0f);
                    }
                    phi_out21 = phi_in20;
                    phi_out23 = phi_in22;
                    phi_out25 = phi_in24;
                    phi_out27 = phi_in26;
                    phi_in8 = phi_out25;
                    phi_in10 = phi_out27;
                    if (phi_out21 == 0) {
                        float4 tmp28 = tex_lookup_deriv_float4_2d(texture0, constr_Derived_float2(sel5.xy, sel.xy, sel4.xy), phi_out15, phi_out23, float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f);
                        tmp29 = tmp28.xyz;
                        phi_in8 = tmp28.w;
                        phi_in10 = tmp29;
                    }
                }
            }
        }
    }
    phi_out9 = phi_in8;
    phi_out11 = phi_in10;
    return constr_structtype0(phi_out11, phi_out9);
}

float _ZN11OmniSurface10OmniShared19ior_preset_to_valueEN11OmniSurface10OmniShared11ior_presetsEU7uniformf(in int preset, in float custom)
{
    float phi_in;
    float phi_out;
    phi_in = 1.49000001f;
    if (preset != 0) {
        if (preset == 1)
            phi_in = 1.0f;
        else if (preset == 2)
            phi_in = 2.0f;
        else if (preset == 3)
            phi_in = 2.420000076f;
        else if (preset == 4)
            phi_in = 1.559999943f;
        else if (preset == 5)
            phi_in = 1.360000014f;
        else if (preset == 6)
            phi_in = 1.659999967f;
        else if (preset == 7)
            phi_in = 1.5f;
        else if (preset == 8)
            phi_in = 1.483999968f;
        else if (preset == 9)
            phi_in = 1.330000043f;
        else if (preset == 10)
            phi_in = 1.370000005f;
        else if (preset == 11)
            phi_in = 1.409999967f;
        else if (preset == 12)
            phi_in = 1.340000033f;
        else if (preset == 13)
            phi_in = 1.399999976f;
        else if (preset == 14)
            phi_in = 1.549999952f;
        else if (preset == 15)
            phi_in = 1.850000024f;
        else if (preset == 16)
            phi_in = 1.309999943f;
        else if (preset == 17)
            phi_in = 1.350000024f;
        else if (preset == 18)
            phi_in = 1.470000029f;
        else if (preset == 19)
            phi_in = 1.529999971f;
        else if (preset == 20)
            phi_in = 1.549999952f;
        else if (preset == 21)
            phi_in = 1.769999981f;
        else if (preset == 22)
            phi_in = 1.399999976f;
        else if (preset == 23)
            phi_in = 1.0f;
        else if (preset == 24)
            phi_in = 1.332999945f;
        else if (preset == 25)
            phi_in = 1.325000048f;
        else if (preset == 26)
            phi_in = 1.317999959f;
        else
            phi_in = custom;
    }
    phi_out = phi_in;
    return phi_out;
}

float3 _ZN11OmniSurface9OmniImage29tangent_space_normal_lookup_2EU7uniformu10texture_2dU7uniformbU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformbU7uniformbU7uniformfU7uniformbU7uniformbU7uniformbN4base23texture_coordinate_infoE(
    in Shading_state_material state,
    in int texture0,
    in bool ignore_missing_texture,
    in bool use_uv_coords,
    in Derived_float2 uv_coords,
    in int s_wrap,
    in int t_wrap,
    in bool s_flip,
    in bool t_flip,
    in float tangent_space_factor,
    in bool tangent_space_flip_r_channel,
    in bool tangent_space_flip_g_channel,
    in bool tangent_space_flip_b_channel,
    in deriv_type0 texture_coordinate_info)
{
    float3 tmp1;
    float3 tmp2;
    float3 tmp3;
    float3 tmp4;
    float3 tmp5;
    int phi_in;
    int phi_out;
    float phi_in6;
    float phi_out7;
    float phi_in8;
    float phi_out9;
    float3 phi_in10;
    float3 phi_out11;
    int phi_in12;
    int phi_out13;
    float phi_in14;
    float phi_out15;
    float phi_in16;
    float phi_out17;
    float3 phi_in18;
    float3 phi_out19;
    float3 sel;
    float3 sel175;
    float3 sel176;
    int phi_in20;
    int phi_out21;
    bool phi_in22;
    bool phi_out23;
    int phi_in24;
    int phi_out25;
    int phi_in26;
    int phi_out27;
    float phi_in28;
    float phi_out29;
    float phi_in30;
    float phi_out31;
    float3 phi_in32;
    float3 phi_out33;
    float3 tmp34;
    float tmp35;
    float tmp36;
    int phi_in37;
    int phi_out38;
    bool phi_in39;
    bool phi_out40;
    int phi_in41;
    int phi_out42;
    int phi_in43;
    int phi_out44;
    float phi_in45;
    float phi_out46;
    float phi_in47;
    float phi_out48;
    float3 phi_in49;
    float3 phi_out50;
    float3 tmp51;
    float tmp52;
    float tmp53;
    bool phi_in54;
    bool phi_out55;
    int phi_in56;
    int phi_out57;
    bool phi_in58;
    bool phi_out59;
    bool tmp60;
    bool tmp61;
    bool phi_in62;
    bool phi_out63;
    int phi_in64;
    int phi_out65;
    bool phi_in66;
    bool phi_out67;
    bool tmp68;
    bool tmp69;
    float3 tmp75;
    float tmp76;
    float tmp77;
    float phi_in78;
    float phi_out79;
    float phi_in80;
    float phi_out81;
    float3 phi_in82;
    float3 phi_out83;
    float3 tmp84;
    float tmp85;
    float tmp86;
    tmp1 = texture_coordinate_info.val.position;
    tmp2 = texture_coordinate_info.val.tangent_u;
    tmp3 = texture_coordinate_info.val.tangent_v;
    tmp4 = texture_coordinate_info.dx.position;
    tmp5 = texture_coordinate_info.dy.position;
    phi_in = 0;
    phi_in6 = 0.0f;
    phi_in8 = 0.0f;
    phi_in10 = float3(0.0f, 0.0f, 0.0f);
    if (ignore_missing_texture) {
        phi_in = 0;
        phi_in6 = 0.0f;
        phi_in8 = 0.0f;
        phi_in10 = float3(0.0f, 0.0f, 0.0f);
        if (!tex_texture_isvalid(texture0)) {
            phi_in = 1;
            phi_in6 = 0.0f;
            phi_in8 = 0.0f;
            phi_in10 = float3(0.0f, 0.0f, 0.0f);
        }
    }
    phi_out = phi_in;
    phi_out7 = phi_in6;
    phi_out9 = phi_in8;
    phi_out11 = phi_in10;
    if (phi_out == 0) {
        phi_in12 = 0;
        phi_in14 = 0.0f;
        phi_in16 = 0.0f;
        phi_in18 = float3(0.0f, 0.0f, 0.0f);
        if (tex_width_2d(texture0, int2(0, 0), 0.0f) != 0) {
            phi_in12 = 0;
            phi_in14 = 0.0f;
            phi_in16 = 0.0f;
            phi_in18 = float3(0.0f, 0.0f, 0.0f);
            if (tex_height_2d(texture0, int2(0, 0), 0.0f) != 0) {
                float2 val = uv_coords.val;
                sel = use_uv_coords ? float3(0.0f, 0.0f, 0.0f) : tmp5;
                sel175 = use_uv_coords ? float3(0.0f, 0.0f, 0.0f) : tmp4;
                sel176 = use_uv_coords ? val.xyx : tmp1;
                if (s_wrap == 0) {
                    phi_in20 = 0;
                    phi_in22 = false;
                    phi_in24 = 1;
                    phi_in26 = 0;
                    phi_in28 = 0.0f;
                    phi_in30 = 0.0f;
                    phi_in32 = float3(0.0f, 0.0f, 0.0f);
                } else if (s_wrap == 5) {
                    phi_in20 = 0;
                    phi_in22 = false;
                    phi_in24 = 3;
                    phi_in26 = 0;
                    phi_in28 = 0.0f;
                    phi_in30 = 0.0f;
                    phi_in32 = float3(0.0f, 0.0f, 0.0f);
                    if (sel176.x < 0.0f || sel176.x > 1.0f) {
                        tmp34 = tmp2 + tmp3 + state.normal;
                        tmp35 = tmp34.x * tmp34.x + tmp34.y * tmp34.y;
                        tmp36 = tmp34.z * tmp34.z;
                        phi_in20 = 1;
                        phi_in22 = false;
                        phi_in24 = 0;
                        phi_in26 = 1;
                        phi_in28 = tmp36;
                        phi_in30 = tmp35;
                        phi_in32 = tmp34;
                    }
                } else if (s_wrap == 2) {
                    phi_in20 = 0;
                    phi_in22 = false;
                    phi_in24 = 0;
                    phi_in26 = 0;
                    phi_in28 = 0.0f;
                    phi_in30 = 0.0f;
                    phi_in32 = float3(0.0f, 0.0f, 0.0f);
                } else if (s_wrap == 3) {
                    phi_in20 = 0;
                    phi_in22 = true;
                    phi_in24 = 2;
                    phi_in26 = 0;
                    phi_in28 = 0.0f;
                    phi_in30 = 0.0f;
                    phi_in32 = float3(0.0f, 0.0f, 0.0f);
                } else {
                    phi_in20 = 0;
                    phi_in22 = false;
                    phi_in24 = 3;
                    phi_in26 = 0;
                    phi_in28 = 0.0f;
                    phi_in30 = 0.0f;
                    phi_in32 = float3(0.0f, 0.0f, 0.0f);
                }
                phi_out21 = phi_in20;
                phi_out23 = phi_in22;
                phi_out25 = phi_in24;
                phi_out27 = phi_in26;
                phi_out29 = phi_in28;
                phi_out31 = phi_in30;
                phi_out33 = phi_in32;
                phi_in12 = phi_out27;
                phi_in14 = phi_out29;
                phi_in16 = phi_out31;
                phi_in18 = phi_out33;
                if (phi_out21 == 0) {
                    if (t_wrap == 0) {
                        phi_in37 = 0;
                        phi_in39 = false;
                        phi_in41 = 1;
                        phi_in43 = 0;
                        phi_in45 = 0.0f;
                        phi_in47 = 0.0f;
                        phi_in49 = float3(0.0f, 0.0f, 0.0f);
                    } else if (t_wrap == 5) {
                        phi_in37 = 0;
                        phi_in39 = false;
                        phi_in41 = 3;
                        phi_in43 = 0;
                        phi_in45 = 0.0f;
                        phi_in47 = 0.0f;
                        phi_in49 = float3(0.0f, 0.0f, 0.0f);
                        if (sel176.y < 0.0f || sel176.y > 1.0f) {
                            tmp51 = tmp2 + tmp3 + state.normal;
                            tmp52 = tmp51.x * tmp51.x + tmp51.y * tmp51.y;
                            tmp53 = tmp51.z * tmp51.z;
                            phi_in37 = 1;
                            phi_in39 = false;
                            phi_in41 = 0;
                            phi_in43 = 1;
                            phi_in45 = tmp53;
                            phi_in47 = tmp52;
                            phi_in49 = tmp51;
                        }
                    } else if (t_wrap == 2) {
                        phi_in37 = 0;
                        phi_in39 = false;
                        phi_in41 = 0;
                        phi_in43 = 0;
                        phi_in45 = 0.0f;
                        phi_in47 = 0.0f;
                        phi_in49 = float3(0.0f, 0.0f, 0.0f);
                    } else if (t_wrap == 3) {
                        phi_in37 = 0;
                        phi_in39 = true;
                        phi_in41 = 2;
                        phi_in43 = 0;
                        phi_in45 = 0.0f;
                        phi_in47 = 0.0f;
                        phi_in49 = float3(0.0f, 0.0f, 0.0f);
                    } else {
                        phi_in37 = 0;
                        phi_in39 = false;
                        phi_in41 = 3;
                        phi_in43 = 0;
                        phi_in45 = 0.0f;
                        phi_in47 = 0.0f;
                        phi_in49 = float3(0.0f, 0.0f, 0.0f);
                    }
                    phi_out38 = phi_in37;
                    phi_out40 = phi_in39;
                    phi_out42 = phi_in41;
                    phi_out44 = phi_in43;
                    phi_out46 = phi_in45;
                    phi_out48 = phi_in47;
                    phi_out50 = phi_in49;
                    phi_in12 = phi_out44;
                    phi_in14 = phi_out46;
                    phi_in16 = phi_out48;
                    phi_in18 = phi_out50;
                    if (phi_out38 == 0) {
                        phi_in54 = s_flip;
                        if (phi_out23) {
                            phi_in56 = 0;
                            phi_in58 = false;
                            if (sel176.x > 0.0f) {
                                phi_in56 = 0;
                                phi_in58 = false;
                                if (int(sel176.x) % 2 == 1) {
                                    tmp60 = s_flip != true;
                                    phi_in56 = 1;
                                    phi_in58 = tmp60;
                                }
                            }
                            phi_out57 = phi_in56;
                            phi_out59 = phi_in58;
                            phi_in54 = phi_out59;
                            if (phi_out57 == 0) {
                                phi_in54 = s_flip;
                                if (sel176.x < 0.0f) {
                                    tmp61 = (int(sel176.x) & 1) == 0 != s_flip;
                                    phi_in54 = tmp61;
                                }
                            }
                        }
                        phi_out55 = phi_in54;
                        phi_in62 = t_flip;
                        if (phi_out40) {
                            phi_in64 = 0;
                            phi_in66 = false;
                            if (sel176.y > 0.0f) {
                                phi_in64 = 0;
                                phi_in66 = false;
                                if (int(sel176.y) % 2 == 1) {
                                    tmp68 = t_flip != true;
                                    phi_in64 = 1;
                                    phi_in66 = tmp68;
                                }
                            }
                            phi_out65 = phi_in64;
                            phi_out67 = phi_in66;
                            phi_in62 = phi_out67;
                            if (phi_out65 == 0) {
                                phi_in62 = t_flip;
                                if (sel176.y < 0.0f) {
                                    tmp69 = (int(sel176.y) & 1) == 0 != t_flip;
                                    phi_in62 = tmp69;
                                }
                            }
                        }
                        phi_out63 = phi_in62;
                        float3 tmp70 = tex_lookup_deriv_float3_2d(texture0, constr_Derived_float2(sel176.xy, sel175.xy, sel.xy), phi_out25, phi_out42, float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f);
                        float3 result = tangent_space_flip_r_channel ? float3(1.0f - tmp70.x, tmp70.y, tmp70.z) : tmp70;
                        float3 result71 = tangent_space_flip_g_channel ? result : float3(result.x, 1.0f - result.y, result.z);
                        float3 tmp72 = float3(tangent_space_factor * 2.0f, 0.0f, 0.0f);
                        float3 tmp73 = ((tangent_space_flip_b_channel ? float3(result71.x, result71.y, 1.0f - result71.z) : result71) + float3(-0.5f, -0.5f, -0.5f)) * tmp72.xxx;
                        float3 tmp74 = float3(1.0f - tangent_space_factor + tmp73.z, 0.0f, 0.0f);
                        tmp75 = tmp73.xxx * (phi_out55 ? -tmp2 : tmp2) + tmp73.yyy * (phi_out63 ? -tmp3 : tmp3) + tmp74.xxx * state.normal;
                        tmp76 = tmp75.x * tmp75.x + tmp75.y * tmp75.y;
                        tmp77 = tmp75.z * tmp75.z;
                        phi_in12 = 1;
                        phi_in14 = tmp77;
                        phi_in16 = tmp76;
                        phi_in18 = tmp75;
                    }
                }
            }
        }
    } else {
        phi_in12 = 0;
        phi_in14 = 0.0f;
        phi_in16 = 0.0f;
        phi_in18 = float3(0.0f, 0.0f, 0.0f);
        if (phi_out != 1) {
            phi_in12 = 1;
            phi_in14 = phi_out7;
            phi_in16 = phi_out9;
            phi_in18 = phi_out11;
        }
    }
    phi_out13 = phi_in12;
    phi_out15 = phi_in14;
    phi_out17 = phi_in16;
    phi_out19 = phi_in18;
    phi_in78 = phi_out15;
    phi_in80 = phi_out17;
    phi_in82 = phi_out19;
    if (phi_out13 == 0) {
        tmp84 = tmp2 + tmp3 + state.normal;
        tmp85 = tmp84.x * tmp84.x + tmp84.y * tmp84.y;
        tmp86 = tmp84.z * tmp84.z;
        phi_in78 = tmp86;
        phi_in80 = tmp85;
        phi_in82 = tmp84;
    }
    phi_out79 = phi_in78;
    phi_out81 = phi_in80;
    phi_out83 = phi_in82;
    float3 tmp87 = float3(sqrt(phi_out81 + phi_out79), 0.0f, 0.0f);
    return phi_out83 / tmp87.xxx;
}

void mdl_init(inout Shading_state_material state)
{
    deriv_type0 tmp14;
    int tmp27;
    int tmp28;
    bool tmp29;
    float3 tmp30;
    bool tmp31;
    Derived_float2 tmp32;
    int tmp33;
    int tmp34;
    structtype0 tmp35;
    float3 tmp36;
    int tmp37;
    float tmp38;
    float phi_in;
    float phi_out;
    float tmp39;
    float tmp40;
    float tmp42;
    int tmp43;
    structtype0 tmp44;
    float3 tmp45;
    int tmp46;
    float tmp47;
    float phi_in48;
    float phi_out49;
    float tmp50;
    float tmp51;
    float tmp52;
    int tmp53;
    structtype0 tmp54;
    float3 tmp55;
    int tmp56;
    float tmp57;
    float phi_in58;
    float phi_out59;
    float tmp60;
    float tmp61;
    float tmp63;
    bool tmp65;
    structtype0 tmp66;
    float3 tmp67;
    int tmp68;
    float tmp69;
    float phi_in70;
    float phi_out71;
    float tmp72;
    float tmp73;
    float tmp74;
    int tmp75;
    structtype0 tmp76;
    float3 tmp77;
    int tmp78;
    float tmp79;
    float phi_in80;
    float phi_out81;
    float tmp82;
    float tmp83;
    float2 tmp88;
    float3 tmp92;
    bool tmp94;
    structtype0 tmp95;
    float3 tmp96;
    int tmp97;
    float tmp98;
    float phi_in99;
    float phi_out100;
    float tmp101;
    float tmp102;
    float tmp108;
    float tmp109;
    int tmp110;
    int tmp111;
    structtype0 tmp112;
    float3 tmp113;
    int tmp114;
    float tmp115;
    float phi_in116;
    float phi_out117;
    float tmp118;
    float tmp119;
    int tmp120;
    structtype0 tmp121;
    float3 tmp122;
    int tmp123;
    float tmp124;
    float phi_in125;
    float phi_out126;
    float tmp127;
    float tmp128;
    int tmp131;
    structtype0 tmp132;
    float3 tmp133;
    int tmp134;
    float tmp135;
    float phi_in136;
    float phi_out137;
    float tmp138;
    float tmp139;
    int tmp140;
    structtype0 tmp141;
    float3 tmp142;
    int tmp143;
    float tmp144;
    float phi_in145;
    float phi_out146;
    float tmp147;
    float tmp148;
    int tmp149;
    structtype0 tmp150;
    float3 tmp151;
    int tmp152;
    float tmp153;
    float phi_in154;
    float phi_out155;
    float tmp156;
    float tmp157;
    int tmp158;
    structtype0 tmp159;
    float3 tmp160;
    int tmp161;
    float tmp162;
    float phi_in163;
    float phi_out164;
    float tmp165;
    float tmp166;
    float2 tmp170;
    int tmp175;
    int tmp176;
    structtype0 tmp177;
    float3 tmp178;
    int tmp179;
    float tmp180;
    float phi_in181;
    float phi_out182;
    float tmp183;
    float tmp184;
    bool2 tmp187;
    int tmp188;
    structtype0 tmp189;
    float3 tmp190;
    int tmp191;
    float tmp192;
    float phi_in193;
    float phi_out194;
    float tmp195;
    float tmp196;
    float3 tmp198;
    float3 tmp202;
    float3 tmp204;
    bool2 tmp207;
    int tmp208;
    structtype0 tmp209;
    float3 tmp210;
    int tmp211;
    float tmp212;
    float phi_in213;
    float phi_out214;
    float tmp215;
    float tmp216;
    int tmp222;
    structtype0 tmp223;
    float3 tmp224;
    int tmp225;
    float tmp226;
    float phi_in227;
    float phi_out228;
    float tmp229;
    float tmp230;
    int tmp232;
    float3 tmp239;
    int tmp240;
    int tmp241;
    float3 tmp242;
    float3 phi_in243;
    float3 phi_out244;
    float3 tmp248;
    int tmp250;
    float3 tmp263;
    int tmp264;
    int tmp265;
    float3 tmp266;
    float3 phi_in267;
    float3 phi_out268;
    float3 tmp272;
    int tmp0 = state.arg_block_offset;
    int tmp1 = mdl_read_argblock_as_int(tmp0 + 56);
    int tmp2 = mdl_read_argblock_as_int(tmp0 + 60);
    Derived_float tmp3 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 64), 0.0f, 0.0f);
    Derived_float tmp4 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 68), 0.0f, 0.0f);
    Derived_float tmp5 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 72), 0.0f, 0.0f);
    Derived_float tmp6 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 76), 0.0f, 0.0f);
    bool tmp7 = mdl_read_argblock_as_bool(tmp0 + 80);
    bool tmp8 = mdl_read_argblock_as_bool(tmp0 + 81);
    bool tmp9 = mdl_read_argblock_as_bool(tmp0 + 82);
    int tmp10 = mdl_read_argblock_as_int(tmp0 + 84);
    Derived_float3 tmp11 = constr_Derived_float3(float3(mdl_read_argblock_as_float(tmp0 + 96), mdl_read_argblock_as_float(tmp0 + 100), mdl_read_argblock_as_float(tmp0 + 104)), float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f));
    Derived_float3 tmp12 = constr_Derived_float3(float3(mdl_read_argblock_as_float(tmp0 + 112), mdl_read_argblock_as_float(tmp0 + 116), mdl_read_argblock_as_float(tmp0 + 120)), float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f));
    Derived_float3 tmp13 = constr_Derived_float3(float3(mdl_read_argblock_as_float(tmp0 + 128), mdl_read_argblock_as_float(tmp0 + 132), mdl_read_argblock_as_float(tmp0 + 136)), float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f));
    tmp14 = _ZN11OmniSurface9OmniImage28compute_texture_coordinate_2EU7uniformN4base25texture_coordinate_systemEU7uniformiU7uniformfU7uniformfU7uniformfU7uniformfU7uniformbU7uniformbU7uniformbU7uniformN11OmniSurface9OmniImage15projection_modeEU7uniformu6float3U7uniformu6float3U7uniformu6float3(state, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmp10, tmp11, tmp12, tmp13);
    _ZN4base23texture_coordinate_infoE tmp15 = tmp14.val;
    float3 tmp16 = tmp15.position;
    state.text_results[0].x = tmp16.x;
    state.text_results[0].y = tmp16.y;
    state.text_results[0].z = tmp16.z;
    float3 tmp17 = tmp15.tangent_u;
    state.text_results[1].x = tmp17.x;
    state.text_results[1].y = tmp17.y;
    state.text_results[1].z = tmp17.z;
    float3 tmp18 = tmp15.tangent_v;
    state.text_results[2].x = tmp18.x;
    state.text_results[2].y = tmp18.y;
    state.text_results[2].z = tmp18.z;
    state.text_results[3].x = asfloat(tmp15.source_flags);
    _ZN4base23texture_coordinate_infoE tmp19 = tmp14.dx;
    float3 tmp20 = tmp19.position;
    state.text_results[4].x = tmp20.x;
    state.text_results[4].y = tmp20.y;
    state.text_results[4].z = tmp20.z;
    float3 tmp21 = tmp19.tangent_u;
    state.text_results[5].x = tmp21.x;
    state.text_results[5].y = tmp21.y;
    state.text_results[5].z = tmp21.z;
    float3 tmp22 = tmp19.tangent_v;
    state.text_results[6].x = tmp22.x;
    state.text_results[6].y = tmp22.y;
    state.text_results[6].z = tmp22.z;
    state.text_results[7].x = asfloat(tmp19.source_flags);
    _ZN4base23texture_coordinate_infoE tmp23 = tmp14.dy;
    float3 tmp24 = tmp23.position;
    state.text_results[8].x = tmp24.x;
    state.text_results[8].y = tmp24.y;
    state.text_results[8].z = tmp24.z;
    float3 tmp25 = tmp23.tangent_u;
    state.text_results[9].x = tmp25.x;
    state.text_results[9].y = tmp25.y;
    state.text_results[9].z = tmp25.z;
    float3 tmp26 = tmp23.tangent_v;
    state.text_results[10].x = tmp26.x;
    state.text_results[10].y = tmp26.y;
    state.text_results[10].z = tmp26.z;
    state.text_results[11].x = asfloat(tmp23.source_flags);
    tmp27 = state.arg_block_offset;
    tmp28 = mdl_read_argblock_as_int(tmp27 + 8);
    tmp29 = mdl_read_argblock_as_bool(tmp27 + 12);
    tmp30 = float3(mdl_read_argblock_as_float(tmp27 + 16), mdl_read_argblock_as_float(tmp27 + 20), mdl_read_argblock_as_float(tmp27 + 24));
    tmp31 = mdl_read_argblock_as_bool(tmp27 + 32);
    tmp32 = constr_Derived_float2(float2(mdl_read_argblock_as_float(tmp27 + 40), mdl_read_argblock_as_float(tmp27 + 44)), float2(0.0f, 0.0f), float2(0.0f, 0.0f));
    tmp33 = mdl_read_argblock_as_int(tmp27 + 48);
    tmp34 = mdl_read_argblock_as_int(tmp27 + 52);
    tmp35 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp28, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp36 = tmp35.m_0;
    tmp37 = mdl_read_argblock_as_int(tmp27 + 144);
    if (tmp37 == 0) {
        tmp38 = tmp35.m_1;
        phi_in = tmp38;
    } else if (tmp37 == 1)
        phi_in = tmp36.x;
    else if (tmp37 == 2)
        phi_in = tmp36.y;
    else if (tmp37 == 3)
        phi_in = tmp36.z;
    else if (tmp37 == 4)
        phi_in = 1.0f;
    else if (tmp37 == 7) {
        tmp39 = (tmp36.x + tmp36.y + tmp36.z) * 0.3333333433f;
        phi_in = tmp39;
    } else if (tmp37 == 6) {
        tmp40 = tmp36.x * 0.2126709968f + tmp36.y * 0.7151600122f + tmp36.z * 0.07216899842f;
        phi_in = tmp40;
    } else
        phi_in = 0.0f;
    phi_out = phi_in;
    float tmp41 = tex_texture_isvalid(tmp28) ? phi_out : mdl_read_argblock_as_float(tmp27 + 148);
    tmp42 = tmp41 * tmp41;
    state.text_results[12].x = tmp42;
    tmp43 = mdl_read_argblock_as_int(tmp27 + 152);
    tmp44 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp43, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp45 = tmp44.m_0;
    tmp46 = mdl_read_argblock_as_int(tmp27 + 156);
    if (tmp46 == 0) {
        tmp47 = tmp44.m_1;
        phi_in48 = tmp47;
    } else if (tmp46 == 1)
        phi_in48 = tmp45.x;
    else if (tmp46 == 2)
        phi_in48 = tmp45.y;
    else if (tmp46 == 3)
        phi_in48 = tmp45.z;
    else if (tmp46 == 4)
        phi_in48 = 1.0f;
    else if (tmp46 == 7) {
        tmp50 = (tmp45.x + tmp45.y + tmp45.z) * 0.3333333433f;
        phi_in48 = tmp50;
    } else if (tmp46 == 6) {
        tmp51 = tmp45.x * 0.2126709968f + tmp45.y * 0.7151600122f + tmp45.z * 0.07216899842f;
        phi_in48 = tmp51;
    } else
        phi_in48 = 0.0f;
    phi_out49 = phi_in48;
    tmp52 = tex_texture_isvalid(tmp43) ? phi_out49 : mdl_read_argblock_as_float(tmp27 + 160);
    state.text_results[12].y = tmp52;
    tmp53 = mdl_read_argblock_as_int(tmp27 + 296);
    tmp54 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp53, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp55 = tmp54.m_0;
    tmp56 = mdl_read_argblock_as_int(tmp27 + 300);
    if (tmp56 == 0) {
        tmp57 = tmp54.m_1;
        phi_in58 = tmp57;
    } else if (tmp56 == 1)
        phi_in58 = tmp55.x;
    else if (tmp56 == 2)
        phi_in58 = tmp55.y;
    else if (tmp56 == 3)
        phi_in58 = tmp55.z;
    else if (tmp56 == 4)
        phi_in58 = 1.0f;
    else if (tmp56 == 7) {
        tmp60 = (tmp55.x + tmp55.y + tmp55.z) * 0.3333333433f;
        phi_in58 = tmp60;
    } else if (tmp56 == 6) {
        tmp61 = tmp55.x * 0.2126709968f + tmp55.y * 0.7151600122f + tmp55.z * 0.07216899842f;
        phi_in58 = tmp61;
    } else
        phi_in58 = 0.0f;
    phi_out59 = phi_in58;
    float tmp62 = tex_texture_isvalid(tmp53) ? phi_out59 : mdl_read_argblock_as_float(tmp27 + 304);
    tmp63 = tmp62 * tmp62;
    state.text_results[12].z = tmp63;
    int tmp64 = mdl_read_argblock_as_int(tmp27 + 284);
    tmp65 = tex_texture_isvalid(tmp64);
    tmp66 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp64, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp67 = tmp66.m_0;
    tmp68 = mdl_read_argblock_as_int(tmp27 + 288);
    if (tmp68 == 0) {
        tmp69 = tmp66.m_1;
        phi_in70 = tmp69;
    } else if (tmp68 == 1)
        phi_in70 = tmp67.x;
    else if (tmp68 == 2)
        phi_in70 = tmp67.y;
    else if (tmp68 == 3)
        phi_in70 = tmp67.z;
    else if (tmp68 == 4)
        phi_in70 = 1.0f;
    else if (tmp68 == 7) {
        tmp72 = (tmp67.x + tmp67.y + tmp67.z) * 0.3333333433f;
        phi_in70 = tmp72;
    } else if (tmp68 == 6) {
        tmp73 = tmp67.x * 0.2126709968f + tmp67.y * 0.7151600122f + tmp67.z * 0.07216899842f;
        phi_in70 = tmp73;
    } else
        phi_in70 = 0.0f;
    phi_out71 = phi_in70;
    tmp74 = tmp65 ? phi_out71 : mdl_read_argblock_as_float(tmp27 + 292);
    tmp75 = mdl_read_argblock_as_int(tmp27 + 308);
    tmp76 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp75, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp77 = tmp76.m_0;
    tmp78 = mdl_read_argblock_as_int(tmp27 + 312);
    if (tmp78 == 0) {
        tmp79 = tmp76.m_1;
        phi_in80 = tmp79;
    } else if (tmp78 == 1)
        phi_in80 = tmp77.x;
    else if (tmp78 == 2)
        phi_in80 = tmp77.y;
    else if (tmp78 == 3)
        phi_in80 = tmp77.z;
    else if (tmp78 == 4)
        phi_in80 = 1.0f;
    else if (tmp78 == 7) {
        tmp82 = (tmp77.x + tmp77.y + tmp77.z) * 0.3333333433f;
        phi_in80 = tmp82;
    } else if (tmp78 == 6) {
        tmp83 = tmp77.x * 0.2126709968f + tmp77.y * 0.7151600122f + tmp77.z * 0.07216899842f;
        phi_in80 = tmp83;
    } else
        phi_in80 = 0.0f;
    phi_out81 = phi_in80;
    float tmp84 = tmp52 * tmp42 * (tex_texture_isvalid(tmp75) ? phi_out81 : mdl_read_argblock_as_float(tmp27 + 316));
    float tmp85 = (1.0f - tmp84) * tmp63 + tmp84;
    float tmp86 = sqrt(1.0f - min(max(tmp74, 0.0f), 0.9800000191f));
    float2 tmp87 = float2(tmp85, 0.0f);
    tmp88 = tmp74 != 0.0f ? float2(min(tmp85 / tmp86, 1.0f), tmp85 * tmp86) : tmp87.xx;
    state.text_results[13].x = tmp88.x;
    state.text_results[13].y = tmp88.y;
    int tmp89 = mdl_read_argblock_as_int(tmp27 + 188);
    float3 tmp90 = float3(tmp52, 0.0f, 0.0f);
    float3 tmp91 = tmp90.xxx;
    tmp92 = (tex_texture_isvalid(tmp89) ? _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp89, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14).m_0 : float3(mdl_read_argblock_as_float(tmp27 + 192), mdl_read_argblock_as_float(tmp27 + 196), mdl_read_argblock_as_float(tmp27 + 200))) * tmp91 + (float3(1.0f, 1.0f, 1.0f) - tmp91);
    state.text_results[13].z = tmp92.x;
    state.text_results[13].w = tmp92.y;
    state.text_results[14].x = tmp92.z;
    int tmp93 = mdl_read_argblock_as_int(tmp27 + 392);
    tmp94 = tex_texture_isvalid(tmp93);
    tmp95 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp93, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp96 = tmp95.m_0;
    tmp97 = mdl_read_argblock_as_int(tmp27 + 396);
    if (tmp97 == 0) {
        tmp98 = tmp95.m_1;
        phi_in99 = tmp98;
    } else if (tmp97 == 1)
        phi_in99 = tmp96.x;
    else if (tmp97 == 2)
        phi_in99 = tmp96.y;
    else if (tmp97 == 3)
        phi_in99 = tmp96.z;
    else if (tmp97 == 4)
        phi_in99 = 1.0f;
    else if (tmp97 == 7) {
        tmp101 = (tmp96.x + tmp96.y + tmp96.z) * 0.3333333433f;
        phi_in99 = tmp101;
    } else if (tmp97 == 6) {
        tmp102 = tmp96.x * 0.2126709968f + tmp96.y * 0.7151600122f + tmp96.z * 0.07216899842f;
        phi_in99 = tmp102;
    } else
        phi_in99 = 0.0f;
    phi_out100 = phi_in99;
    float tmp103 = tmp94 ? phi_out100 : mdl_read_argblock_as_float(tmp27 + 400);
    float tmp104 = tmp103 < 500.0f ? 500.0f : tmp103;
    float tmp105 = tmp104 * tmp104;
    float tmp106 = tmp105 * tmp104;
    float tmp107 = tmp105 * tmp105;
    tmp108 = (tmp104 * -1.446884639e+11f + 1.0f + tmp105 * 365139168.0f + tmp106 * -52449.67969f + tmp107 * 70.34281158f) / (tmp104 * -3.899100774e+10f + 1.0f + tmp105 * 77312264.0f + tmp106 * 19901.70508f + tmp107 * 67.80271912f);
    tmp109 = (tmp104 * -1.390761247e+11f + 1.0f + tmp105 * 608958592.0f + tmp106 * -868632.9375f + tmp107 * 408.2635498f) / (tmp104 * -9.494124298e+11f + -8568.175781f + tmp105 * 2402142464.0f + tmp106 * 147983.6094f + tmp107 * 181.1112061f);
    tmp110 = mdl_read_argblock_as_int(tmp27 + 404);
    tmp111 = mdl_read_argblock_as_int(tmp27 + 436);
    tmp112 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp111, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp113 = tmp112.m_0;
    tmp114 = mdl_read_argblock_as_int(tmp27 + 440);
    if (tmp114 == 0) {
        tmp115 = tmp112.m_1;
        phi_in116 = tmp115;
    } else if (tmp114 == 1)
        phi_in116 = tmp113.x;
    else if (tmp114 == 2)
        phi_in116 = tmp113.y;
    else if (tmp114 == 3)
        phi_in116 = tmp113.z;
    else if (tmp114 == 4)
        phi_in116 = 1.0f;
    else if (tmp114 == 7) {
        tmp118 = (tmp113.x + tmp113.y + tmp113.z) * 0.3333333433f;
        phi_in116 = tmp118;
    } else if (tmp114 == 6) {
        tmp119 = tmp113.x * 0.2126709968f + tmp113.y * 0.7151600122f + tmp113.z * 0.07216899842f;
        phi_in116 = tmp119;
    } else
        phi_in116 = 0.0f;
    phi_out117 = phi_in116;
    tmp120 = mdl_read_argblock_as_int(tmp27 + 448);
    tmp121 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp120, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp122 = tmp121.m_0;
    tmp123 = mdl_read_argblock_as_int(tmp27 + 452);
    if (tmp123 == 0) {
        tmp124 = tmp121.m_1;
        phi_in125 = tmp124;
    } else if (tmp123 == 1)
        phi_in125 = tmp122.x;
    else if (tmp123 == 2)
        phi_in125 = tmp122.y;
    else if (tmp123 == 3)
        phi_in125 = tmp122.z;
    else if (tmp123 == 4)
        phi_in125 = 1.0f;
    else if (tmp123 == 7) {
        tmp127 = (tmp122.x + tmp122.y + tmp122.z) * 0.3333333433f;
        phi_in125 = tmp127;
    } else if (tmp123 == 6) {
        tmp128 = tmp122.x * 0.2126709968f + tmp122.y * 0.7151600122f + tmp122.z * 0.07216899842f;
        phi_in125 = tmp128;
    } else
        phi_in125 = 0.0f;
    phi_out126 = phi_in125;
    float3 tmp129 = float3((mdl_read_argblock_as_int(tmp27 + 432) == 0 ? 1.0f : 3.141592741f) * (tex_texture_isvalid(tmp111) ? phi_out117 : mdl_read_argblock_as_float(tmp27 + 444)) * (tex_texture_isvalid(tmp120) ? phi_out126 : mdl_read_argblock_as_float(tmp27 + 456)), 0.0f, 0.0f);
    float3 tmp130 = (mdl_read_argblock_as_bool(tmp27 + 391) ? float3(max(tmp108 * 3.240600109f + -1.537199974f + tmp109 * -0.4986000061f, 0.0f), max(tmp108 * -0.9689000249f + 1.875800014f + tmp109 * 0.04149999842f, 0.0f), max(tmp108 * 0.05570000038f + -0.2039999962f + tmp109 * 1.057000041f, 0.0f)) : tex_texture_isvalid(tmp110) ? _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp110, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14).m_0 : float3(mdl_read_argblock_as_float(tmp27 + 416), mdl_read_argblock_as_float(tmp27 + 420), mdl_read_argblock_as_float(tmp27 + 424))) * tmp92 * tmp129.xxx;
    state.text_results[14].y = tmp130.x;
    state.text_results[14].z = tmp130.y;
    state.text_results[14].w = tmp130.z;
    tmp131 = mdl_read_argblock_as_int(tmp27 + 272);
    tmp132 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp131, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp133 = tmp132.m_0;
    tmp134 = mdl_read_argblock_as_int(tmp27 + 276);
    if (tmp134 == 0) {
        tmp135 = tmp132.m_1;
        phi_in136 = tmp135;
    } else if (tmp134 == 1)
        phi_in136 = tmp133.x;
    else if (tmp134 == 2)
        phi_in136 = tmp133.y;
    else if (tmp134 == 3)
        phi_in136 = tmp133.z;
    else if (tmp134 == 4)
        phi_in136 = 1.0f;
    else if (tmp134 == 7) {
        tmp138 = (tmp133.x + tmp133.y + tmp133.z) * 0.3333333433f;
        phi_in136 = tmp138;
    } else if (tmp134 == 6) {
        tmp139 = tmp133.x * 0.2126709968f + tmp133.y * 0.7151600122f + tmp133.z * 0.07216899842f;
        phi_in136 = tmp139;
    } else
        phi_in136 = 0.0f;
    phi_out137 = phi_in136;
    state.text_results[15].x = tex_texture_isvalid(tmp131) ? phi_out137 : mdl_read_argblock_as_float(tmp27 + 280);
    tmp140 = mdl_read_argblock_as_int(tmp27 + 208);
    tmp141 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp140, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp142 = tmp141.m_0;
    tmp143 = mdl_read_argblock_as_int(tmp27 + 212);
    if (tmp143 == 0) {
        tmp144 = tmp141.m_1;
        phi_in145 = tmp144;
    } else if (tmp143 == 1)
        phi_in145 = tmp142.x;
    else if (tmp143 == 2)
        phi_in145 = tmp142.y;
    else if (tmp143 == 3)
        phi_in145 = tmp142.z;
    else if (tmp143 == 4)
        phi_in145 = 1.0f;
    else if (tmp143 == 7) {
        tmp147 = (tmp142.x + tmp142.y + tmp142.z) * 0.3333333433f;
        phi_in145 = tmp147;
    } else if (tmp143 == 6) {
        tmp148 = tmp142.x * 0.2126709968f + tmp142.y * 0.7151600122f + tmp142.z * 0.07216899842f;
        phi_in145 = tmp148;
    } else
        phi_in145 = 0.0f;
    phi_out146 = phi_in145;
    state.text_results[15].y = tex_texture_isvalid(tmp140) ? phi_out146 : mdl_read_argblock_as_float(tmp27 + 216);
    tmp149 = mdl_read_argblock_as_int(tmp27 + 352);
    tmp150 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp149, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp151 = tmp150.m_0;
    tmp152 = mdl_read_argblock_as_int(tmp27 + 356);
    if (tmp152 == 0) {
        tmp153 = tmp150.m_1;
        phi_in154 = tmp153;
    } else if (tmp152 == 1)
        phi_in154 = tmp151.x;
    else if (tmp152 == 2)
        phi_in154 = tmp151.y;
    else if (tmp152 == 3)
        phi_in154 = tmp151.z;
    else if (tmp152 == 4)
        phi_in154 = 1.0f;
    else if (tmp152 == 7) {
        tmp156 = (tmp151.x + tmp151.y + tmp151.z) * 0.3333333433f;
        phi_in154 = tmp156;
    } else if (tmp152 == 6) {
        tmp157 = tmp151.x * 0.2126709968f + tmp151.y * 0.7151600122f + tmp151.z * 0.07216899842f;
        phi_in154 = tmp157;
    } else
        phi_in154 = 0.0f;
    phi_out155 = phi_in154;
    state.text_results[15].z = tex_texture_isvalid(tmp149) ? phi_out155 : mdl_read_argblock_as_float(tmp27 + 360);
    tmp158 = mdl_read_argblock_as_int(tmp27 + 164);
    tmp159 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp158, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp160 = tmp159.m_0;
    tmp161 = mdl_read_argblock_as_int(tmp27 + 168);
    if (tmp161 == 0) {
        tmp162 = tmp159.m_1;
        phi_in163 = tmp162;
    } else if (tmp161 == 1)
        phi_in163 = tmp160.x;
    else if (tmp161 == 2)
        phi_in163 = tmp160.y;
    else if (tmp161 == 3)
        phi_in163 = tmp160.z;
    else if (tmp161 == 4)
        phi_in163 = 1.0f;
    else if (tmp161 == 7) {
        tmp165 = (tmp160.x + tmp160.y + tmp160.z) * 0.3333333433f;
        phi_in163 = tmp165;
    } else if (tmp161 == 6) {
        tmp166 = tmp160.x * 0.2126709968f + tmp160.y * 0.7151600122f + tmp160.z * 0.07216899842f;
        phi_in163 = tmp166;
    } else
        phi_in163 = 0.0f;
    phi_out164 = phi_in163;
    float tmp167 = tex_texture_isvalid(tmp158) ? phi_out164 : mdl_read_argblock_as_float(tmp27 + 172);
    float tmp168 = sqrt(1.0f - min(max(tmp167, 0.0f), 0.9800000191f));
    float2 tmp169 = float2(tmp42, 0.0f);
    tmp170 = tmp167 != 0.0f ? float2(min(tmp42 / tmp168, 1.0f), tmp168 * tmp42) : tmp169.xx;
    state.text_results[16].x = tmp170.x;
    state.text_results[16].y = tmp170.y;
    float tmp171 = _ZN11OmniSurface10OmniShared19ior_preset_to_valueEN11OmniSurface10OmniShared11ior_presetsEU7uniformf(mdl_read_argblock_as_int(tmp27), mdl_read_argblock_as_float(tmp27 + 4));
    float tmp172 = (tmp171 + -1.0f) / (tmp171 + 1.0f);
    state.text_results[16].z = tmp172 * tmp172;
    float tmp173 = _ZN11OmniSurface10OmniShared19ior_preset_to_valueEN11OmniSurface10OmniShared11ior_presetsEU7uniformf(mdl_read_argblock_as_int(tmp27 + 332), mdl_read_argblock_as_float(tmp27 + 336));
    float tmp174 = (tmp173 + -1.0f) / (tmp173 + 1.0f);
    state.text_results[16].w = tmp174 * tmp174;
    tmp175 = mdl_read_argblock_as_int(tmp27 + 220);
    tmp176 = mdl_read_argblock_as_int(tmp27 + 240);
    tmp177 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp176, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp178 = tmp177.m_0;
    tmp179 = mdl_read_argblock_as_int(tmp27 + 244);
    if (tmp179 == 0) {
        tmp180 = tmp177.m_1;
        phi_in181 = tmp180;
    } else if (tmp179 == 1)
        phi_in181 = tmp178.x;
    else if (tmp179 == 2)
        phi_in181 = tmp178.y;
    else if (tmp179 == 3)
        phi_in181 = tmp178.z;
    else if (tmp179 == 4)
        phi_in181 = 1.0f;
    else if (tmp179 == 7) {
        tmp183 = (tmp178.x + tmp178.y + tmp178.z) * 0.3333333433f;
        phi_in181 = tmp183;
    } else if (tmp179 == 6) {
        tmp184 = tmp178.x * 0.2126709968f + tmp178.y * 0.7151600122f + tmp178.z * 0.07216899842f;
        phi_in181 = tmp184;
    } else
        phi_in181 = 0.0f;
    phi_out182 = phi_in181;
    float3 tmp185 = float3(tex_texture_isvalid(tmp176) ? phi_out182 : mdl_read_argblock_as_float(tmp27 + 248), 0.0f, 0.0f);
    float3 tmp186 = tmp185.xxx * (tex_texture_isvalid(tmp175) ? _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp175, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14).m_0 : float3(mdl_read_argblock_as_float(tmp27 + 224), mdl_read_argblock_as_float(tmp27 + 228), mdl_read_argblock_as_float(tmp27 + 232)));
    state.text_results[17].x = tmp186.x;
    state.text_results[17].y = tmp186.y;
    state.text_results[17].z = tmp186.z;
    tmp187 = tmp88 != float2(0.0f, 0.0f);
    tmp188 = mdl_read_argblock_as_int(tmp27 + 320);
    tmp189 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp188, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp190 = tmp189.m_0;
    tmp191 = mdl_read_argblock_as_int(tmp27 + 324);
    if (tmp191 == 0) {
        tmp192 = tmp189.m_1;
        phi_in193 = tmp192;
    } else if (tmp191 == 1)
        phi_in193 = tmp190.x;
    else if (tmp191 == 2)
        phi_in193 = tmp190.y;
    else if (tmp191 == 3)
        phi_in193 = tmp190.z;
    else if (tmp191 == 4)
        phi_in193 = 1.0f;
    else if (tmp191 == 7) {
        tmp195 = (tmp190.x + tmp190.y + tmp190.z) * 0.3333333433f;
        phi_in193 = tmp195;
    } else if (tmp191 == 6) {
        tmp196 = tmp190.x * 0.2126709968f + tmp190.y * 0.7151600122f + tmp190.z * 0.07216899842f;
        phi_in193 = tmp196;
    } else
        phi_in193 = 0.0f;
    phi_out194 = phi_in193;
    float tmp197 = tex_texture_isvalid(tmp188) ? phi_out194 : mdl_read_argblock_as_float(tmp27 + 328);
    tmp198 = state.tangent_u[0];
    float tmp199 = tmp197 * 6.283185482f;
    float3 tmp200 = float3(cos(tmp199), 0.0f, 0.0f);
    float3 tmp201 = state.normal;
    tmp202 = tmp201.yzx * tmp198.zxy - tmp201.zxy * tmp198.yzx;
    float3 tmp203 = float3(sqrt(tmp202.x * tmp202.x + tmp202.y * tmp202.y + tmp202.z * tmp202.z), 0.0f, 0.0f);
    tmp204 = tmp203.xxx;
    float3 tmp205 = float3(sin(tmp199), 0.0f, 0.0f);
    float3 tmp206 = (tmp187.x || tmp187.y) && tmp197 != 0.0f ? tmp200.xxx * tmp198 - tmp202 * tmp205.xxx / tmp204 : tmp198;
    state.text_results[17].w = tmp206.x;
    state.text_results[18].x = tmp206.y;
    state.text_results[18].y = tmp206.z;
    tmp207 = tmp170 != float2(0.0f, 0.0f);
    tmp208 = mdl_read_argblock_as_int(tmp27 + 176);
    tmp209 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp208, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp210 = tmp209.m_0;
    tmp211 = mdl_read_argblock_as_int(tmp27 + 180);
    if (tmp211 == 0) {
        tmp212 = tmp209.m_1;
        phi_in213 = tmp212;
    } else if (tmp211 == 1)
        phi_in213 = tmp210.x;
    else if (tmp211 == 2)
        phi_in213 = tmp210.y;
    else if (tmp211 == 3)
        phi_in213 = tmp210.z;
    else if (tmp211 == 4)
        phi_in213 = 1.0f;
    else if (tmp211 == 7) {
        tmp215 = (tmp210.x + tmp210.y + tmp210.z) * 0.3333333433f;
        phi_in213 = tmp215;
    } else if (tmp211 == 6) {
        tmp216 = tmp210.x * 0.2126709968f + tmp210.y * 0.7151600122f + tmp210.z * 0.07216899842f;
        phi_in213 = tmp216;
    } else
        phi_in213 = 0.0f;
    phi_out214 = phi_in213;
    float tmp217 = tex_texture_isvalid(tmp208) ? phi_out214 : mdl_read_argblock_as_float(tmp27 + 184);
    float tmp218 = tmp217 * 6.283185482f;
    float3 tmp219 = float3(cos(tmp218), 0.0f, 0.0f);
    float3 tmp220 = float3(sin(tmp218), 0.0f, 0.0f);
    float3 tmp221 = (tmp207.x || tmp207.y) && tmp217 != 0.0f ? tmp219.xxx * tmp198 - tmp220.xxx * tmp202 / tmp204 : tmp198;
    state.text_results[18].z = tmp221.x;
    state.text_results[18].w = tmp221.y;
    state.text_results[19].x = tmp221.z;
    tmp222 = mdl_read_argblock_as_int(tmp27 + 340);
    tmp223 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp222, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34, tmp14);
    tmp224 = tmp223.m_0;
    tmp225 = mdl_read_argblock_as_int(tmp27 + 344);
    if (tmp225 == 0) {
        tmp226 = tmp223.m_1;
        phi_in227 = tmp226;
    } else if (tmp225 == 1)
        phi_in227 = tmp224.x;
    else if (tmp225 == 2)
        phi_in227 = tmp224.y;
    else if (tmp225 == 3)
        phi_in227 = tmp224.z;
    else if (tmp225 == 4)
        phi_in227 = 1.0f;
    else if (tmp225 == 7) {
        tmp229 = (tmp224.x + tmp224.y + tmp224.z) * 0.3333333433f;
        phi_in227 = tmp229;
    } else if (tmp225 == 6) {
        tmp230 = tmp224.x * 0.2126709968f + tmp224.y * 0.7151600122f + tmp224.z * 0.07216899842f;
        phi_in227 = tmp230;
    } else
        phi_in227 = 0.0f;
    phi_out228 = phi_in227;
    float tmp231 = (tex_texture_isvalid(tmp222) ? phi_out228 : mdl_read_argblock_as_float(tmp27 + 348)) * min(max(tmp52, 0.0f), 1.0f) + 1.0f;
    state.text_results[19].y = pow(tmp186.x, tmp231);
    state.text_results[19].z = pow(tmp186.y, tmp231);
    state.text_results[19].w = pow(tmp186.z, tmp231);
    tmp232 = mdl_read_argblock_as_int(tmp27 + 364);
    bool tmp233 = mdl_read_argblock_as_bool(tmp27 + 80);
    bool tmp234 = mdl_read_argblock_as_bool(tmp27 + 81);
    float tmp235 = mdl_read_argblock_as_float(tmp27 + 368);
    bool tmp236 = mdl_read_argblock_as_bool(tmp27 + 372);
    bool tmp237 = mdl_read_argblock_as_bool(tmp27 + 373);
    bool tmp238 = mdl_read_argblock_as_bool(tmp27 + 374);
    tmp239 = _ZN11OmniSurface9OmniImage29tangent_space_normal_lookup_2EU7uniformu10texture_2dU7uniformbU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformbU7uniformbU7uniformfU7uniformbU7uniformbU7uniformbN4base23texture_coordinate_infoE(state, tmp232, tmp29, tmp31, tmp32, tmp33, tmp34, tmp233, tmp234, tmp235, tmp236, tmp237, tmp238, tmp14);
    tmp240 = state.arg_block_offset;
    tmp241 = mdl_read_argblock_as_int(tmp240 + 376);
    tmp242 = state.normal;
    phi_in243 = tmp242;
    if (sqrt(tmp239.x * tmp239.x + tmp239.y * tmp239.y + tmp239.z * tmp239.z) > 0.0f) {
        int tmp245 = tmp241 / 4;
        int tmp246 = tmp241 & 3;
        int tmp247 = 3 - tmp245 - tmp246;
        tmp248 = float3(tmp239[uint(tmp245) < 3u ? tmp245 : 0], tmp239[tmp246 == 3 ? 0 : tmp246], tmp239[uint(tmp247) < 3u ? tmp247 : 0]);
        phi_in243 = tmp248;
    }
    phi_out244 = phi_in243;
    float3 tmp249 = tex_texture_isvalid(tmp232) ? phi_out244 : tmp242;
    state.text_results[20].x = tmp249.x;
    state.text_results[20].y = tmp249.y;
    state.text_results[20].z = tmp249.z;
    tmp250 = mdl_read_argblock_as_int(tmp240 + 380);
    bool tmp251 = mdl_read_argblock_as_bool(tmp240 + 12);
    bool tmp252 = mdl_read_argblock_as_bool(tmp240 + 32);
    Derived_float2 tmp253 = constr_Derived_float2(float2(mdl_read_argblock_as_float(tmp240 + 40), mdl_read_argblock_as_float(tmp240 + 44)), float2(0.0f, 0.0f), float2(0.0f, 0.0f));
    int tmp254 = mdl_read_argblock_as_int(tmp240 + 48);
    int tmp255 = mdl_read_argblock_as_int(tmp240 + 52);
    bool tmp256 = mdl_read_argblock_as_bool(tmp240 + 80);
    bool tmp257 = mdl_read_argblock_as_bool(tmp240 + 81);
    float tmp258 = mdl_read_argblock_as_float(tmp240 + 384);
    bool tmp259 = mdl_read_argblock_as_bool(tmp240 + 388);
    bool tmp260 = mdl_read_argblock_as_bool(tmp240 + 389);
    bool tmp261 = mdl_read_argblock_as_bool(tmp240 + 390);
    deriv_type0 tmp262 = constr_deriv_type0(constr__ZN4base23texture_coordinate_infoE(state.text_results[0].xyz, state.text_results[1].xyz, state.text_results[2].xyz, asint(state.text_results[3].x)), constr__ZN4base23texture_coordinate_infoE(state.text_results[4].xyz, state.text_results[5].xyz, state.text_results[6].xyz, asint(state.text_results[7].x)), constr__ZN4base23texture_coordinate_infoE(state.text_results[8].xyz, state.text_results[9].xyz, state.text_results[10].xyz, asint(state.text_results[11].x)));
    tmp263 = _ZN11OmniSurface9OmniImage29tangent_space_normal_lookup_2EU7uniformu10texture_2dU7uniformbU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformbU7uniformbU7uniformfU7uniformbU7uniformbU7uniformbN4base23texture_coordinate_infoE(state, tmp250, tmp251, tmp252, tmp253, tmp254, tmp255, tmp256, tmp257, tmp258, tmp259, tmp260, tmp261, tmp262);
    tmp264 = state.arg_block_offset;
    tmp265 = mdl_read_argblock_as_int(tmp264 + 376);
    tmp266 = state.normal;
    phi_in267 = tmp266;
    if (sqrt(tmp263.x * tmp263.x + tmp263.y * tmp263.y + tmp263.z * tmp263.z) > 0.0f) {
        int tmp269 = tmp265 / 4;
        int tmp270 = tmp265 & 3;
        int tmp271 = 3 - tmp269 - tmp270;
        tmp272 = float3(tmp263[uint(tmp269) < 3u ? tmp269 : 0], tmp263[tmp270 == 3 ? 0 : tmp270], tmp263[uint(tmp271) < 3u ? tmp271 : 0]);
        phi_in267 = tmp272;
    }
    phi_out268 = phi_in267;
    float3 tmp273 = tex_texture_isvalid(tmp250) ? phi_out268 : tmp266;
    state.text_results[20].w = tmp273.x;
    state.text_results[21].x = tmp273.y;
    state.text_results[21].y = tmp273.z;
    int tmp274 = mdl_read_argblock_as_int(tmp264 + 252);
    float3 tmp275 = tex_texture_isvalid(tmp274) ? _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp274, mdl_read_argblock_as_bool(tmp264 + 12), float3(mdl_read_argblock_as_float(tmp264 + 16), mdl_read_argblock_as_float(tmp264 + 20), mdl_read_argblock_as_float(tmp264 + 24)), mdl_read_argblock_as_bool(tmp264 + 32), constr_Derived_float2(float2(mdl_read_argblock_as_float(tmp264 + 40), mdl_read_argblock_as_float(tmp264 + 44)), float2(0.0f, 0.0f), float2(0.0f, 0.0f)), mdl_read_argblock_as_int(tmp264 + 48), mdl_read_argblock_as_int(tmp264 + 52), constr_deriv_type0(constr__ZN4base23texture_coordinate_infoE(state.text_results[0].xyz, state.text_results[1].xyz, state.text_results[2].xyz, asint(state.text_results[3].x)), constr__ZN4base23texture_coordinate_infoE(state.text_results[4].xyz, state.text_results[5].xyz, state.text_results[6].xyz, asint(state.text_results[7].x)), constr__ZN4base23texture_coordinate_infoE(state.text_results[8].xyz, state.text_results[9].xyz, state.text_results[10].xyz, asint(state.text_results[11].x)))).m_0 : float3(mdl_read_argblock_as_float(tmp264 + 256), mdl_read_argblock_as_float(tmp264 + 260), mdl_read_argblock_as_float(tmp264 + 264));
    state.text_results[21].z = tmp275.x;
    state.text_results[21].w = tmp275.y;
    state.text_results[22].x = tmp275.z;
    float3 tmp276 = state.text_results[17].xyz * float3(0.9800000191f, 0.9800000191f, 0.9800000191f);
    float3 tmp277 = tmp276 + float3(0.009999999776f, 0.009999999776f, 0.009999999776f);
    float3 tmp278 = float3(sqrt(tmp277.x), sqrt(tmp277.y), sqrt(tmp277.z));
    float3 tmp279 = (tmp278 + float3(1.0f, 1.0f, 1.0f)) / (float3(1.0f, 1.0f, 1.0f) - tmp278);
    float3 tmp280 = float3(0.9900000095f, 0.9900000095f, 0.9900000095f) - tmp276;
    float3 tmp281 = float3(state.text_results[15].x, 0.0f, 0.0f);
    float3 tmp282 = tmp281.xxx * tmp275 * (tmp280 / (tmp276 + float3(1.00999999f, 1.00999999f, 1.00999999f)) - tmp279) + tmp279;
    state.text_results[22].y = tmp282.x;
    state.text_results[22].z = tmp282.y;
    state.text_results[22].w = tmp282.z;
    float3 tmp283 = tmp282 + float3(1.0f, 1.0f, 1.0f);
    float3 tmp284 = tmp282 + float3(-1.0f, -1.0f, -1.0f);
    float3 tmp285 = (tmp283 * tmp283 * tmp277 - tmp284 * tmp284) / tmp280;
    state.text_results[23].x = sqrt(max(tmp285.x, 0.0f));
    state.text_results[23].y = sqrt(max(tmp285.y, 0.0f));
    state.text_results[23].z = sqrt(max(tmp285.z, 0.0f));
    return;
}

void gen_custom_curve_layer_pdf(inout Bsdf_pdf_data p_00, in Shading_state_material p_11)
{
    float tmp2;
    float tmp3;
    float tmp4;
    float tmp6;
    float tmp7;
    float tmp8;
    float3 tmp9;
    float tmp11;
    float tmp12;
    float tmp13;
    float tmp14;
    float tmp15;
    float tmp16;
    float tmp17;
    float tmp18;
    float3 tmp20;
    float3 tmp21;
    float3 tmp22;
    float3 tmp23;
    float tmp25;
    float tmp27;
    float phi_in;
    float phi_out;
    float phi_in28;
    float phi_out29;
    float3 tmp31;
    float3 tmp32;
    float tmp34;
    float tmp35;
    float tmp36;
    float tmp37;
    float tmp38;
    float3 tmp39;
    float tmp41;
    float phi_in43;
    float phi_out44;
    float3 tmp49;
    float tmp51;
    float tmp65;
    float tmp67;
    float tmp68;
    float tmp69;
    float tmp70;
    float tmp71;
    float tmp72;
    float tmp73;
    float phi_in74;
    float phi_out75;
    float tmp76;
    float tmp77;
    float tmp78;
    float tmp79;
    float3 tmp81;
    float3 tmp82;
    float3 tmp83;
    float3 tmp84;
    float tmp86;
    float phi_in87;
    float phi_out88;
    float3 tmp90;
    float3 tmp91;
    float tmp93;
    float tmp94;
    float tmp95;
    float tmp96;
    float tmp97;
    float3 tmp98;
    float tmp100;
    float phi_in102;
    float phi_out103;
    float3 tmp108;
    float tmp110;
    float tmp124;
    float tmp126;
    float tmp127;
    float phi_in128;
    float phi_out129;
    float tmp130;
    float tmp131;
    float tmp132;
    float tmp134;
    float tmp135;
    float tmp136;
    float tmp137;
    bool tmp138;
    float3 tmp140;
    float3 tmp141;
    float3 tmp142;
    float3 tmp143;
    float tmp145;
    float3 tmp146;
    float3 tmp147;
    float3 tmp148;
    float tmp150;
    float phi_in151;
    float phi_out152;
    float3 phi_in153;
    float3 phi_out154;
    float3 phi_in155;
    float3 phi_out156;
    float3 phi_in157;
    float3 phi_out158;
    float phi_in159;
    float phi_out160;
    float3 tmp162;
    float3 tmp163;
    float3 tmp164;
    float tmp165;
    float tmp166;
    float tmp167;
    float tmp168;
    float tmp169;
    float3 tmp170;
    float tmp172;
    float3 tmp173;
    float tmp175;
    float phi_in176;
    float phi_out177;
    float3 tmp182;
    float tmp184;
    float tmp198;
    float tmp200;
    float phi_in201;
    float phi_out202;
    float tmp205;
    float tmp206;
    tmp2 = p_11.text_results[12].y;
    tmp3 = p_11.text_results[12].x;
    tmp4 = min(max(p_11.text_results[16].z, 0.0f), 1.0f);
    float3 tmp5 = p_11.geom_normal;
    tmp6 = p_00.k1.x;
    tmp7 = p_00.k1.y;
    tmp8 = p_00.k1.z;
    tmp9 = float3(tmp6, tmp7, tmp8);
    float3 tmp10 = tmp9 * tmp5;
    tmp11 = asfloat((asint(tmp10.x + tmp10.y + tmp10.z) & -2147483648) | 1065353216);
    tmp12 = p_11.text_results[16].y;
    tmp13 = p_11.text_results[16].x;
    tmp14 = max(tmp13, 1.000000012e-07f);
    tmp15 = max(tmp12, 1.000000012e-07f);
    tmp16 = tmp5.x * tmp11;
    tmp17 = tmp5.y * tmp11;
    tmp18 = tmp5.z * tmp11;
    float3 tmp19 = float3(p_11.text_results[18].z, p_11.text_results[18].w, p_11.text_results[19].x);
    tmp20 = float3(p_11.text_results[20].w * tmp11, p_11.text_results[21].x * tmp11, p_11.text_results[21].y * tmp11);
    tmp21 = tmp20.zxy;
    tmp22 = tmp20.yzx;
    tmp23 = tmp21 * tmp19.yzx - tmp22 * tmp19.zxy;
    float3 tmp24 = tmp23 * tmp23;
    tmp25 = tmp24.x + tmp24.y + tmp24.z;
    if (tmp25 < 9.999999939e-09f) {
        float3 tmp26 = tmp20 * tmp9;
        tmp27 = tmp26.x + tmp26.y + tmp26.z;
        phi_in = tmp27;
        phi_in28 = 0.0f;
    } else {
        float tmp30 = 1.0f / sqrt(tmp25);
        tmp31 = float3(tmp30 * tmp23.x, tmp30 * tmp23.y, tmp30 * tmp23.z);
        tmp32 = tmp31.zxy * tmp22 - tmp31.yzx * tmp21;
        if (p_00.ior1.x == -1.0f) {
            p_00.ior1.x = 1.0f;
            p_00.ior1.y = 1.0f;
            p_00.ior1.z = 1.0f;
        }
        if (p_00.ior2.x == -1.0f) {
            p_00.ior2.x = 1.0f;
            p_00.ior2.y = 1.0f;
            p_00.ior2.z = 1.0f;
        }
        float3 tmp33 = tmp20 * tmp9;
        tmp34 = tmp33.x + tmp33.y + tmp33.z;
        tmp35 = abs(tmp34);
        tmp36 = p_00.k2.x;
        tmp37 = p_00.k2.y;
        tmp38 = p_00.k2.z;
        tmp39 = float3(tmp36, tmp37, tmp38);
        float3 tmp40 = tmp39 * tmp20;
        tmp41 = abs(tmp40.x + tmp40.y + tmp40.z);
        float3 tmp42 = tmp39 * float3(tmp16, tmp17, tmp18);
        phi_in43 = 0.0f;
        if (!(tmp42.x + tmp42.y + tmp42.z < 0.0f)) {
            float tmp45 = tmp36 + tmp6;
            float tmp46 = tmp37 + tmp7;
            float tmp47 = tmp38 + tmp8;
            float3 tmp48 = float3(sqrt(tmp46 * tmp46 + tmp45 * tmp45 + tmp47 * tmp47), 0.0f, 0.0f);
            tmp49 = float3(tmp45, tmp46, tmp47) / tmp48.xxx;
            float3 tmp50 = tmp49 * tmp20;
            tmp51 = tmp50.x + tmp50.y + tmp50.z;
            float3 tmp52 = tmp49 * tmp9;
            float3 tmp53 = tmp49 * tmp39;
            phi_in43 = 0.0f;
            if (!(tmp53.x + tmp53.y + tmp53.z < 0.0f || (tmp51 < 0.0f || tmp52.x + tmp52.y + tmp52.z < 0.0f))) {
                float3 tmp54 = tmp49 * tmp32;
                float3 tmp55 = tmp49 * tmp31;
                float tmp56 = 1.0f / tmp14;
                float tmp57 = 1.0f / tmp15;
                float tmp58 = (tmp54.x + tmp54.y + tmp54.z) * tmp56;
                float tmp59 = (tmp55.x + tmp55.y + tmp55.z) * tmp57;
                float tmp60 = tmp58 * tmp58 + tmp51 * tmp51 + tmp59 * tmp59;
                float3 tmp61 = tmp32 * tmp9;
                float3 tmp62 = tmp31 * tmp9;
                float tmp63 = (tmp61.x + tmp61.y + tmp61.z) * tmp14;
                float tmp64 = (tmp62.x + tmp62.y + tmp62.z) * tmp15;
                tmp65 = tmp57 * 0.1591549367f * tmp56 * tmp51 / (tmp60 * tmp60 * ((sqrt((tmp63 * tmp63 + tmp64 * tmp64) / (tmp34 * tmp34) + 1.0f) + 1.0f) * tmp35 * tmp51));
                phi_in43 = tmp65;
            }
        }
        phi_out44 = phi_in43;
        float tmp66 = tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp35, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, min(max(sqrt(tmp13 * tmp12), 0.0f), 1.0f) * 0.984375f + 0.0078125f, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
        tmp67 = (0.3183098733f - tmp66 * 0.3183098733f) * tmp41 + tmp66 * phi_out44;
        phi_in = tmp34;
        phi_in28 = tmp67;
    }
    phi_out = phi_in;
    phi_out29 = phi_in28;
    tmp68 = 1.0f - min(max(min(max(phi_out, 0.0f), 1.0f), 0.0f), 1.0f);
    tmp69 = tmp68 * tmp68;
    tmp70 = p_11.text_results[20].x;
    tmp71 = p_11.text_results[20].y;
    tmp72 = p_11.text_results[20].z;
    tmp73 = min(max(p_11.text_results[15].y, 0.0f), 1.0f);
    phi_in74 = 0.0f;
    if (tmp73 > 0.0f) {
        tmp76 = p_11.text_results[13].y;
        tmp77 = p_11.text_results[13].x;
        tmp78 = max(tmp77, 1.000000012e-07f);
        tmp79 = max(tmp76, 1.000000012e-07f);
        float3 tmp80 = float3(p_11.text_results[17].w, p_11.text_results[18].x, p_11.text_results[18].y);
        tmp81 = float3(tmp70 * tmp11, tmp71 * tmp11, tmp72 * tmp11);
        tmp82 = tmp81.zxy;
        tmp83 = tmp81.yzx;
        tmp84 = tmp80.yzx * tmp82 - tmp80.zxy * tmp83;
        float3 tmp85 = tmp84 * tmp84;
        tmp86 = tmp85.x + tmp85.y + tmp85.z;
        phi_in87 = 0.0f;
        if (!(tmp86 < 9.999999939e-09f)) {
            float tmp89 = 1.0f / sqrt(tmp86);
            tmp90 = float3(tmp89 * tmp84.x, tmp89 * tmp84.y, tmp89 * tmp84.z);
            tmp91 = tmp90.zxy * tmp83 - tmp90.yzx * tmp82;
            if (p_00.ior1.x == -1.0f) {
                p_00.ior1.x = 1.0f;
                p_00.ior1.y = 1.0f;
                p_00.ior1.z = 1.0f;
            }
            if (p_00.ior2.x == -1.0f) {
                p_00.ior2.x = 1.0f;
                p_00.ior2.y = 1.0f;
                p_00.ior2.z = 1.0f;
            }
            float3 tmp92 = tmp81 * tmp9;
            tmp93 = tmp92.x + tmp92.y + tmp92.z;
            tmp94 = abs(tmp93);
            tmp95 = p_00.k2.x;
            tmp96 = p_00.k2.y;
            tmp97 = p_00.k2.z;
            tmp98 = float3(tmp95, tmp96, tmp97);
            float3 tmp99 = tmp98 * tmp81;
            tmp100 = abs(tmp99.x + tmp99.y + tmp99.z);
            float3 tmp101 = tmp98 * float3(tmp16, tmp17, tmp18);
            phi_in102 = 0.0f;
            if (!(tmp101.x + tmp101.y + tmp101.z < 0.0f)) {
                float tmp104 = tmp95 + tmp6;
                float tmp105 = tmp96 + tmp7;
                float tmp106 = tmp97 + tmp8;
                float3 tmp107 = float3(sqrt(tmp105 * tmp105 + tmp104 * tmp104 + tmp106 * tmp106), 0.0f, 0.0f);
                tmp108 = float3(tmp104, tmp105, tmp106) / tmp107.xxx;
                float3 tmp109 = tmp108 * tmp81;
                tmp110 = tmp109.x + tmp109.y + tmp109.z;
                float3 tmp111 = tmp108 * tmp9;
                float3 tmp112 = tmp108 * tmp98;
                phi_in102 = 0.0f;
                if (!(tmp112.x + tmp112.y + tmp112.z < 0.0f || (tmp110 < 0.0f || tmp111.x + tmp111.y + tmp111.z < 0.0f))) {
                    float3 tmp113 = tmp108 * tmp91;
                    float3 tmp114 = tmp108 * tmp90;
                    float tmp115 = 1.0f / tmp78;
                    float tmp116 = 1.0f / tmp79;
                    float tmp117 = (tmp113.x + tmp113.y + tmp113.z) * tmp115;
                    float tmp118 = (tmp114.x + tmp114.y + tmp114.z) * tmp116;
                    float tmp119 = tmp117 * tmp117 + tmp110 * tmp110 + tmp118 * tmp118;
                    float3 tmp120 = tmp91 * tmp9;
                    float3 tmp121 = tmp90 * tmp9;
                    float tmp122 = (tmp120.x + tmp120.y + tmp120.z) * tmp78;
                    float tmp123 = (tmp121.x + tmp121.y + tmp121.z) * tmp79;
                    tmp124 = tmp116 * 0.1591549367f * tmp115 * tmp110 / (tmp119 * tmp119 * ((sqrt((tmp122 * tmp122 + tmp123 * tmp123) / (tmp93 * tmp93) + 1.0f) + 1.0f) * tmp94 * tmp110));
                    phi_in102 = tmp124;
                }
            }
            phi_out103 = phi_in102;
            float tmp125 = tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp94, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, min(max(sqrt(tmp77 * tmp76), 0.0f), 1.0f) * 0.984375f + 0.0078125f, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
            tmp126 = (0.3183098733f - tmp125 * 0.3183098733f) * tmp100 + tmp125 * phi_out103;
            phi_in87 = tmp126;
        }
        phi_out88 = phi_in87;
        tmp127 = phi_out88 * tmp73;
        phi_in74 = tmp127;
    }
    phi_out75 = phi_in74;
    phi_in128 = phi_out75;
    if (tmp73 < 1.0f) {
        tmp130 = p_11.text_results[15].x;
        tmp131 = p_11.text_results[12].z;
        tmp132 = min(max(p_11.text_results[16].w, 0.0f), 1.0f);
        float3 tmp133 = float3(p_11.text_results[21].z, p_11.text_results[21].w, p_11.text_results[22].x) * float3(0.9200000167f, 0.9200000167f, 0.9200000167f);
        tmp134 = p_11.text_results[13].y;
        tmp135 = p_11.text_results[13].x;
        tmp136 = max(tmp135, 1.000000012e-07f);
        tmp137 = max(tmp134, 1.000000012e-07f);
        tmp138 = tmp133.z > 0.0f || (tmp133.x > 0.0f || tmp133.y > 0.0f);
        float3 tmp139 = float3(p_11.text_results[17].w, p_11.text_results[18].x, p_11.text_results[18].y);
        tmp140 = float3(tmp70 * tmp11, tmp71 * tmp11, tmp72 * tmp11);
        tmp141 = tmp140.zxy;
        tmp142 = tmp140.yzx;
        tmp143 = tmp139.yzx * tmp141 - tmp139.zxy * tmp142;
        float3 tmp144 = tmp143 * tmp143;
        tmp145 = tmp144.x + tmp144.y + tmp144.z;
        if (tmp145 < 9.999999939e-09f) {
            tmp146 = tmp140 * tmp9;
            tmp147 = p_00.k2;
            tmp148 = float3(tmp16, tmp17, tmp18);
            float3 tmp149 = tmp147 * tmp148;
            tmp150 = tmp149.x + tmp149.y + tmp149.z;
            phi_in151 = tmp150;
            phi_in153 = tmp148;
            phi_in155 = tmp147;
            phi_in157 = tmp146;
            phi_in159 = 0.0f;
        } else {
            float tmp161 = 1.0f / sqrt(tmp145);
            tmp162 = float3(tmp161 * tmp143.x, tmp161 * tmp143.y, tmp161 * tmp143.z);
            tmp163 = tmp162.zxy * tmp142 - tmp162.yzx * tmp141;
            if (p_00.ior1.x == -1.0f) {
                p_00.ior1.x = 1.0f;
                p_00.ior1.y = 1.0f;
                p_00.ior1.z = 1.0f;
            }
            if (p_00.ior2.x == -1.0f) {
                p_00.ior2.x = 1.0f;
                p_00.ior2.y = 1.0f;
                p_00.ior2.z = 1.0f;
            }
            tmp164 = tmp140 * tmp9;
            tmp165 = tmp164.x + tmp164.y + tmp164.z;
            tmp166 = abs(tmp165);
            tmp167 = p_00.k2.x;
            tmp168 = p_00.k2.y;
            tmp169 = p_00.k2.z;
            tmp170 = float3(tmp167, tmp168, tmp169);
            float3 tmp171 = tmp170 * tmp140;
            tmp172 = abs(tmp171.x + tmp171.y + tmp171.z);
            tmp173 = float3(tmp16, tmp17, tmp18);
            float3 tmp174 = tmp170 * tmp173;
            tmp175 = tmp174.x + tmp174.y + tmp174.z;
            phi_in176 = 0.0f;
            if (!(tmp175 < 0.0f)) {
                float tmp178 = tmp167 + tmp6;
                float tmp179 = tmp168 + tmp7;
                float tmp180 = tmp169 + tmp8;
                float3 tmp181 = float3(sqrt(tmp179 * tmp179 + tmp178 * tmp178 + tmp180 * tmp180), 0.0f, 0.0f);
                tmp182 = float3(tmp178, tmp179, tmp180) / tmp181.xxx;
                float3 tmp183 = tmp182 * tmp140;
                tmp184 = tmp183.x + tmp183.y + tmp183.z;
                float3 tmp185 = tmp182 * tmp9;
                float3 tmp186 = tmp182 * tmp170;
                phi_in176 = 0.0f;
                if (!(tmp186.x + tmp186.y + tmp186.z < 0.0f || (tmp184 < 0.0f || tmp185.x + tmp185.y + tmp185.z < 0.0f))) {
                    float3 tmp187 = tmp182 * tmp163;
                    float3 tmp188 = tmp182 * tmp162;
                    float tmp189 = 1.0f / tmp136;
                    float tmp190 = 1.0f / tmp137;
                    float tmp191 = (tmp187.x + tmp187.y + tmp187.z) * tmp189;
                    float tmp192 = (tmp188.x + tmp188.y + tmp188.z) * tmp190;
                    float tmp193 = tmp191 * tmp191 + tmp184 * tmp184 + tmp192 * tmp192;
                    float3 tmp194 = tmp163 * tmp9;
                    float3 tmp195 = tmp162 * tmp9;
                    float tmp196 = (tmp194.x + tmp194.y + tmp194.z) * tmp136;
                    float tmp197 = (tmp195.x + tmp195.y + tmp195.z) * tmp137;
                    tmp198 = tmp190 * 0.1591549367f * tmp189 * tmp184 / (tmp193 * tmp193 * ((sqrt((tmp196 * tmp196 + tmp197 * tmp197) / (tmp165 * tmp165) + 1.0f) + 1.0f) * tmp166 * tmp184));
                    phi_in176 = tmp198;
                }
            }
            phi_out177 = phi_in176;
            phi_in151 = tmp175;
            phi_in153 = tmp173;
            phi_in155 = tmp170;
            phi_in157 = tmp164;
            phi_in159 = phi_out177;
            if (tmp138) {
                float tmp199 = tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp166, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, min(max(sqrt(tmp135 * tmp134), 0.0f), 1.0f) * 0.984375f + 0.0078125f, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                tmp200 = (0.3183098733f - tmp199 * 0.3183098733f) * tmp172 + tmp199 * phi_out177;
                phi_in151 = tmp175;
                phi_in153 = tmp173;
                phi_in155 = tmp170;
                phi_in157 = tmp164;
                phi_in159 = tmp200;
            }
        }
        phi_out152 = phi_in151;
        phi_out154 = phi_in153;
        phi_out156 = phi_in155;
        phi_out158 = phi_in157;
        phi_out160 = phi_in159;
        phi_in201 = 0.0f;
        if (phi_out152 > 0.0f) {
            float3 tmp203 = phi_out154 * tmp140;
            float3 tmp204 = phi_out156 * tmp140;
            tmp205 = max(tmp204.x + tmp204.y + tmp204.z, 0.0f) / (max(tmp203.x + tmp203.y + tmp203.z, 0.0f) * 1.570796371f + 1.570796371f);
            phi_in201 = tmp205;
        }
        phi_out202 = phi_in201;
        tmp206 = ((phi_out160 - phi_out202) * min(max(tmp130, 0.0f), 1.0f) * (pow(1.0f - min(max(min(max(phi_out158.x + phi_out158.y + phi_out158.z, 0.0f), 1.0f), 0.0f), 1.0f), 4.0f) * (min(max(1.0f - tmp131, 0.0f), 1.0f) - tmp132) + tmp132) + phi_out202) * (1.0f - tmp73) + phi_out75;
        phi_in128 = tmp206;
    }
    phi_out129 = phi_in128;
    p_00.pdf = (tmp69 * tmp69 * (tmp68 * (min(max(1.0f - tmp3, 0.0f), 1.0f) - tmp4)) + tmp4) * min(max(tmp2, 0.0f), 1.0f) * (phi_out29 - phi_out129) + phi_out129;
    return;
}

void mdl_surface_scattering_sample(inout Bsdf_sample_data sret_ptr, in Shading_state_material state)
{
    Bsdf_pdf_data pdf_data;
    float tmp0;
    float tmp1;
    float3 tmp2;
    float tmp3;
    float tmp4;
    float tmp5;
    float3 tmp6;
    float tmp8;
    float tmp9;
    float tmp10;
    float tmp11;
    float3 tmp12;
    float tmp14;
    float tmp17;
    float tmp18;
    float tmp19;
    float tmp20;
    bool tmp21;
    float tmp22;
    float phi_in;
    float phi_out;
    float tmp23;
    float tmp24;
    float tmp25;
    float tmp26;
    float tmp27;
    float tmp28;
    float tmp29;
    float tmp30;
    float3 tmp32;
    float3 tmp33;
    float3 tmp34;
    float tmp36;
    int phi_in37;
    int phi_out38;
    float tmp40;
    float tmp41;
    float tmp42;
    float3 tmp43;
    float3 tmp44;
    float tmp47;
    float tmp48;
    float tmp51;
    float tmp52;
    float tmp53;
    float3 tmp55;
    float phi_in56;
    float phi_out57;
    float phi_in58;
    float phi_out59;
    float phi_in60;
    float phi_out61;
    float tmp69;
    float tmp70;
    float tmp71;
    float tmp72;
    float phi_in73;
    float phi_out74;
    float phi_in75;
    float phi_out76;
    float tmp77;
    int phi_in86;
    int phi_out87;
    bool phi_in88;
    bool phi_out89;
    float tmp90;
    float tmp91;
    float tmp92;
    float tmp94;
    float3 tmp99;
    float tmp105;
    float phi_in106;
    float phi_out107;
    float tmp108;
    float tmp109;
    float tmp110;
    float tmp124;
    float tmp125;
    float tmp126;
    float tmp127;
    float tmp128;
    float tmp129;
    float tmp130;
    bool tmp131;
    float tmp132;
    float phi_in133;
    float phi_out134;
    float tmp135;
    float tmp136;
    float tmp137;
    float tmp138;
    float tmp139;
    float tmp140;
    float tmp141;
    float tmp142;
    float tmp143;
    float tmp144;
    float tmp145;
    float tmp146;
    float tmp147;
    float tmp148;
    float tmp149;
    float tmp150;
    float tmp151;
    float3 tmp153;
    float3 tmp154;
    float3 tmp155;
    float3 tmp156;
    float tmp158;
    int phi_in159;
    int phi_out160;
    float tmp162;
    float tmp163;
    float tmp164;
    float3 tmp165;
    float3 tmp166;
    float tmp171;
    float tmp172;
    float tmp175;
    float tmp176;
    float tmp177;
    float3 tmp179;
    float phi_in180;
    float phi_out181;
    float phi_in182;
    float phi_out183;
    float phi_in184;
    float phi_out185;
    float tmp193;
    float tmp194;
    float tmp195;
    float tmp196;
    float phi_in197;
    float phi_out198;
    float phi_in199;
    float phi_out200;
    float tmp201;
    int phi_in210;
    int phi_out211;
    bool phi_in212;
    bool phi_out213;
    float tmp214;
    float tmp215;
    float tmp216;
    float tmp218;
    float3 tmp223;
    float tmp229;
    float phi_in230;
    float phi_out231;
    float tmp232;
    float tmp233;
    float tmp234;
    int phi_in248;
    int phi_out249;
    float tmp255;
    float tmp256;
    float phi_in257;
    float phi_out258;
    float phi_in259;
    float phi_out260;
    float phi_in261;
    float phi_out262;
    float tmp263;
    float tmp264;
    int tmp306;
    float tmp307;
    float tmp308;
    float tmp309;
    float tmp310;
    float tmp311;
    float3 tmp312;
    float tmp314;
    float tmp315;
    float tmp316;
    float tmp317;
    bool tmp318;
    float tmp319;
    float phi_in320;
    float phi_out321;
    float tmp322;
    float tmp327;
    float tmp328;
    float tmp329;
    float tmp330;
    bool tmp331;
    float tmp332;
    float tmp333;
    float tmp334;
    float tmp335;
    float tmp336;
    float tmp337;
    float tmp338;
    float tmp339;
    float tmp340;
    float3 tmp342;
    float3 tmp343;
    float3 tmp344;
    float tmp346;
    int phi_in347;
    int phi_out348;
    float tmp350;
    float tmp351;
    float tmp352;
    float3 tmp353;
    float3 tmp354;
    float tmp357;
    float tmp358;
    float tmp361;
    float tmp362;
    float tmp363;
    float3 tmp365;
    float phi_in366;
    float phi_out367;
    float phi_in368;
    float phi_out369;
    float phi_in370;
    float phi_out371;
    float tmp379;
    float tmp380;
    float tmp381;
    float tmp382;
    float phi_in383;
    float phi_out384;
    float phi_in385;
    float phi_out386;
    float tmp387;
    int phi_in396;
    int phi_out397;
    bool phi_in398;
    bool phi_out399;
    float tmp400;
    float tmp401;
    float tmp402;
    float tmp404;
    float3 tmp409;
    float tmp415;
    float phi_in416;
    float phi_out417;
    float tmp418;
    float tmp419;
    float tmp420;
    float3 tmp435;
    float3 tmp436;
    float3 tmp437;
    float tmp439;
    float tmp441;
    float tmp442;
    float tmp443;
    float tmp446;
    float tmp447;
    float tmp448;
    float tmp449;
    float3 tmp450;
    float tmp452;
    float tmp453;
    float tmp454;
    float tmp455;
    bool tmp456;
    float tmp457;
    float phi_in458;
    float phi_out459;
    float tmp460;
    float tmp461;
    float3 phi_in462;
    float3 phi_out463;
    float tmp466;
    float tmp467;
    float tmp468;
    float tmp469;
    float tmp470;
    float phi_in471;
    float phi_out472;
    float phi_in473;
    float phi_out474;
    float phi_in475;
    float phi_out476;
    float tmp477;
    float tmp478;
    float3 tmp479;
    float tmp480;
    float tmp481;
    float tmp482;
    float phi_in483;
    float phi_out484;
    float phi_in485;
    float phi_out486;
    float phi_in487;
    float phi_out488;
    float phi_in489;
    float phi_out490;
    float phi_in491;
    float phi_out492;
    float phi_in493;
    float phi_out494;
    float phi_in499;
    float phi_out500;
    float phi_in501;
    float phi_out502;
    float tmp503;
    float tmp504;
    float tmp505;
    float3 tmp510;
    float tmp513;
    float tmp514;
    float3 tmp515;
    float3 tmp517;
    float tmp519;
    float phi_in520;
    float phi_out521;
    float tmp523;
    float3 tmp528;
    float3 tmp533;
    float tmp534;
    float tmp535;
    float phi_in536;
    float phi_out537;
    float phi_in538;
    float phi_out539;
    float tmp540;
    float tmp541;
    float tmp542;
    float tmp543;
    float tmp544;
    float tmp545;
    float tmp546;
    float tmp547;
    float phi_in548;
    float phi_out549;
    float phi_in550;
    float phi_out551;
    float phi_in552;
    float phi_out553;
    float phi_in554;
    float phi_out555;
    float phi_in556;
    float phi_out557;
    float phi_in558;
    float phi_out559;
    float tmp560;
    float tmp561;
    float tmp562;
    float tmp564;
    float tmp565;
    float tmp566;
    float tmp567;
    float tmp568;
    float phi_in569;
    float phi_out570;
    float phi_in571;
    float phi_out572;
    float phi_in573;
    float phi_out574;
    float phi_in575;
    float phi_out576;
    float phi_in577;
    float phi_out578;
    float tmp580;
    float tmp581;
    float tmp582;
    float tmp583;
    float tmp584;
    float tmp585;
    float3 tmp588;
    float tmp591;
    float tmp592;
    float phi_in593;
    float phi_out594;
    float phi_in595;
    float phi_out596;
    float tmp599;
    float tmp600;
    tmp0 = min(max(state.text_results[16].z, 0.0f), 1.0f);
    tmp1 = min(max(state.text_results[12].y, 0.0f), 1.0f);
    tmp2 = state.geom_normal;
    tmp3 = sret_ptr.k1.x;
    tmp4 = sret_ptr.k1.y;
    tmp5 = sret_ptr.k1.z;
    tmp6 = float3(tmp3, tmp4, tmp5);
    float3 tmp7 = tmp6 * tmp2;
    tmp8 = asfloat((asint(tmp7.x + tmp7.y + tmp7.z) & -2147483648) | 1065353216);
    tmp9 = state.text_results[20].w * tmp8;
    tmp10 = state.text_results[21].x * tmp8;
    tmp11 = state.text_results[21].y * tmp8;
    tmp12 = float3(tmp9, tmp10, tmp11);
    float3 tmp13 = tmp12 * tmp6;
    tmp14 = tmp13.x + tmp13.y + tmp13.z;
    float tmp15 = 1.0f - min(max(min(max(tmp14, 0.0f), 1.0f), 0.0f), 1.0f);
    float tmp16 = tmp15 * tmp15;
    tmp17 = min(max(1.0f - state.text_results[12].x, 0.0f), 1.0f) - tmp0;
    tmp18 = tmp16 * tmp16 * (tmp15 * tmp17) + tmp0;
    tmp19 = tmp18 * tmp1;
    tmp20 = sret_ptr.xi.z;
    tmp21 = tmp20 < tmp19;
    if (tmp21) {
        tmp22 = tmp20 / tmp19;
        phi_in = tmp22;
    } else {
        tmp23 = (1.0f - tmp20) / (1.0f - tmp19);
        phi_in = tmp23;
    }
    phi_out = phi_in;
    sret_ptr.xi.z = phi_out;
    if (tmp21) {
        tmp24 = state.text_results[16].y;
        tmp25 = state.text_results[16].x;
        tmp26 = max(tmp25, 1.000000012e-07f);
        tmp27 = max(tmp24, 1.000000012e-07f);
        tmp28 = tmp2.x * tmp8;
        tmp29 = tmp2.y * tmp8;
        tmp30 = tmp2.z * tmp8;
        float3 tmp31 = float3(state.text_results[18].z, state.text_results[18].w, state.text_results[19].x);
        tmp32 = tmp12.zxy;
        tmp33 = tmp12.yzx;
        tmp34 = tmp31.yzx * tmp32 - tmp31.zxy * tmp33;
        float3 tmp35 = tmp34 * tmp34;
        tmp36 = tmp35.x + tmp35.y + tmp35.z;
        if (tmp36 < 9.999999939e-09f) {
            sret_ptr.pdf = 0.0f;
            sret_ptr.event_type = Bsdf_event_type(0);
            phi_in37 = 0;
        } else {
            float tmp39 = 1.0f / sqrt(tmp36);
            tmp40 = tmp39 * tmp34.x;
            tmp41 = tmp39 * tmp34.y;
            tmp42 = tmp39 * tmp34.z;
            tmp43 = float3(tmp40, tmp41, tmp42);
            tmp44 = tmp43.zxy * tmp33 - tmp43.yzx * tmp32;
            if (sret_ptr.ior1.x == -1.0f) {
                sret_ptr.ior1.x = 1.0f;
                sret_ptr.ior1.y = 1.0f;
                sret_ptr.ior1.z = 1.0f;
            }
            if (sret_ptr.ior2.x == -1.0f) {
                sret_ptr.ior2.x = 1.0f;
                sret_ptr.ior2.y = 1.0f;
                sret_ptr.ior2.z = 1.0f;
            }
            float3 tmp45 = tmp44 * tmp6;
            float3 tmp46 = tmp43 * tmp6;
            tmp47 = sret_ptr.xi.x;
            tmp48 = sret_ptr.xi.y;
            float tmp49 = (tmp45.x + tmp45.y + tmp45.z) * tmp26;
            float tmp50 = (tmp46.x + tmp46.y + tmp46.z) * tmp27;
            tmp51 = tmp14 * tmp14;
            tmp52 = tmp50 * tmp50;
            tmp53 = tmp49 * tmp49 + tmp52;
            float3 tmp54 = float3(sqrt(tmp53 + tmp51), 0.0f, 0.0f);
            tmp55 = float3(tmp49, abs(tmp14), tmp50) / tmp54.xxx;
            phi_in56 = 1.0f;
            phi_in58 = 0.0f;
            phi_in60 = 0.0f;
            if (tmp55.y < 0.9999899864f) {
                float3 tmp62 = tmp55 * float3(1.0f, 0.0f, 0.0f);
                float3 tmp63 = tmp55 * float3(0.0f, 0.0f, 1.0f);
                float3 tmp64 = tmp62.yzx - tmp63.zxy;
                float3 tmp65 = float3(sqrt(tmp64.x * tmp64.x + tmp64.y * tmp64.y + tmp64.z * tmp64.z), 0.0f, 0.0f);
                float3 tmp66 = tmp64 / tmp65.xxx;
                phi_in56 = tmp66.x;
                phi_in58 = tmp66.y;
                phi_in60 = tmp66.z;
            }
            phi_out57 = phi_in56;
            phi_out59 = phi_in58;
            phi_out61 = phi_in60;
            float3 tmp67 = float3(phi_out57, phi_out59, phi_out61);
            float3 tmp68 = tmp67.yzx * tmp55.zxy - tmp67.zxy * tmp55.yzx;
            tmp69 = tmp55.y + 1.0f;
            tmp70 = 1.0f / tmp69;
            tmp71 = sqrt(tmp47);
            if (tmp48 < tmp70) {
                tmp72 = tmp69 * 3.141592741f * tmp48;
                phi_in73 = 1.0f;
                phi_in75 = tmp72;
            } else {
                tmp77 = (tmp48 - tmp70) * 3.141592741f / (1.0f - tmp70) + 3.141592741f;
                phi_in73 = tmp55.y;
                phi_in75 = tmp77;
            }
            phi_out74 = phi_in73;
            phi_out76 = phi_in75;
            float tmp78 = cos(phi_out76) * tmp71;
            float tmp79 = phi_out74 * tmp71 * sin(phi_out76);
            float tmp80 = sqrt(max(1.0f - (tmp79 * tmp79 + tmp78 * tmp78), 0.0f));
            float tmp81 = (tmp79 * tmp68.x + tmp78 * phi_out57 + tmp80 * tmp55.x) * tmp26;
            float tmp82 = max(tmp79 * tmp68.y + tmp78 * phi_out59 + tmp80 * tmp55.y, 0.0f);
            float tmp83 = (tmp79 * tmp68.z + tmp78 * phi_out61 + tmp80 * tmp55.z) * tmp27;
            float3 tmp84 = float3(sqrt(tmp81 * tmp81 + tmp82 * tmp82 + tmp83 * tmp83), 0.0f, 0.0f);
            float3 tmp85 = float3(tmp81, tmp82, tmp83) / tmp84.xxx;
            if (tmp85.y == 0.0f) {
                sret_ptr.pdf = 0.0f;
                sret_ptr.event_type = Bsdf_event_type(0);
                phi_in86 = 0;
                phi_in88 = true;
            } else {
                tmp90 = tmp85.x * tmp44.x + tmp85.y * tmp9 + tmp85.z * tmp40;
                tmp91 = tmp85.x * tmp44.y + tmp85.y * tmp10 + tmp85.z * tmp41;
                tmp92 = tmp85.x * tmp44.z + tmp85.y * tmp11 + tmp85.z * tmp42;
                float3 tmp93 = float3(tmp90, tmp91, tmp92) * tmp6;
                tmp94 = tmp93.x + tmp93.y + tmp93.z;
                if (tmp94 > 0.0f) {
                    float tmp95 = tmp94 * 2.0f;
                    float tmp96 = tmp95 * tmp90 - tmp3;
                    float tmp97 = tmp95 * tmp91 - tmp4;
                    float tmp98 = tmp95 * tmp92 - tmp5;
                    sret_ptr.k2.x = tmp96;
                    sret_ptr.k2.y = tmp97;
                    sret_ptr.k2.z = tmp98;
                    sret_ptr.event_type = Bsdf_event_type(10);
                    sret_ptr.bsdf_over_pdf.x = 1.0f;
                    sret_ptr.bsdf_over_pdf.y = 1.0f;
                    sret_ptr.bsdf_over_pdf.z = 1.0f;
                    tmp99 = float3(tmp96, tmp97, tmp98);
                    float3 tmp100 = tmp99 * float3(tmp28, tmp29, tmp30);
                    if (tmp100.x + tmp100.y + tmp100.z > 0.0f) {
                        float3 tmp101 = tmp99 * tmp12;
                        float tmp102 = tmp101.x + tmp101.y + tmp101.z;
                        float3 tmp103 = tmp99 * tmp44;
                        float tmp104 = (tmp103.x + tmp103.y + tmp103.z) * tmp26;
                        tmp105 = 2.0f / (sqrt((tmp104 * tmp104 + tmp52) / (tmp102 * tmp102) + 1.0f) + 1.0f);
                        if (tmp105 * 2.0f / (sqrt(tmp53 / tmp51 + 1.0f) + 1.0f) > 0.0f) {
                            sret_ptr.bsdf_over_pdf.x = tmp105;
                            sret_ptr.bsdf_over_pdf.y = tmp105;
                            sret_ptr.bsdf_over_pdf.z = tmp105;
                            sret_ptr.handle = 0;
                            phi_in86 = 10;
                            phi_in88 = false;
                        } else {
                            sret_ptr.pdf = 0.0f;
                            sret_ptr.event_type = Bsdf_event_type(0);
                            phi_in86 = 0;
                            phi_in88 = true;
                        }
                    } else {
                        sret_ptr.pdf = 0.0f;
                        sret_ptr.event_type = Bsdf_event_type(0);
                        phi_in86 = 0;
                        phi_in88 = true;
                    }
                } else {
                    sret_ptr.pdf = 0.0f;
                    sret_ptr.event_type = Bsdf_event_type(0);
                    phi_in86 = 0;
                    phi_in88 = true;
                }
            }
            phi_out87 = phi_in86;
            phi_out89 = phi_in88;
            phi_in106 = 0.0f;
            if (!phi_out89) {
                tmp108 = (sret_ptr.bsdf_over_pdf.y + sret_ptr.bsdf_over_pdf.x + sret_ptr.bsdf_over_pdf.z) * 0.3333333433f;
                phi_in106 = tmp108;
            }
            phi_out107 = phi_in106;
            tmp109 = min(max(sqrt(tmp25 * tmp24), 0.0f), 1.0f) * 0.984375f + 0.0078125f;
            tmp110 = sret_ptr.xi.w;
            if (tmp110 > phi_out107) {
                float tmp111 = min(max((tmp110 - phi_out107) / (1.0f - phi_out107), 0.0f), 1.0f);
                float tmp112 = phi_out * 6.283185482f;
                float tmp113 = sin(tmp112);
                float tmp114 = cos(tmp112);
                float tmp115 = sqrt(1.0f - tmp111);
                float tmp116 = sqrt(tmp111);
                float tmp117 = tmp115 * (tmp44.x * tmp114 + tmp40 * tmp113) + tmp116 * tmp9;
                float tmp118 = tmp115 * (tmp44.y * tmp114 + tmp41 * tmp113) + tmp116 * tmp10;
                float tmp119 = tmp115 * (tmp44.z * tmp114 + tmp42 * tmp113) + tmp116 * tmp11;
                float3 tmp120 = float3(sqrt(tmp117 * tmp117 + tmp118 * tmp118 + tmp119 * tmp119), 0.0f, 0.0f);
                float3 tmp121 = float3(tmp117, tmp118, tmp119) / tmp120.xxx;
                sret_ptr.k2.x = tmp121.x;
                sret_ptr.k2.y = tmp121.y;
                sret_ptr.k2.z = tmp121.z;
                sret_ptr.event_type = Bsdf_event_type(9);
                float tmp122 = tmp116 * 0.9200000167f * (3.141592741f - tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp116, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp109, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x * 3.141592741f) / tex_lookup_float3_3d(1, float3(1.0f, tmp109, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                sret_ptr.bsdf_over_pdf.x = tmp122;
                sret_ptr.bsdf_over_pdf.y = tmp122;
                sret_ptr.bsdf_over_pdf.z = tmp122;
                phi_in37 = 9;
            } else {
                float tmp123 = 1.0f / phi_out107;
                sret_ptr.bsdf_over_pdf.x = sret_ptr.bsdf_over_pdf.x * tmp123;
                sret_ptr.bsdf_over_pdf.y = sret_ptr.bsdf_over_pdf.y * tmp123;
                sret_ptr.bsdf_over_pdf.z = sret_ptr.bsdf_over_pdf.z * tmp123;
                phi_in37 = phi_out87;
            }
        }
    } else {
        tmp124 = state.text_results[13].z;
        tmp125 = state.text_results[13].w;
        tmp126 = state.text_results[14].x;
        tmp127 = state.text_results[20].x;
        tmp128 = state.text_results[20].y;
        tmp129 = state.text_results[20].z;
        tmp130 = min(max(state.text_results[15].y, 0.0f), 1.0f);
        tmp131 = phi_out < tmp130;
        if (tmp131) {
            tmp132 = phi_out / tmp130;
            phi_in133 = tmp132;
        } else {
            tmp135 = (phi_out - tmp130) / (1.0f - tmp130);
            phi_in133 = tmp135;
        }
        phi_out134 = phi_in133;
        sret_ptr.xi.z = phi_out134;
        if (tmp131) {
            tmp136 = state.text_results[23].x;
            tmp137 = state.text_results[23].y;
            tmp138 = state.text_results[23].z;
            tmp139 = state.text_results[22].y;
            tmp140 = state.text_results[22].z;
            tmp141 = state.text_results[22].w;
            tmp142 = state.text_results[13].y;
            tmp143 = state.text_results[13].x;
            tmp144 = max(tmp143, 1.000000012e-07f);
            tmp145 = max(tmp142, 1.000000012e-07f);
            tmp146 = tmp2.x * tmp8;
            tmp147 = tmp2.y * tmp8;
            tmp148 = tmp2.z * tmp8;
            tmp149 = tmp127 * tmp8;
            tmp150 = tmp128 * tmp8;
            tmp151 = tmp129 * tmp8;
            float3 tmp152 = float3(state.text_results[17].w, state.text_results[18].x, state.text_results[18].y);
            tmp153 = float3(tmp149, tmp150, tmp151);
            tmp154 = tmp153.zxy;
            tmp155 = tmp153.yzx;
            tmp156 = tmp152.yzx * tmp154 - tmp152.zxy * tmp155;
            float3 tmp157 = tmp156 * tmp156;
            tmp158 = tmp157.x + tmp157.y + tmp157.z;
            if (tmp158 < 9.999999939e-09f) {
                sret_ptr.pdf = 0.0f;
                sret_ptr.event_type = Bsdf_event_type(0);
                phi_in159 = 0;
            } else {
                float tmp161 = 1.0f / sqrt(tmp158);
                tmp162 = tmp161 * tmp156.x;
                tmp163 = tmp161 * tmp156.y;
                tmp164 = tmp161 * tmp156.z;
                tmp165 = float3(tmp162, tmp163, tmp164);
                tmp166 = tmp165.zxy * tmp155 - tmp165.yzx * tmp154;
                if (sret_ptr.ior1.x == -1.0f) {
                    sret_ptr.ior1.x = 1.0f;
                    sret_ptr.ior1.y = 1.0f;
                    sret_ptr.ior1.z = 1.0f;
                }
                if (sret_ptr.ior2.x == -1.0f) {
                    sret_ptr.ior2.x = 1.0f;
                    sret_ptr.ior2.y = 1.0f;
                    sret_ptr.ior2.z = 1.0f;
                }
                float3 tmp167 = tmp153 * tmp6;
                float tmp168 = tmp167.x + tmp167.y + tmp167.z;
                float3 tmp169 = tmp166 * tmp6;
                float3 tmp170 = tmp165 * tmp6;
                tmp171 = sret_ptr.xi.x;
                tmp172 = sret_ptr.xi.y;
                float tmp173 = (tmp169.x + tmp169.y + tmp169.z) * tmp144;
                float tmp174 = (tmp170.x + tmp170.y + tmp170.z) * tmp145;
                tmp175 = tmp168 * tmp168;
                tmp176 = tmp174 * tmp174;
                tmp177 = tmp173 * tmp173 + tmp176;
                float3 tmp178 = float3(sqrt(tmp177 + tmp175), 0.0f, 0.0f);
                tmp179 = float3(tmp173, abs(tmp168), tmp174) / tmp178.xxx;
                phi_in180 = 1.0f;
                phi_in182 = 0.0f;
                phi_in184 = 0.0f;
                if (tmp179.y < 0.9999899864f) {
                    float3 tmp186 = tmp179 * float3(1.0f, 0.0f, 0.0f);
                    float3 tmp187 = tmp179 * float3(0.0f, 0.0f, 1.0f);
                    float3 tmp188 = tmp186.yzx - tmp187.zxy;
                    float3 tmp189 = float3(sqrt(tmp188.x * tmp188.x + tmp188.y * tmp188.y + tmp188.z * tmp188.z), 0.0f, 0.0f);
                    float3 tmp190 = tmp188 / tmp189.xxx;
                    phi_in180 = tmp190.x;
                    phi_in182 = tmp190.y;
                    phi_in184 = tmp190.z;
                }
                phi_out181 = phi_in180;
                phi_out183 = phi_in182;
                phi_out185 = phi_in184;
                float3 tmp191 = float3(phi_out181, phi_out183, phi_out185);
                float3 tmp192 = tmp191.yzx * tmp179.zxy - tmp191.zxy * tmp179.yzx;
                tmp193 = tmp179.y + 1.0f;
                tmp194 = 1.0f / tmp193;
                tmp195 = sqrt(tmp171);
                if (tmp172 < tmp194) {
                    tmp196 = tmp193 * 3.141592741f * tmp172;
                    phi_in197 = 1.0f;
                    phi_in199 = tmp196;
                } else {
                    tmp201 = (tmp172 - tmp194) * 3.141592741f / (1.0f - tmp194) + 3.141592741f;
                    phi_in197 = tmp179.y;
                    phi_in199 = tmp201;
                }
                phi_out198 = phi_in197;
                phi_out200 = phi_in199;
                float tmp202 = cos(phi_out200) * tmp195;
                float tmp203 = phi_out198 * tmp195 * sin(phi_out200);
                float tmp204 = sqrt(max(1.0f - (tmp203 * tmp203 + tmp202 * tmp202), 0.0f));
                float tmp205 = (tmp203 * tmp192.x + tmp202 * phi_out181 + tmp204 * tmp179.x) * tmp144;
                float tmp206 = max(tmp203 * tmp192.y + tmp202 * phi_out183 + tmp204 * tmp179.y, 0.0f);
                float tmp207 = (tmp203 * tmp192.z + tmp202 * phi_out185 + tmp204 * tmp179.z) * tmp145;
                float3 tmp208 = float3(sqrt(tmp205 * tmp205 + tmp206 * tmp206 + tmp207 * tmp207), 0.0f, 0.0f);
                float3 tmp209 = float3(tmp205, tmp206, tmp207) / tmp208.xxx;
                if (tmp209.y == 0.0f) {
                    sret_ptr.pdf = 0.0f;
                    sret_ptr.event_type = Bsdf_event_type(0);
                    phi_in210 = 0;
                    phi_in212 = true;
                } else {
                    tmp214 = tmp209.x * tmp166.x + tmp209.y * tmp149 + tmp209.z * tmp162;
                    tmp215 = tmp209.x * tmp166.y + tmp209.y * tmp150 + tmp209.z * tmp163;
                    tmp216 = tmp209.x * tmp166.z + tmp209.y * tmp151 + tmp209.z * tmp164;
                    float3 tmp217 = float3(tmp214, tmp215, tmp216) * tmp6;
                    tmp218 = tmp217.x + tmp217.y + tmp217.z;
                    if (tmp218 > 0.0f) {
                        float tmp219 = tmp218 * 2.0f;
                        float tmp220 = tmp219 * tmp214 - tmp3;
                        float tmp221 = tmp219 * tmp215 - tmp4;
                        float tmp222 = tmp219 * tmp216 - tmp5;
                        sret_ptr.k2.x = tmp220;
                        sret_ptr.k2.y = tmp221;
                        sret_ptr.k2.z = tmp222;
                        sret_ptr.event_type = Bsdf_event_type(10);
                        sret_ptr.bsdf_over_pdf.x = 1.0f;
                        sret_ptr.bsdf_over_pdf.y = 1.0f;
                        sret_ptr.bsdf_over_pdf.z = 1.0f;
                        tmp223 = float3(tmp220, tmp221, tmp222);
                        float3 tmp224 = tmp223 * float3(tmp146, tmp147, tmp148);
                        if (tmp224.x + tmp224.y + tmp224.z > 0.0f) {
                            float3 tmp225 = tmp223 * tmp153;
                            float tmp226 = tmp225.x + tmp225.y + tmp225.z;
                            float3 tmp227 = tmp223 * tmp166;
                            float tmp228 = (tmp227.x + tmp227.y + tmp227.z) * tmp144;
                            tmp229 = 2.0f / (sqrt((tmp228 * tmp228 + tmp176) / (tmp226 * tmp226) + 1.0f) + 1.0f);
                            if (tmp229 * 2.0f / (sqrt(tmp177 / tmp175 + 1.0f) + 1.0f) > 0.0f) {
                                sret_ptr.bsdf_over_pdf.x = tmp229;
                                sret_ptr.bsdf_over_pdf.y = tmp229;
                                sret_ptr.bsdf_over_pdf.z = tmp229;
                                sret_ptr.handle = 0;
                                phi_in210 = 10;
                                phi_in212 = false;
                            } else {
                                sret_ptr.pdf = 0.0f;
                                sret_ptr.event_type = Bsdf_event_type(0);
                                phi_in210 = 0;
                                phi_in212 = true;
                            }
                        } else {
                            sret_ptr.pdf = 0.0f;
                            sret_ptr.event_type = Bsdf_event_type(0);
                            phi_in210 = 0;
                            phi_in212 = true;
                        }
                    } else {
                        sret_ptr.pdf = 0.0f;
                        sret_ptr.event_type = Bsdf_event_type(0);
                        phi_in210 = 0;
                        phi_in212 = true;
                    }
                }
                phi_out211 = phi_in210;
                phi_out213 = phi_in212;
                phi_in230 = 0.0f;
                if (!phi_out213) {
                    tmp232 = (sret_ptr.bsdf_over_pdf.y + sret_ptr.bsdf_over_pdf.x + sret_ptr.bsdf_over_pdf.z) * 0.3333333433f;
                    phi_in230 = tmp232;
                }
                phi_out231 = phi_in230;
                tmp233 = min(max(sqrt(tmp143 * tmp142), 0.0f), 1.0f) * 0.984375f + 0.0078125f;
                tmp234 = sret_ptr.xi.w;
                if (tmp234 > phi_out231) {
                    float tmp235 = min(max((tmp234 - phi_out231) / (1.0f - phi_out231), 0.0f), 1.0f);
                    float tmp236 = phi_out134 * 6.283185482f;
                    float tmp237 = sin(tmp236);
                    float tmp238 = cos(tmp236);
                    float tmp239 = sqrt(1.0f - tmp235);
                    float tmp240 = sqrt(tmp235);
                    float tmp241 = tmp239 * (tmp166.x * tmp238 + tmp162 * tmp237) + tmp240 * tmp149;
                    float tmp242 = tmp239 * (tmp166.y * tmp238 + tmp163 * tmp237) + tmp240 * tmp150;
                    float tmp243 = tmp239 * (tmp166.z * tmp238 + tmp164 * tmp237) + tmp240 * tmp151;
                    float3 tmp244 = float3(sqrt(tmp241 * tmp241 + tmp242 * tmp242 + tmp243 * tmp243), 0.0f, 0.0f);
                    float3 tmp245 = float3(tmp241, tmp242, tmp243) / tmp244.xxx;
                    sret_ptr.k2.x = tmp245.x;
                    sret_ptr.k2.y = tmp245.y;
                    sret_ptr.k2.z = tmp245.z;
                    sret_ptr.event_type = Bsdf_event_type(9);
                    float tmp246 = (3.141592741f - tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp240, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp233, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x * 3.141592741f) * tmp240 / tex_lookup_float3_3d(1, float3(1.0f, tmp233, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                    sret_ptr.bsdf_over_pdf.x = tmp246;
                    sret_ptr.bsdf_over_pdf.y = tmp246;
                    sret_ptr.bsdf_over_pdf.z = tmp246;
                    phi_in159 = 9;
                } else {
                    float tmp247 = 1.0f / phi_out231;
                    sret_ptr.bsdf_over_pdf.x = sret_ptr.bsdf_over_pdf.x * tmp247;
                    sret_ptr.bsdf_over_pdf.y = sret_ptr.bsdf_over_pdf.y * tmp247;
                    sret_ptr.bsdf_over_pdf.z = sret_ptr.bsdf_over_pdf.z * tmp247;
                    phi_in159 = phi_out211;
                }
            }
            phi_out160 = phi_in159;
            phi_in248 = 0;
            if (phi_out160 != 0) {
                float tmp250 = sret_ptr.k2.y + tmp4;
                float tmp251 = sret_ptr.k2.x + tmp3;
                float tmp252 = sret_ptr.k2.z + tmp5;
                float3 tmp253 = float3(sqrt(tmp250 * tmp250 + tmp251 * tmp251 + tmp252 * tmp252), 0.0f, 0.0f);
                float3 tmp254 = float3(tmp251, tmp250, tmp252) * tmp6 / tmp253.xxx;
                tmp255 = tmp254.x + tmp254.y + tmp254.z;
                if (tmp255 < 0.0f) {
                    sret_ptr.pdf = 0.0f;
                    sret_ptr.event_type = Bsdf_event_type(0);
                    phi_in248 = 0;
                } else {
                    tmp256 = sret_ptr.ior1.x;
                    if (tmp256 == -1.0f) {
                        sret_ptr.ior1.x = 1.0f;
                        sret_ptr.ior1.y = 1.0f;
                        sret_ptr.ior1.z = 1.0f;
                        phi_in257 = 1.0f;
                        phi_in259 = 1.0f;
                        phi_in261 = 1.0f;
                    } else {
                        tmp263 = sret_ptr.ior1.y;
                        tmp264 = sret_ptr.ior1.z;
                        phi_in257 = tmp264;
                        phi_in259 = tmp263;
                        phi_in261 = tmp256;
                    }
                    phi_out258 = phi_in257;
                    phi_out260 = phi_in259;
                    phi_out262 = phi_in261;
                    float tmp265 = 1.0f / phi_out262;
                    float tmp266 = 1.0f / phi_out260;
                    float tmp267 = 1.0f / phi_out258;
                    float tmp268 = tmp265 * tmp139;
                    float tmp269 = tmp266 * tmp140;
                    float tmp270 = tmp267 * tmp141;
                    float tmp271 = tmp265 * tmp136;
                    float tmp272 = tmp266 * tmp137;
                    float tmp273 = tmp267 * tmp138;
                    float tmp274 = tmp255 * tmp255;
                    float tmp275 = 1.0f - tmp274;
                    float tmp276 = -tmp275;
                    float tmp277 = tmp268 * tmp268;
                    float tmp278 = tmp271 * tmp271;
                    float tmp279 = tmp276 - tmp278 + tmp277;
                    float tmp280 = sqrt(tmp279 * tmp279 + tmp277 * 4.0f * tmp278);
                    float tmp281 = tmp280 + tmp274;
                    float tmp282 = tmp255 * 2.0f;
                    float tmp283 = sqrt(max((tmp280 + tmp279) * 0.5f, 0.0f)) * tmp282;
                    float tmp284 = (tmp281 - tmp283) / (tmp283 + tmp281);
                    float tmp285 = tmp275 * tmp275;
                    float tmp286 = tmp280 * tmp274 + tmp285;
                    float tmp287 = tmp283 * tmp275;
                    float tmp288 = tmp269 * tmp269;
                    float tmp289 = tmp272 * tmp272;
                    float tmp290 = tmp276 - tmp289 + tmp288;
                    float tmp291 = sqrt(tmp290 * tmp290 + tmp288 * 4.0f * tmp289);
                    float tmp292 = tmp291 + tmp274;
                    float tmp293 = sqrt(max((tmp291 + tmp290) * 0.5f, 0.0f)) * tmp282;
                    float tmp294 = (tmp292 - tmp293) / (tmp293 + tmp292);
                    float tmp295 = tmp291 * tmp274 + tmp285;
                    float tmp296 = tmp293 * tmp275;
                    float tmp297 = tmp270 * tmp270;
                    float tmp298 = tmp273 * tmp273;
                    float tmp299 = tmp276 - tmp298 + tmp297;
                    float tmp300 = sqrt(tmp299 * tmp299 + tmp297 * 4.0f * tmp298);
                    float tmp301 = tmp300 + tmp274;
                    float tmp302 = sqrt(max((tmp300 + tmp299) * 0.5f, 0.0f)) * tmp282;
                    float tmp303 = (tmp301 - tmp302) / (tmp302 + tmp301);
                    float tmp304 = tmp300 * tmp274 + tmp285;
                    float tmp305 = tmp302 * tmp275;
                    sret_ptr.bsdf_over_pdf.x = min(max((tmp284 * (tmp286 - tmp287) / (tmp287 + tmp286) + tmp284) * 0.5f, 0.0f), 1.0f) * sret_ptr.bsdf_over_pdf.x;
                    sret_ptr.bsdf_over_pdf.y = min(max((tmp294 * (tmp295 - tmp296) / (tmp296 + tmp295) + tmp294) * 0.5f, 0.0f), 1.0f) * sret_ptr.bsdf_over_pdf.y;
                    sret_ptr.bsdf_over_pdf.z = min(max((tmp303 * (tmp304 - tmp305) / (tmp305 + tmp304) + tmp303) * 0.5f, 0.0f), 1.0f) * sret_ptr.bsdf_over_pdf.z;
                    tmp306 = sret_ptr.event_type;
                    phi_in248 = tmp306;
                }
            }
        } else {
            tmp307 = min(max(state.text_results[16].w, 0.0f), 1.0f);
            tmp308 = min(max(state.text_results[15].x, 0.0f), 1.0f);
            tmp309 = tmp127 * tmp8;
            tmp310 = tmp128 * tmp8;
            tmp311 = tmp129 * tmp8;
            tmp312 = float3(tmp309, tmp310, tmp311);
            float3 tmp313 = tmp312 * tmp6;
            tmp314 = tmp313.x + tmp313.y + tmp313.z;
            tmp315 = min(max(1.0f - state.text_results[12].z, 0.0f), 1.0f) - tmp307;
            tmp316 = tmp315 * pow(1.0f - min(max(min(max(tmp314, 0.0f), 1.0f), 0.0f), 1.0f), 4.0f) + tmp307;
            tmp317 = tmp316 * tmp308;
            tmp318 = phi_out134 < tmp317;
            if (tmp318) {
                tmp319 = phi_out134 / tmp317;
                phi_in320 = tmp319;
            } else {
                tmp322 = (1.0f - phi_out134) / (1.0f - tmp317);
                phi_in320 = tmp322;
            }
            phi_out321 = phi_in320;
            sret_ptr.xi.z = phi_out321;
            if (tmp318) {
                float tmp323 = state.text_results[21].z;
                float tmp324 = state.text_results[21].w;
                float tmp325 = state.text_results[22].x;
                float3 tmp326 = float3(tmp323, tmp324, tmp325) * float3(0.9200000167f, 0.9200000167f, 0.9200000167f);
                tmp327 = state.text_results[13].y;
                tmp328 = state.text_results[13].x;
                tmp329 = max(tmp328, 1.000000012e-07f);
                tmp330 = max(tmp327, 1.000000012e-07f);
                tmp331 = tmp326.z > 0.0f || (tmp326.x > 0.0f || tmp326.y > 0.0f);
                tmp332 = min(max(tmp323, 0.0f), 1.0f);
                tmp333 = min(max(tmp324, 0.0f), 1.0f);
                tmp334 = min(max(tmp325, 0.0f), 1.0f);
                tmp335 = min(max(tmp326.x, 0.0f), 1.0f);
                tmp336 = min(max(tmp326.y, 0.0f), 1.0f);
                tmp337 = min(max(tmp326.z, 0.0f), 1.0f);
                tmp338 = tmp2.x * tmp8;
                tmp339 = tmp2.y * tmp8;
                tmp340 = tmp2.z * tmp8;
                float3 tmp341 = float3(state.text_results[17].w, state.text_results[18].x, state.text_results[18].y);
                tmp342 = tmp312.zxy;
                tmp343 = tmp312.yzx;
                tmp344 = tmp341.yzx * tmp342 - tmp341.zxy * tmp343;
                float3 tmp345 = tmp344 * tmp344;
                tmp346 = tmp345.x + tmp345.y + tmp345.z;
                if (tmp346 < 9.999999939e-09f) {
                    sret_ptr.pdf = 0.0f;
                    sret_ptr.event_type = Bsdf_event_type(0);
                    phi_in347 = 0;
                } else {
                    float tmp349 = 1.0f / sqrt(tmp346);
                    tmp350 = tmp349 * tmp344.x;
                    tmp351 = tmp349 * tmp344.y;
                    tmp352 = tmp349 * tmp344.z;
                    tmp353 = float3(tmp350, tmp351, tmp352);
                    tmp354 = tmp353.zxy * tmp343 - tmp353.yzx * tmp342;
                    if (sret_ptr.ior1.x == -1.0f) {
                        sret_ptr.ior1.x = 1.0f;
                        sret_ptr.ior1.y = 1.0f;
                        sret_ptr.ior1.z = 1.0f;
                    }
                    if (sret_ptr.ior2.x == -1.0f) {
                        sret_ptr.ior2.x = 1.0f;
                        sret_ptr.ior2.y = 1.0f;
                        sret_ptr.ior2.z = 1.0f;
                    }
                    float3 tmp355 = tmp354 * tmp6;
                    float3 tmp356 = tmp353 * tmp6;
                    tmp357 = sret_ptr.xi.x;
                    tmp358 = sret_ptr.xi.y;
                    float tmp359 = (tmp355.x + tmp355.y + tmp355.z) * tmp329;
                    float tmp360 = (tmp356.x + tmp356.y + tmp356.z) * tmp330;
                    tmp361 = tmp314 * tmp314;
                    tmp362 = tmp360 * tmp360;
                    tmp363 = tmp359 * tmp359 + tmp362;
                    float3 tmp364 = float3(sqrt(tmp363 + tmp361), 0.0f, 0.0f);
                    tmp365 = float3(tmp359, abs(tmp314), tmp360) / tmp364.xxx;
                    phi_in366 = 1.0f;
                    phi_in368 = 0.0f;
                    phi_in370 = 0.0f;
                    if (tmp365.y < 0.9999899864f) {
                        float3 tmp372 = tmp365 * float3(1.0f, 0.0f, 0.0f);
                        float3 tmp373 = tmp365 * float3(0.0f, 0.0f, 1.0f);
                        float3 tmp374 = tmp372.yzx - tmp373.zxy;
                        float3 tmp375 = float3(sqrt(tmp374.x * tmp374.x + tmp374.y * tmp374.y + tmp374.z * tmp374.z), 0.0f, 0.0f);
                        float3 tmp376 = tmp374 / tmp375.xxx;
                        phi_in366 = tmp376.x;
                        phi_in368 = tmp376.y;
                        phi_in370 = tmp376.z;
                    }
                    phi_out367 = phi_in366;
                    phi_out369 = phi_in368;
                    phi_out371 = phi_in370;
                    float3 tmp377 = float3(phi_out367, phi_out369, phi_out371);
                    float3 tmp378 = tmp377.yzx * tmp365.zxy - tmp377.zxy * tmp365.yzx;
                    tmp379 = tmp365.y + 1.0f;
                    tmp380 = 1.0f / tmp379;
                    tmp381 = sqrt(tmp357);
                    if (tmp358 < tmp380) {
                        tmp382 = tmp379 * 3.141592741f * tmp358;
                        phi_in383 = 1.0f;
                        phi_in385 = tmp382;
                    } else {
                        tmp387 = (tmp358 - tmp380) * 3.141592741f / (1.0f - tmp380) + 3.141592741f;
                        phi_in383 = tmp365.y;
                        phi_in385 = tmp387;
                    }
                    phi_out384 = phi_in383;
                    phi_out386 = phi_in385;
                    float tmp388 = cos(phi_out386) * tmp381;
                    float tmp389 = phi_out384 * tmp381 * sin(phi_out386);
                    float tmp390 = sqrt(max(1.0f - (tmp389 * tmp389 + tmp388 * tmp388), 0.0f));
                    float tmp391 = (tmp389 * tmp378.x + tmp388 * phi_out367 + tmp390 * tmp365.x) * tmp329;
                    float tmp392 = max(tmp389 * tmp378.y + tmp388 * phi_out369 + tmp390 * tmp365.y, 0.0f);
                    float tmp393 = (tmp389 * tmp378.z + tmp388 * phi_out371 + tmp390 * tmp365.z) * tmp330;
                    float3 tmp394 = float3(sqrt(tmp391 * tmp391 + tmp392 * tmp392 + tmp393 * tmp393), 0.0f, 0.0f);
                    float3 tmp395 = float3(tmp391, tmp392, tmp393) / tmp394.xxx;
                    if (tmp395.y == 0.0f) {
                        sret_ptr.pdf = 0.0f;
                        sret_ptr.event_type = Bsdf_event_type(0);
                        phi_in396 = 0;
                        phi_in398 = true;
                    } else {
                        tmp400 = tmp395.x * tmp354.x + tmp395.y * tmp309 + tmp395.z * tmp350;
                        tmp401 = tmp395.x * tmp354.y + tmp395.y * tmp310 + tmp395.z * tmp351;
                        tmp402 = tmp395.x * tmp354.z + tmp395.y * tmp311 + tmp395.z * tmp352;
                        float3 tmp403 = float3(tmp400, tmp401, tmp402) * tmp6;
                        tmp404 = tmp403.x + tmp403.y + tmp403.z;
                        if (tmp404 > 0.0f) {
                            float tmp405 = tmp404 * 2.0f;
                            float tmp406 = tmp405 * tmp400 - tmp3;
                            float tmp407 = tmp405 * tmp401 - tmp4;
                            float tmp408 = tmp405 * tmp402 - tmp5;
                            sret_ptr.k2.x = tmp406;
                            sret_ptr.k2.y = tmp407;
                            sret_ptr.k2.z = tmp408;
                            sret_ptr.event_type = Bsdf_event_type(10);
                            sret_ptr.bsdf_over_pdf.x = 1.0f;
                            sret_ptr.bsdf_over_pdf.y = 1.0f;
                            sret_ptr.bsdf_over_pdf.z = 1.0f;
                            tmp409 = float3(tmp406, tmp407, tmp408);
                            float3 tmp410 = tmp409 * float3(tmp338, tmp339, tmp340);
                            if (tmp410.x + tmp410.y + tmp410.z > 0.0f) {
                                float3 tmp411 = tmp409 * tmp312;
                                float tmp412 = tmp411.x + tmp411.y + tmp411.z;
                                float3 tmp413 = tmp409 * tmp354;
                                float tmp414 = (tmp413.x + tmp413.y + tmp413.z) * tmp329;
                                tmp415 = 2.0f / (sqrt((tmp414 * tmp414 + tmp362) / (tmp412 * tmp412) + 1.0f) + 1.0f);
                                if (tmp415 * 2.0f / (sqrt(tmp363 / tmp361 + 1.0f) + 1.0f) > 0.0f) {
                                    sret_ptr.bsdf_over_pdf.x = tmp415;
                                    sret_ptr.bsdf_over_pdf.y = tmp415;
                                    sret_ptr.bsdf_over_pdf.z = tmp415;
                                    sret_ptr.handle = 0;
                                    phi_in396 = 10;
                                    phi_in398 = false;
                                } else {
                                    sret_ptr.pdf = 0.0f;
                                    sret_ptr.event_type = Bsdf_event_type(0);
                                    phi_in396 = 0;
                                    phi_in398 = true;
                                }
                            } else {
                                sret_ptr.pdf = 0.0f;
                                sret_ptr.event_type = Bsdf_event_type(0);
                                phi_in396 = 0;
                                phi_in398 = true;
                            }
                        } else {
                            sret_ptr.pdf = 0.0f;
                            sret_ptr.event_type = Bsdf_event_type(0);
                            phi_in396 = 0;
                            phi_in398 = true;
                        }
                    }
                    phi_out397 = phi_in396;
                    phi_out399 = phi_in398;
                    if (tmp331) {
                        phi_in416 = 0.0f;
                        if (!phi_out399) {
                            tmp418 = (sret_ptr.bsdf_over_pdf.y + sret_ptr.bsdf_over_pdf.x + sret_ptr.bsdf_over_pdf.z) * 0.3333333433f;
                            phi_in416 = tmp418;
                        }
                        phi_out417 = phi_in416;
                        tmp419 = min(max(sqrt(tmp328 * tmp327), 0.0f), 1.0f) * 0.984375f + 0.0078125f;
                        tmp420 = sret_ptr.xi.w;
                        if (tmp420 > phi_out417) {
                            float tmp421 = min(max((tmp420 - phi_out417) / (1.0f - phi_out417), 0.0f), 1.0f);
                            float tmp422 = phi_out321 * 6.283185482f;
                            float tmp423 = sin(tmp422);
                            float tmp424 = cos(tmp422);
                            float tmp425 = sqrt(1.0f - tmp421);
                            float tmp426 = sqrt(tmp421);
                            float tmp427 = tmp425 * (tmp354.x * tmp424 + tmp350 * tmp423) + tmp426 * tmp309;
                            float tmp428 = tmp425 * (tmp354.y * tmp424 + tmp351 * tmp423) + tmp426 * tmp310;
                            float tmp429 = tmp425 * (tmp354.z * tmp424 + tmp352 * tmp423) + tmp426 * tmp311;
                            float3 tmp430 = float3(sqrt(tmp427 * tmp427 + tmp428 * tmp428 + tmp429 * tmp429), 0.0f, 0.0f);
                            float3 tmp431 = float3(tmp427, tmp428, tmp429) / tmp430.xxx;
                            sret_ptr.k2.x = tmp431.x;
                            sret_ptr.k2.y = tmp431.y;
                            sret_ptr.k2.z = tmp431.z;
                            sret_ptr.event_type = Bsdf_event_type(9);
                            float tmp432 = (3.141592741f - tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp426, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp419, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x * 3.141592741f) * tmp426 / tex_lookup_float3_3d(1, float3(1.0f, tmp419, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                            sret_ptr.bsdf_over_pdf.x = tmp432 * tmp335;
                            sret_ptr.bsdf_over_pdf.y = tmp432 * tmp336;
                            sret_ptr.bsdf_over_pdf.z = tmp432 * tmp337;
                            phi_in347 = 9;
                        } else {
                            float tmp433 = 1.0f / phi_out417;
                            sret_ptr.bsdf_over_pdf.x = tmp433 * tmp332 * sret_ptr.bsdf_over_pdf.x;
                            sret_ptr.bsdf_over_pdf.y = tmp433 * tmp333 * sret_ptr.bsdf_over_pdf.y;
                            sret_ptr.bsdf_over_pdf.z = tmp433 * tmp334 * sret_ptr.bsdf_over_pdf.z;
                            phi_in347 = phi_out397;
                        }
                    } else {
                        sret_ptr.bsdf_over_pdf.x = sret_ptr.bsdf_over_pdf.x * tmp332;
                        sret_ptr.bsdf_over_pdf.y = sret_ptr.bsdf_over_pdf.y * tmp333;
                        sret_ptr.bsdf_over_pdf.z = sret_ptr.bsdf_over_pdf.z * tmp334;
                        phi_in347 = phi_out397;
                    }
                }
            } else if (phi_out321 < 1.0f) {
                float3 tmp434 = state.tangent_u[0];
                tmp435 = tmp312.zxy;
                tmp436 = tmp312.yzx;
                tmp437 = tmp434.yzx * tmp435 - tmp434.zxy * tmp436;
                float3 tmp438 = tmp437 * tmp437;
                tmp439 = tmp438.x + tmp438.y + tmp438.z;
                if (tmp439 < 9.999999939e-09f) {
                    sret_ptr.pdf = 0.0f;
                    sret_ptr.event_type = Bsdf_event_type(0);
                    phi_in347 = 0;
                } else {
                    float tmp440 = 1.0f / sqrt(tmp439);
                    tmp441 = tmp440 * tmp437.x;
                    tmp442 = tmp440 * tmp437.y;
                    tmp443 = tmp440 * tmp437.z;
                    float3 tmp444 = float3(tmp441, tmp442, tmp443);
                    float3 tmp445 = tmp444.zxy * tmp436 - tmp444.yzx * tmp435;
                    tmp446 = min(max(state.text_results[19].y, 0.0f), 1.0f);
                    tmp447 = min(max(state.text_results[19].z, 0.0f), 1.0f);
                    tmp448 = min(max(state.text_results[19].w, 0.0f), 1.0f);
                    tmp449 = max(state.text_results[15].z, 0.0f);
                    tmp450 = float3(tmp2.x * tmp8, tmp2.y * tmp8, tmp2.z * tmp8);
                    float3 tmp451 = tmp312 * tmp450;
                    tmp452 = max(tmp451.x + tmp451.y + tmp451.z, 0.0f);
                    tmp453 = 3.141592741f / (tmp452 * 1.570796371f + 1.570796371f);
                    tmp454 = tmp453 + -1.0f;
                    tmp455 = sret_ptr.xi.x;
                    tmp456 = tmp455 < tmp454;
                    if (tmp456) {
                        tmp457 = tmp455 / tmp454;
                        phi_in458 = tmp457;
                    } else {
                        tmp460 = (tmp455 - tmp454) / (2.0f - tmp453);
                        phi_in458 = tmp460;
                    }
                    phi_out459 = phi_in458;
                    sret_ptr.xi.x = phi_out459;
                    tmp461 = sret_ptr.xi.y;
                    phi_in462 = float3(0.0f, 1.0f, 0.0f);
                    if (!(phi_out459 == 0.0f && tmp461 == 0.0f)) {
                        float tmp464 = phi_out459 * 2.0f;
                        float tmp465 = tmp461 * 2.0f;
                        tmp466 = tmp464 < 1.0f ? tmp464 : tmp464 + -2.0f;
                        tmp467 = tmp465 < 1.0f ? tmp465 : tmp465 + -2.0f;
                        tmp468 = tmp466 * tmp466;
                        tmp469 = tmp467 * tmp467;
                        if (tmp468 > tmp469) {
                            tmp470 = tmp467 * -0.7853981853f / tmp466;
                            phi_in471 = tmp466;
                            phi_in473 = tmp470;
                            phi_in475 = tmp468;
                        } else {
                            tmp477 = tmp466 * 0.7853981853f / tmp467 + -1.570796371f;
                            phi_in471 = tmp467;
                            phi_in473 = tmp477;
                            phi_in475 = tmp469;
                        }
                        phi_out472 = phi_in471;
                        phi_out474 = phi_in473;
                        phi_out476 = phi_in475;
                        tmp478 = 1.0f - phi_out476;
                        phi_in462 = float3(0.0f, 1.0f, 0.0f);
                        if (tmp478 > 0.0f) {
                            tmp479 = float3(sin(phi_out474) * phi_out472, sqrt(tmp478), cos(phi_out474) * phi_out472);
                            phi_in462 = tmp479;
                        }
                    }
                    phi_out463 = phi_in462;
                    tmp480 = phi_out463.x;
                    tmp481 = phi_out463.y;
                    tmp482 = phi_out463.z;
                    phi_in483 = tmp445.x;
                    phi_in485 = tmp445.y;
                    phi_in487 = tmp445.z;
                    phi_in489 = tmp441;
                    phi_in491 = tmp442;
                    phi_in493 = tmp443;
                    if (tmp452 < 0.9990000129f) {
                        float3 tmp495 = tmp435 * tmp450.yzx - tmp436 * tmp450.zxy;
                        float3 tmp496 = float3(sqrt(tmp495.x * tmp495.x + tmp495.y * tmp495.y + tmp495.z * tmp495.z), 0.0f, 0.0f);
                        float3 tmp497 = tmp495 / tmp496.xxx;
                        float3 tmp498 = tmp497.yzx * tmp435 - tmp497.zxy * tmp436;
                        phi_in483 = tmp497.x;
                        phi_in485 = tmp497.y;
                        phi_in487 = tmp497.z;
                        phi_in489 = tmp498.x;
                        phi_in491 = tmp498.y;
                        phi_in493 = tmp498.z;
                    }
                    phi_out484 = phi_in483;
                    phi_out486 = phi_in485;
                    phi_out488 = phi_in487;
                    phi_out490 = phi_in489;
                    phi_out492 = phi_in491;
                    phi_out494 = phi_in493;
                    phi_in499 = tmp481;
                    phi_in501 = tmp482;
                    if (tmp482 > 0.0f) {
                        if (tmp456) {
                            tmp503 = -tmp482;
                            phi_in499 = tmp481;
                            phi_in501 = tmp503;
                        } else {
                            tmp504 = tmp482 * tmp452;
                            tmp505 = sqrt(max(1.0f - (tmp504 * tmp504 + tmp480 * tmp480), 0.0f));
                            phi_in499 = tmp505;
                            phi_in501 = tmp504;
                        }
                    }
                    phi_out500 = phi_in499;
                    phi_out502 = phi_in501;
                    float tmp506 = phi_out500 * tmp309 + phi_out484 * tmp480 + phi_out502 * phi_out490;
                    float tmp507 = phi_out500 * tmp310 + phi_out486 * tmp480 + phi_out502 * phi_out492;
                    float tmp508 = phi_out500 * tmp311 + phi_out488 * tmp480 + phi_out502 * phi_out494;
                    float3 tmp509 = float3(sqrt(tmp506 * tmp506 + tmp507 * tmp507 + tmp508 * tmp508), 0.0f, 0.0f);
                    tmp510 = float3(tmp506, tmp507, tmp508) / tmp509.xxx;
                    sret_ptr.k2.x = tmp510.x;
                    sret_ptr.k2.y = tmp510.y;
                    sret_ptr.k2.z = tmp510.z;
                    float3 tmp511 = tmp510 * tmp450;
                    if (tmp511.x + tmp511.y + tmp511.z > 0.0f) {
                        sret_ptr.bsdf_over_pdf.x = tmp446;
                        sret_ptr.bsdf_over_pdf.y = tmp447;
                        sret_ptr.bsdf_over_pdf.z = tmp448;
                        if (tmp449 > 0.0f) {
                            float3 tmp512 = tmp510 * tmp312;
                            tmp513 = tmp512.x + tmp512.y + tmp512.z;
                            tmp514 = tmp449 * tmp449;
                            tmp515 = float3(tmp510.x - tmp513 * tmp309, tmp510.y - tmp513 * tmp310, tmp510.z - tmp513 * tmp311);
                            float3 tmp516 = tmp515 * tmp515;
                            tmp517 = float3(tmp3 - tmp314 * tmp309, tmp4 - tmp314 * tmp310, tmp5 - tmp314 * tmp311);
                            float3 tmp518 = tmp517 * tmp517;
                            tmp519 = (tmp516.x + tmp516.y + tmp516.z) * (tmp518.x + tmp518.y + tmp518.z);
                            phi_in520 = 0.0f;
                            if (!(tmp519 == 0.0f)) {
                                float3 tmp522 = tmp515 * tmp517;
                                tmp523 = tmp514 * 0.4499999881f * max(sqrt((1.0f - tmp513 * tmp513) * (1.0f - tmp314 * tmp314) / tmp519) * (tmp522.x + tmp522.y + tmp522.z) / max(tmp513, tmp314), 0.0f) / (tmp514 + 0.09000000358f);
                                phi_in520 = tmp523;
                            }
                            phi_out521 = phi_in520;
                            float tmp524 = phi_out521 + (1.0f - tmp514 / (tmp514 * 2.0f + 0.6600000262f));
                            sret_ptr.bsdf_over_pdf.x = tmp524 * tmp446;
                            sret_ptr.bsdf_over_pdf.y = tmp524 * tmp447;
                            sret_ptr.bsdf_over_pdf.z = tmp524 * tmp448;
                        }
                        sret_ptr.event_type = Bsdf_event_type(9);
                        sret_ptr.handle = 0;
                        phi_in347 = 9;
                    } else {
                        sret_ptr.pdf = 0.0f;
                        sret_ptr.event_type = Bsdf_event_type(0);
                        phi_in347 = 0;
                    }
                }
            } else {
                sret_ptr.xi.z = (phi_out321 + -1.0f) / 0.0f;
                sret_ptr.pdf = 0.0f;
                sret_ptr.event_type = Bsdf_event_type(0);
                phi_in347 = 0;
            }
            phi_out348 = phi_in347;
            phi_in248 = 0;
            if (phi_out348 != 0) {
                float tmp525 = sret_ptr.k2.x;
                float tmp526 = sret_ptr.k2.y;
                float tmp527 = sret_ptr.k2.z;
                tmp528 = float3(tmp525, tmp526, tmp527) * tmp312;
                float tmp529 = tmp526 + tmp4;
                float tmp530 = tmp525 + tmp3;
                float tmp531 = tmp527 + tmp5;
                float3 tmp532 = float3(sqrt(tmp529 * tmp529 + tmp530 * tmp530 + tmp531 * tmp531), 0.0f, 0.0f);
                tmp533 = float3(tmp530, tmp529, tmp531) * tmp6 / tmp532.xxx;
                if (tmp318) {
                    tmp534 = (pow(1.0f - min(max(abs(tmp533.x + tmp533.y + tmp533.z), 0.0f), 1.0f), 4.0f) * tmp315 + tmp307) * tmp308 / tmp317;
                    sret_ptr.bsdf_over_pdf.x = tmp534 * sret_ptr.bsdf_over_pdf.x;
                    sret_ptr.bsdf_over_pdf.y = tmp534 * sret_ptr.bsdf_over_pdf.y;
                    tmp535 = sret_ptr.bsdf_over_pdf.z;
                    phi_in536 = tmp534;
                    phi_in538 = tmp535;
                } else {
                    tmp540 = (1.0f - max(tmp316, pow(1.0f - min(max(abs(tmp528.x + tmp528.y + tmp528.z), 0.0f), 1.0f), 4.0f) * tmp315 + tmp307) * tmp308) / (1.0f - tmp317);
                    sret_ptr.bsdf_over_pdf.x = tmp540 * sret_ptr.bsdf_over_pdf.x;
                    sret_ptr.bsdf_over_pdf.y = tmp540 * sret_ptr.bsdf_over_pdf.y;
                    tmp541 = sret_ptr.bsdf_over_pdf.z;
                    phi_in536 = tmp541;
                    phi_in538 = tmp540;
                }
                phi_out537 = phi_in536;
                phi_out539 = phi_in538;
                sret_ptr.bsdf_over_pdf.z = phi_out539 * phi_out537;
                phi_in248 = phi_out348;
            }
        }
        phi_out249 = phi_in248;
        sret_ptr.bsdf_over_pdf.x = sret_ptr.bsdf_over_pdf.x * min(max(tmp124, 0.0f), 1.0f);
        sret_ptr.bsdf_over_pdf.y = sret_ptr.bsdf_over_pdf.y * min(max(tmp125, 0.0f), 1.0f);
        sret_ptr.bsdf_over_pdf.z = sret_ptr.bsdf_over_pdf.z * min(max(tmp126, 0.0f), 1.0f);
        phi_in37 = phi_out249;
    }
    phi_out38 = phi_in37;
    if (phi_out38 == 0) {
        tmp542 = sret_ptr.k1.x;
        tmp543 = sret_ptr.k1.y;
        tmp544 = sret_ptr.k1.z;
        tmp545 = sret_ptr.k2.x;
        tmp546 = sret_ptr.k2.y;
        tmp547 = sret_ptr.k2.z;
        phi_in548 = tmp547;
        phi_in550 = tmp546;
        phi_in552 = tmp545;
        phi_in554 = tmp544;
        phi_in556 = tmp543;
        phi_in558 = tmp542;
    } else {
        tmp560 = sret_ptr.k2.x;
        tmp561 = sret_ptr.k2.y;
        tmp562 = sret_ptr.k2.z;
        float3 tmp563 = float3(tmp560, tmp561, tmp562) * tmp12;
        tmp564 = abs(tmp563.x + tmp563.y + tmp563.z);
        if ((phi_out38 & 16) == 0) {
            tmp565 = sret_ptr.k1.x;
            tmp566 = tmp565 + tmp560;
            tmp567 = sret_ptr.k1.y;
            tmp568 = tmp567 + tmp561;
            phi_in569 = tmp567;
            phi_in571 = tmp565;
            phi_in573 = tmp562;
            phi_in575 = tmp566;
            phi_in577 = tmp568;
        } else {
            float tmp579 = tmp564 * 2.0f;
            tmp580 = tmp579 * tmp11 + tmp562;
            tmp581 = sret_ptr.k1.x;
            tmp582 = tmp579 * tmp9 + tmp560 + tmp581;
            tmp583 = sret_ptr.k1.y;
            tmp584 = tmp579 * tmp10 + tmp561 + tmp583;
            phi_in569 = tmp583;
            phi_in571 = tmp581;
            phi_in573 = tmp580;
            phi_in575 = tmp582;
            phi_in577 = tmp584;
        }
        phi_out570 = phi_in569;
        phi_out572 = phi_in571;
        phi_out574 = phi_in573;
        phi_out576 = phi_in575;
        phi_out578 = phi_in577;
        tmp585 = sret_ptr.k1.z;
        float tmp586 = tmp585 + phi_out574;
        float3 tmp587 = float3(sqrt(phi_out578 * phi_out578 + phi_out576 * phi_out576 + tmp586 * tmp586), 0.0f, 0.0f);
        tmp588 = float3(phi_out576, phi_out578, tmp586) * float3(phi_out572, phi_out570, tmp585) / tmp587.xxx;
        if (tmp21) {
            float tmp589 = 1.0f - min(max(abs(tmp588.x + tmp588.y + tmp588.z), 0.0f), 1.0f);
            float tmp590 = tmp589 * tmp589;
            tmp591 = (tmp590 * tmp590 * (tmp589 * tmp17) + tmp0) * tmp1 / tmp19;
            sret_ptr.bsdf_over_pdf.x = sret_ptr.bsdf_over_pdf.x * tmp591;
            sret_ptr.bsdf_over_pdf.y = sret_ptr.bsdf_over_pdf.y * tmp591;
            tmp592 = sret_ptr.bsdf_over_pdf.z;
            phi_in593 = tmp591;
            phi_in595 = tmp592;
        } else {
            float tmp597 = 1.0f - min(max(tmp564, 0.0f), 1.0f);
            float tmp598 = tmp597 * tmp597;
            tmp599 = (1.0f - max(tmp18, tmp598 * tmp598 * (tmp597 * tmp17) + tmp0) * tmp1) / (1.0f - tmp19);
            sret_ptr.bsdf_over_pdf.x = sret_ptr.bsdf_over_pdf.x * tmp599;
            sret_ptr.bsdf_over_pdf.y = sret_ptr.bsdf_over_pdf.y * tmp599;
            tmp600 = sret_ptr.bsdf_over_pdf.z;
            phi_in593 = tmp600;
            phi_in595 = tmp599;
        }
        phi_out594 = phi_in593;
        phi_out596 = phi_in595;
        sret_ptr.bsdf_over_pdf.z = phi_out596 * phi_out594;
        phi_in548 = tmp562;
        phi_in550 = tmp561;
        phi_in552 = tmp560;
        phi_in554 = tmp585;
        phi_in556 = phi_out570;
        phi_in558 = phi_out572;
    }
    phi_out549 = phi_in548;
    phi_out551 = phi_in550;
    phi_out553 = phi_in552;
    phi_out555 = phi_in554;
    phi_out557 = phi_in556;
    phi_out559 = phi_in558;
    pdf_data.ior1.x = sret_ptr.ior1.x;
    pdf_data.ior1.y = sret_ptr.ior1.y;
    pdf_data.ior1.z = sret_ptr.ior1.z;
    pdf_data.ior2.x = sret_ptr.ior2.x;
    pdf_data.ior2.y = sret_ptr.ior2.y;
    pdf_data.ior2.z = sret_ptr.ior2.z;
    pdf_data.k1.x = phi_out559;
    pdf_data.k1.y = phi_out557;
    pdf_data.k1.z = phi_out555;
    pdf_data.k2.x = phi_out553;
    pdf_data.k2.y = phi_out551;
    pdf_data.k2.z = phi_out549;
    gen_custom_curve_layer_pdf(pdf_data, state);
    float tmp601 = pdf_data.pdf;
    sret_ptr.pdf = tmp601;
    return;
}

void mdl_surface_scattering_evaluate(inout Bsdf_evaluate_data sret_ptr, in Shading_state_material state)
{
    float tmp0;
    float tmp1;
    float tmp2;
    float tmp4;
    float tmp5;
    float tmp6;
    float3 tmp7;
    float tmp9;
    float tmp10;
    float tmp11;
    float tmp12;
    float3 tmp13;
    float tmp15;
    float tmp16;
    float tmp17;
    float tmp18;
    float tmp19;
    float3 tmp20;
    float tmp22;
    float tmp23;
    float3 tmp24;
    float tmp26;
    bool tmp27;
    float phi_in;
    float phi_out;
    float phi_in28;
    float phi_out29;
    float phi_in30;
    float phi_out31;
    float tmp33;
    float tmp34;
    float tmp35;
    float tmp46;
    float tmp47;
    float tmp50;
    float tmp51;
    float tmp52;
    float tmp53;
    float tmp54;
    float tmp55;
    float3 tmp57;
    float3 tmp58;
    float3 tmp59;
    float tmp61;
    float phi_in62;
    float phi_out63;
    float3 phi_in64;
    float3 phi_out65;
    float phi_in66;
    float phi_out67;
    float3 tmp69;
    float3 tmp70;
    float tmp71;
    float phi_in72;
    float phi_out73;
    float3 phi_in74;
    float3 phi_out75;
    float3 tmp80;
    float tmp82;
    float tmp100;
    float3 tmp102;
    float tmp103;
    float tmp104;
    float tmp105;
    float tmp106;
    float tmp107;
    float tmp108;
    float tmp109;
    float tmp110;
    float tmp111;
    float tmp113;
    float tmp114;
    float tmp115;
    float tmp116;
    float tmp117;
    float tmp118;
    float tmp119;
    float phi_in120;
    float phi_out121;
    float tmp122;
    float tmp123;
    float tmp124;
    float tmp125;
    float tmp126;
    float tmp127;
    float tmp128;
    float tmp129;
    float tmp130;
    float tmp131;
    float tmp132;
    float tmp133;
    float3 tmp134;
    float3 tmp135;
    float phi_in136;
    float phi_out137;
    float phi_in138;
    float phi_out139;
    float phi_in140;
    float phi_out141;
    float tmp143;
    float tmp144;
    float tmp145;
    float tmp151;
    float3 phi_in152;
    float3 phi_out153;
    float tmp154;
    float phi_in155;
    float phi_out156;
    float phi_in157;
    float phi_out158;
    float phi_in159;
    float phi_out160;
    float tmp161;
    float tmp162;
    float3 tmp204;
    float tmp205;
    float tmp206;
    float tmp207;
    float phi_in208;
    float phi_out209;
    float tmp210;
    float tmp211;
    float tmp212;
    float tmp213;
    float tmp214;
    float tmp215;
    float tmp216;
    float3 tmp218;
    float3 tmp219;
    float3 tmp220;
    float tmp222;
    float phi_in223;
    float phi_out224;
    float3 phi_in225;
    float3 phi_out226;
    float phi_in227;
    float phi_out228;
    float3 tmp230;
    float3 tmp231;
    float tmp233;
    float tmp234;
    float tmp235;
    float tmp236;
    float phi_in237;
    float phi_out238;
    float3 phi_in239;
    float3 phi_out240;
    float3 tmp245;
    float tmp247;
    float tmp265;
    float3 tmp267;
    float tmp268;
    float tmp269;
    float tmp270;
    float tmp271;
    float tmp272;
    float tmp273;
    float phi_in274;
    float phi_out275;
    float tmp276;
    float tmp277;
    float tmp278;
    float tmp279;
    float tmp280;
    float tmp281;
    float tmp282;
    float tmp283;
    float tmp284;
    float tmp285;
    float3 tmp286;
    float tmp288;
    float tmp289;
    float tmp291;
    float tmp292;
    float phi_in293;
    float phi_out294;
    float phi_in295;
    float phi_out296;
    float phi_in297;
    float phi_out298;
    float tmp300;
    float tmp301;
    float tmp302;
    float tmp309;
    float tmp310;
    float tmp311;
    float tmp313;
    float tmp314;
    float tmp315;
    float tmp316;
    float tmp317;
    float tmp318;
    float tmp320;
    float tmp321;
    float tmp322;
    float tmp323;
    bool tmp324;
    float3 tmp326;
    float3 tmp327;
    float3 tmp328;
    float tmp330;
    float phi_in331;
    float phi_out332;
    float3 phi_in333;
    float3 phi_out334;
    float phi_in335;
    float phi_out336;
    float3 tmp338;
    float3 tmp339;
    float tmp340;
    float phi_in341;
    float phi_out342;
    float3 phi_in343;
    float3 phi_out344;
    float3 tmp349;
    float tmp351;
    float tmp369;
    float3 tmp371;
    float tmp372;
    float tmp373;
    float tmp374;
    float tmp375;
    float tmp376;
    float tmp377;
    float tmp378;
    float tmp379;
    float tmp381;
    float tmp382;
    float tmp383;
    float tmp384;
    float tmp385;
    float tmp386;
    float tmp387;
    float phi_in388;
    float phi_out389;
    float tmp392;
    float phi_in393;
    float phi_out394;
    float phi_in395;
    float phi_out396;
    float phi_in397;
    float phi_out398;
    float tmp399;
    float tmp400;
    float tmp401;
    float tmp402;
    float3 tmp403;
    float3 tmp405;
    float tmp407;
    float phi_in408;
    float phi_out409;
    float tmp411;
    float tmp413;
    float tmp414;
    float tmp415;
    float tmp416;
    tmp0 = min(max(state.text_results[16].z, 0.0f), 1.0f);
    tmp1 = min(max(1.0f - state.text_results[12].x, 0.0f), 1.0f);
    tmp2 = min(max(state.text_results[12].y, 0.0f), 1.0f);
    float3 tmp3 = state.geom_normal;
    tmp4 = sret_ptr.k1.x;
    tmp5 = sret_ptr.k1.y;
    tmp6 = sret_ptr.k1.z;
    tmp7 = float3(tmp4, tmp5, tmp6);
    float3 tmp8 = tmp7 * tmp3;
    tmp9 = asfloat((asint(tmp8.x + tmp8.y + tmp8.z) & -2147483648) | 1065353216);
    tmp10 = state.text_results[20].w * tmp9;
    tmp11 = state.text_results[21].x * tmp9;
    tmp12 = state.text_results[21].y * tmp9;
    tmp13 = float3(tmp10, tmp11, tmp12);
    float3 tmp14 = tmp13 * tmp7;
    tmp15 = tmp14.x + tmp14.y + tmp14.z;
    tmp16 = min(max(tmp15, 0.0f), 1.0f);
    tmp17 = sret_ptr.k2.x;
    tmp18 = sret_ptr.k2.y;
    tmp19 = sret_ptr.k2.z;
    tmp20 = float3(tmp17, tmp18, tmp19);
    float3 tmp21 = tmp13 * tmp20;
    tmp22 = tmp21.x + tmp21.y + tmp21.z;
    tmp23 = abs(tmp22);
    tmp24 = float3(tmp3.x * tmp9, tmp3.y * tmp9, tmp3.z * tmp9);
    float3 tmp25 = tmp24 * tmp20;
    tmp26 = tmp25.x + tmp25.y + tmp25.z;
    tmp27 = tmp26 < 0.0f;
    phi_in = tmp19;
    phi_in28 = tmp17;
    phi_in30 = tmp18;
    if (tmp27) {
        float tmp32 = tmp23 * 2.0f;
        tmp33 = tmp32 * tmp10 + tmp17;
        tmp34 = tmp32 * tmp11 + tmp18;
        tmp35 = tmp32 * tmp12 + tmp19;
        phi_in = tmp35;
        phi_in28 = tmp33;
        phi_in30 = tmp34;
    }
    phi_out = phi_in;
    phi_out29 = phi_in28;
    phi_out31 = phi_in30;
    float tmp36 = phi_out31 + tmp5;
    float tmp37 = phi_out29 + tmp4;
    float tmp38 = phi_out + tmp6;
    float3 tmp39 = float3(sqrt(tmp37 * tmp37 + tmp38 * tmp38 + tmp36 * tmp36), 0.0f, 0.0f);
    float3 tmp40 = float3(tmp37, tmp36, tmp38) * tmp7 / tmp39.xxx;
    float tmp41 = 1.0f - min(max(abs(tmp40.x + tmp40.y + tmp40.z), 0.0f), 1.0f);
    float tmp42 = tmp41 * tmp41;
    float tmp43 = tmp1 - tmp0;
    float tmp44 = 1.0f - min(max(tmp16, 0.0f), 1.0f);
    float tmp45 = tmp44 * tmp44;
    tmp46 = tmp45 * tmp45 * (tmp44 * tmp43) + tmp0;
    tmp47 = min(max(tmp23, 0.0f), 1.0f);
    float tmp48 = 1.0f - tmp47;
    float tmp49 = tmp48 * tmp48;
    tmp50 = tmp49 * tmp49 * (tmp48 * tmp43) + tmp0;
    tmp51 = (tmp42 * tmp42 * (tmp41 * tmp43) + tmp0) * tmp2;
    tmp52 = state.text_results[16].y;
    tmp53 = state.text_results[16].x;
    tmp54 = max(tmp53, 1.000000012e-07f);
    tmp55 = max(tmp52, 1.000000012e-07f);
    float3 tmp56 = float3(state.text_results[18].z, state.text_results[18].w, state.text_results[19].x);
    tmp57 = tmp13.zxy;
    tmp58 = tmp13.yzx;
    tmp59 = tmp56.yzx * tmp57 - tmp56.zxy * tmp58;
    float3 tmp60 = tmp59 * tmp59;
    tmp61 = tmp60.x + tmp60.y + tmp60.z;
    phi_in62 = 0.0f;
    phi_in64 = float3(0.0f, 0.0f, 0.0f);
    phi_in66 = 0.0f;
    if (!(tmp61 < 9.999999939e-09f)) {
        float tmp68 = 1.0f / sqrt(tmp61);
        tmp69 = float3(tmp68 * tmp59.x, tmp68 * tmp59.y, tmp68 * tmp59.z);
        tmp70 = tmp69.zxy * tmp58 - tmp69.yzx * tmp57;
        if (sret_ptr.ior1.x == -1.0f) {
            sret_ptr.ior1.x = 1.0f;
            sret_ptr.ior1.y = 1.0f;
            sret_ptr.ior1.z = 1.0f;
        }
        if (sret_ptr.ior2.x == -1.0f) {
            sret_ptr.ior2.x = 1.0f;
            sret_ptr.ior2.y = 1.0f;
            sret_ptr.ior2.z = 1.0f;
        }
        tmp71 = abs(tmp15);
        phi_in72 = 0.0f;
        phi_in74 = float3(0.0f, 0.0f, 0.0f);
        if (!tmp27) {
            float tmp76 = tmp17 + tmp4;
            float tmp77 = tmp18 + tmp5;
            float tmp78 = tmp19 + tmp6;
            float3 tmp79 = float3(sqrt(tmp77 * tmp77 + tmp76 * tmp76 + tmp78 * tmp78), 0.0f, 0.0f);
            tmp80 = float3(tmp76, tmp77, tmp78) / tmp79.xxx;
            float3 tmp81 = tmp13 * tmp80;
            tmp82 = tmp81.x + tmp81.y + tmp81.z;
            float3 tmp83 = tmp80 * tmp7;
            float3 tmp84 = tmp80 * tmp20;
            phi_in72 = 0.0f;
            phi_in74 = float3(0.0f, 0.0f, 0.0f);
            if (!(tmp84.x + tmp84.y + tmp84.z < 0.0f || (tmp83.x + tmp83.y + tmp83.z < 0.0f || tmp82 < 0.0f))) {
                float3 tmp85 = tmp70 * tmp80;
                float3 tmp86 = tmp69 * tmp80;
                float tmp87 = 1.0f / tmp54;
                float tmp88 = 1.0f / tmp55;
                float tmp89 = (tmp85.x + tmp85.y + tmp85.z) * tmp87;
                float tmp90 = (tmp86.x + tmp86.y + tmp86.z) * tmp88;
                float tmp91 = tmp90 * tmp90 + tmp82 * tmp82 + tmp89 * tmp89;
                float3 tmp92 = tmp70 * tmp7;
                float3 tmp93 = tmp69 * tmp7;
                float3 tmp94 = tmp70 * tmp20;
                float3 tmp95 = tmp69 * tmp20;
                float tmp96 = (tmp92.x + tmp92.y + tmp92.z) * tmp54;
                float tmp97 = (tmp93.x + tmp93.y + tmp93.z) * tmp55;
                float tmp98 = (tmp94.x + tmp94.y + tmp94.z) * tmp54;
                float tmp99 = (tmp95.x + tmp95.y + tmp95.z) * tmp55;
                tmp100 = tmp82 * 0.1591549367f * tmp88 * tmp87 / (tmp91 * tmp91 * (tmp71 * tmp82) * (sqrt((tmp96 * tmp96 + tmp97 * tmp97) / (tmp15 * tmp15) + 1.0f) + 1.0f));
                float tmp101 = tmp100 * 2.0f / (sqrt((tmp98 * tmp98 + tmp99 * tmp99) / (tmp22 * tmp22) + 1.0f) + 1.0f);
                tmp102 = float3(tmp101, tmp101, tmp101);
                phi_in72 = tmp100;
                phi_in74 = tmp102;
            }
        }
        phi_out73 = phi_in72;
        phi_out75 = phi_in74;
        tmp103 = min(max(sqrt(tmp53 * tmp52), 0.0f), 1.0f) * 0.984375f + 0.0078125f;
        tmp104 = tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp71, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp103, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
        tmp105 = tmp104 * phi_out73;
        phi_in62 = tmp105;
        phi_in64 = phi_out75;
        phi_in66 = 0.0f;
        if (!(tmp26 < 0.0f)) {
            tmp106 = 0.3183098733f - tmp104 * 0.3183098733f + tmp105;
            tmp107 = tmp23 * 0.9200000167f * (1.0f - tmp104) * (1.0f - tex_lookup_float3_3d(1, float3(min(max(acos(tmp47) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp103, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x) / tex_lookup_float3_3d(1, float3(1.0f, tmp103, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
            phi_in62 = tmp106;
            phi_in64 = phi_out75;
            phi_in66 = tmp107;
        }
    }
    phi_out63 = phi_in62;
    phi_out65 = phi_in64;
    phi_out67 = phi_in66;
    tmp108 = phi_out67 * tmp51;
    tmp109 = phi_out65.x * tmp51;
    tmp110 = phi_out65.y * tmp51;
    tmp111 = phi_out65.z * tmp51;
    sret_ptr.bsdf_diffuse.x = tmp108;
    sret_ptr.bsdf_diffuse.y = tmp108;
    sret_ptr.bsdf_diffuse.z = tmp108;
    sret_ptr.bsdf_glossy.x = tmp109;
    sret_ptr.bsdf_glossy.y = tmp110;
    sret_ptr.bsdf_glossy.z = tmp111;
    float tmp112 = 1.0f - max(tmp46, tmp50) * tmp2;
    tmp113 = min(max(state.text_results[13].z, 0.0f), 1.0f) * tmp112;
    tmp114 = min(max(state.text_results[13].w, 0.0f), 1.0f) * tmp112;
    tmp115 = min(max(state.text_results[14].x, 0.0f), 1.0f) * tmp112;
    tmp116 = state.text_results[20].x;
    tmp117 = state.text_results[20].y;
    tmp118 = state.text_results[20].z;
    tmp119 = min(max(state.text_results[15].y, 0.0f), 1.0f);
    phi_in120 = 0.0f;
    if (tmp119 > 0.0f) {
        tmp122 = tmp119 * tmp113;
        tmp123 = tmp119 * tmp114;
        tmp124 = tmp119 * tmp115;
        tmp125 = state.text_results[23].x;
        tmp126 = state.text_results[23].y;
        tmp127 = state.text_results[23].z;
        tmp128 = state.text_results[22].y;
        tmp129 = state.text_results[22].z;
        tmp130 = state.text_results[22].w;
        tmp131 = tmp116 * tmp9;
        tmp132 = tmp117 * tmp9;
        tmp133 = tmp118 * tmp9;
        tmp134 = float3(tmp131, tmp132, tmp133);
        tmp135 = tmp134 * tmp20;
        phi_in136 = tmp19;
        phi_in138 = tmp17;
        phi_in140 = tmp18;
        if (tmp27) {
            float tmp142 = abs(tmp135.x + tmp135.y + tmp135.z) * 2.0f;
            tmp143 = tmp142 * tmp131 + tmp17;
            tmp144 = tmp142 * tmp132 + tmp18;
            tmp145 = tmp142 * tmp133 + tmp19;
            phi_in136 = tmp145;
            phi_in138 = tmp143;
            phi_in140 = tmp144;
        }
        phi_out137 = phi_in136;
        phi_out139 = phi_in138;
        phi_out141 = phi_in140;
        float tmp146 = phi_out141 + tmp5;
        float tmp147 = phi_out139 + tmp4;
        float tmp148 = phi_out137 + tmp6;
        float3 tmp149 = float3(sqrt(tmp147 * tmp147 + tmp148 * tmp148 + tmp146 * tmp146), 0.0f, 0.0f);
        float3 tmp150 = float3(tmp147, tmp146, tmp148) * tmp7 / tmp149.xxx;
        tmp151 = tmp150.x + tmp150.y + tmp150.z;
        phi_in152 = float3(0.0f, 0.0f, 0.0f);
        if (!(tmp151 < 0.0f)) {
            tmp154 = sret_ptr.ior1.x;
            if (tmp154 == -1.0f) {
                sret_ptr.ior1.x = 1.0f;
                sret_ptr.ior1.y = 1.0f;
                sret_ptr.ior1.z = 1.0f;
                phi_in155 = 1.0f;
                phi_in157 = 1.0f;
                phi_in159 = 1.0f;
            } else {
                tmp161 = sret_ptr.ior1.y;
                tmp162 = sret_ptr.ior1.z;
                phi_in155 = tmp162;
                phi_in157 = tmp161;
                phi_in159 = tmp154;
            }
            phi_out156 = phi_in155;
            phi_out158 = phi_in157;
            phi_out160 = phi_in159;
            float tmp163 = 1.0f / phi_out160;
            float tmp164 = 1.0f / phi_out158;
            float tmp165 = 1.0f / phi_out156;
            float tmp166 = tmp163 * tmp128;
            float tmp167 = tmp164 * tmp129;
            float tmp168 = tmp165 * tmp130;
            float tmp169 = tmp163 * tmp125;
            float tmp170 = tmp164 * tmp126;
            float tmp171 = tmp165 * tmp127;
            float tmp172 = tmp151 * tmp151;
            float tmp173 = 1.0f - tmp172;
            float tmp174 = -tmp173;
            float tmp175 = tmp166 * tmp166;
            float tmp176 = tmp169 * tmp169;
            float tmp177 = tmp174 - tmp176 + tmp175;
            float tmp178 = sqrt(tmp177 * tmp177 + tmp175 * 4.0f * tmp176);
            float tmp179 = tmp178 + tmp172;
            float tmp180 = tmp151 * 2.0f;
            float tmp181 = sqrt(max((tmp178 + tmp177) * 0.5f, 0.0f)) * tmp180;
            float tmp182 = (tmp179 - tmp181) / (tmp181 + tmp179);
            float tmp183 = tmp173 * tmp173;
            float tmp184 = tmp178 * tmp172 + tmp183;
            float tmp185 = tmp181 * tmp173;
            float tmp186 = tmp167 * tmp167;
            float tmp187 = tmp170 * tmp170;
            float tmp188 = tmp174 - tmp187 + tmp186;
            float tmp189 = sqrt(tmp188 * tmp188 + tmp186 * 4.0f * tmp187);
            float tmp190 = tmp189 + tmp172;
            float tmp191 = sqrt(max((tmp189 + tmp188) * 0.5f, 0.0f)) * tmp180;
            float tmp192 = (tmp190 - tmp191) / (tmp191 + tmp190);
            float tmp193 = tmp189 * tmp172 + tmp183;
            float tmp194 = tmp191 * tmp173;
            float tmp195 = tmp168 * tmp168;
            float tmp196 = tmp171 * tmp171;
            float tmp197 = tmp174 - tmp196 + tmp195;
            float tmp198 = sqrt(tmp197 * tmp197 + tmp195 * 4.0f * tmp196);
            float tmp199 = tmp198 + tmp172;
            float tmp200 = sqrt(max((tmp198 + tmp197) * 0.5f, 0.0f)) * tmp180;
            float tmp201 = (tmp199 - tmp200) / (tmp200 + tmp199);
            float tmp202 = tmp198 * tmp172 + tmp183;
            float tmp203 = tmp200 * tmp173;
            tmp204 = float3(min(max((tmp182 * (tmp184 - tmp185) / (tmp185 + tmp184) + tmp182) * 0.5f, 0.0f), 1.0f), min(max((tmp192 * (tmp193 - tmp194) / (tmp194 + tmp193) + tmp192) * 0.5f, 0.0f), 1.0f), min(max((tmp201 * (tmp202 - tmp203) / (tmp203 + tmp202) + tmp201) * 0.5f, 0.0f), 1.0f));
            phi_in152 = tmp204;
        }
        phi_out153 = phi_in152;
        tmp205 = phi_out153.x;
        tmp206 = phi_out153.y;
        tmp207 = phi_out153.z;
        phi_in208 = 0.0f;
        if (!(tmp207 == 0.0f && (tmp205 == 0.0f && tmp206 == 0.0f))) {
            tmp210 = tmp122 * tmp205;
            tmp211 = tmp123 * tmp206;
            tmp212 = tmp124 * tmp207;
            tmp213 = state.text_results[13].y;
            tmp214 = state.text_results[13].x;
            tmp215 = max(tmp214, 1.000000012e-07f);
            tmp216 = max(tmp213, 1.000000012e-07f);
            float3 tmp217 = float3(state.text_results[17].w, state.text_results[18].x, state.text_results[18].y);
            tmp218 = tmp134.zxy;
            tmp219 = tmp134.yzx;
            tmp220 = tmp217.yzx * tmp218 - tmp217.zxy * tmp219;
            float3 tmp221 = tmp220 * tmp220;
            tmp222 = tmp221.x + tmp221.y + tmp221.z;
            phi_in223 = 0.0f;
            phi_in225 = float3(0.0f, 0.0f, 0.0f);
            phi_in227 = 0.0f;
            if (!(tmp222 < 9.999999939e-09f)) {
                float tmp229 = 1.0f / sqrt(tmp222);
                tmp230 = float3(tmp229 * tmp220.x, tmp229 * tmp220.y, tmp229 * tmp220.z);
                tmp231 = tmp230.zxy * tmp219 - tmp230.yzx * tmp218;
                if (sret_ptr.ior1.x == -1.0f) {
                    sret_ptr.ior1.x = 1.0f;
                    sret_ptr.ior1.y = 1.0f;
                    sret_ptr.ior1.z = 1.0f;
                }
                if (sret_ptr.ior2.x == -1.0f) {
                    sret_ptr.ior2.x = 1.0f;
                    sret_ptr.ior2.y = 1.0f;
                    sret_ptr.ior2.z = 1.0f;
                }
                float3 tmp232 = tmp134 * tmp7;
                tmp233 = tmp232.x + tmp232.y + tmp232.z;
                tmp234 = abs(tmp233);
                tmp235 = tmp135.x + tmp135.y + tmp135.z;
                tmp236 = abs(tmp235);
                phi_in237 = 0.0f;
                phi_in239 = float3(0.0f, 0.0f, 0.0f);
                if (!tmp27) {
                    float tmp241 = tmp17 + tmp4;
                    float tmp242 = tmp18 + tmp5;
                    float tmp243 = tmp19 + tmp6;
                    float3 tmp244 = float3(sqrt(tmp242 * tmp242 + tmp241 * tmp241 + tmp243 * tmp243), 0.0f, 0.0f);
                    tmp245 = float3(tmp241, tmp242, tmp243) / tmp244.xxx;
                    float3 tmp246 = tmp134 * tmp245;
                    tmp247 = tmp246.x + tmp246.y + tmp246.z;
                    float3 tmp248 = tmp245 * tmp7;
                    float3 tmp249 = tmp245 * tmp20;
                    phi_in237 = 0.0f;
                    phi_in239 = float3(0.0f, 0.0f, 0.0f);
                    if (!(tmp249.x + tmp249.y + tmp249.z < 0.0f || (tmp248.x + tmp248.y + tmp248.z < 0.0f || tmp247 < 0.0f))) {
                        float3 tmp250 = tmp231 * tmp245;
                        float3 tmp251 = tmp230 * tmp245;
                        float tmp252 = 1.0f / tmp215;
                        float tmp253 = 1.0f / tmp216;
                        float tmp254 = (tmp250.x + tmp250.y + tmp250.z) * tmp252;
                        float tmp255 = (tmp251.x + tmp251.y + tmp251.z) * tmp253;
                        float tmp256 = tmp255 * tmp255 + tmp247 * tmp247 + tmp254 * tmp254;
                        float3 tmp257 = tmp231 * tmp7;
                        float3 tmp258 = tmp230 * tmp7;
                        float3 tmp259 = tmp231 * tmp20;
                        float3 tmp260 = tmp230 * tmp20;
                        float tmp261 = (tmp257.x + tmp257.y + tmp257.z) * tmp215;
                        float tmp262 = (tmp258.x + tmp258.y + tmp258.z) * tmp216;
                        float tmp263 = (tmp259.x + tmp259.y + tmp259.z) * tmp215;
                        float tmp264 = (tmp260.x + tmp260.y + tmp260.z) * tmp216;
                        tmp265 = tmp247 * 0.1591549367f * tmp253 * tmp252 / (tmp256 * tmp256 * (tmp234 * tmp247) * (sqrt((tmp261 * tmp261 + tmp262 * tmp262) / (tmp233 * tmp233) + 1.0f) + 1.0f));
                        float tmp266 = tmp265 * 2.0f / (sqrt((tmp263 * tmp263 + tmp264 * tmp264) / (tmp235 * tmp235) + 1.0f) + 1.0f);
                        tmp267 = float3(tmp266, tmp266, tmp266);
                        phi_in237 = tmp265;
                        phi_in239 = tmp267;
                    }
                }
                phi_out238 = phi_in237;
                phi_out240 = phi_in239;
                tmp268 = min(max(sqrt(tmp214 * tmp213), 0.0f), 1.0f) * 0.984375f + 0.0078125f;
                tmp269 = tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp234, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp268, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                tmp270 = tmp269 * phi_out238;
                phi_in223 = tmp270;
                phi_in225 = phi_out240;
                phi_in227 = 0.0f;
                if (!(tmp26 < 0.0f)) {
                    tmp271 = (1.0f - tmp269) * tmp236 * (1.0f - tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp236, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp268, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x) / tex_lookup_float3_3d(1, float3(1.0f, tmp268, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                    tmp272 = tmp269 * -0.3183098733f + 0.3183098733f + tmp270;
                    phi_in223 = tmp272;
                    phi_in225 = phi_out240;
                    phi_in227 = tmp271;
                }
            }
            phi_out224 = phi_in223;
            phi_out226 = phi_in225;
            phi_out228 = phi_in227;
            sret_ptr.bsdf_diffuse.x = phi_out228 * tmp210 + tmp108;
            sret_ptr.bsdf_diffuse.y = phi_out228 * tmp211 + tmp108;
            sret_ptr.bsdf_diffuse.z = phi_out228 * tmp212 + tmp108;
            sret_ptr.bsdf_glossy.x = phi_out226.x * tmp210 + tmp109;
            sret_ptr.bsdf_glossy.y = phi_out226.y * tmp211 + tmp110;
            sret_ptr.bsdf_glossy.z = phi_out226.z * tmp212 + tmp111;
            phi_in208 = phi_out224;
        }
        phi_out209 = phi_in208;
        tmp273 = phi_out209 * tmp119;
        phi_in120 = tmp273;
    }
    phi_out121 = phi_in120;
    phi_in274 = phi_out121;
    if (tmp119 < 1.0f) {
        tmp276 = 1.0f - tmp119;
        tmp277 = tmp276 * tmp113;
        tmp278 = tmp276 * tmp114;
        tmp279 = tmp276 * tmp115;
        tmp280 = min(max(state.text_results[16].w, 0.0f), 1.0f);
        tmp281 = min(max(1.0f - state.text_results[12].z, 0.0f), 1.0f);
        tmp282 = min(max(state.text_results[15].x, 0.0f), 1.0f);
        tmp283 = tmp116 * tmp9;
        tmp284 = tmp117 * tmp9;
        tmp285 = tmp118 * tmp9;
        tmp286 = float3(tmp283, tmp284, tmp285);
        float3 tmp287 = tmp286 * tmp7;
        tmp288 = tmp287.x + tmp287.y + tmp287.z;
        tmp289 = min(max(tmp288, 0.0f), 1.0f);
        float3 tmp290 = tmp286 * tmp20;
        tmp291 = tmp290.x + tmp290.y + tmp290.z;
        tmp292 = abs(tmp291);
        phi_in293 = tmp19;
        phi_in295 = tmp17;
        phi_in297 = tmp18;
        if (tmp27) {
            float tmp299 = tmp292 * 2.0f;
            tmp300 = tmp299 * tmp283 + tmp17;
            tmp301 = tmp299 * tmp284 + tmp18;
            tmp302 = tmp299 * tmp285 + tmp19;
            phi_in293 = tmp302;
            phi_in295 = tmp300;
            phi_in297 = tmp301;
        }
        phi_out294 = phi_in293;
        phi_out296 = phi_in295;
        phi_out298 = phi_in297;
        float tmp303 = phi_out298 + tmp5;
        float tmp304 = phi_out296 + tmp4;
        float tmp305 = phi_out294 + tmp6;
        float3 tmp306 = float3(sqrt(tmp304 * tmp304 + tmp305 * tmp305 + tmp303 * tmp303), 0.0f, 0.0f);
        float3 tmp307 = float3(tmp304, tmp303, tmp305) * tmp7 / tmp306.xxx;
        float tmp308 = tmp281 - tmp280;
        tmp309 = pow(1.0f - min(max(tmp289, 0.0f), 1.0f), 4.0f) * tmp308 + tmp280;
        tmp310 = min(max(tmp292, 0.0f), 1.0f);
        tmp311 = pow(1.0f - tmp310, 4.0f) * tmp308 + tmp280;
        float tmp312 = (pow(1.0f - min(max(abs(tmp307.x + tmp307.y + tmp307.z), 0.0f), 1.0f), 4.0f) * tmp308 + tmp280) * tmp282;
        tmp313 = tmp312 * tmp277;
        tmp314 = tmp312 * tmp278;
        tmp315 = tmp312 * tmp279;
        tmp316 = state.text_results[21].z;
        tmp317 = state.text_results[21].w;
        tmp318 = state.text_results[22].x;
        float3 tmp319 = float3(tmp316, tmp317, tmp318) * float3(0.9200000167f, 0.9200000167f, 0.9200000167f);
        tmp320 = state.text_results[13].y;
        tmp321 = state.text_results[13].x;
        tmp322 = max(tmp321, 1.000000012e-07f);
        tmp323 = max(tmp320, 1.000000012e-07f);
        tmp324 = tmp319.z > 0.0f || (tmp319.x > 0.0f || tmp319.y > 0.0f);
        float3 tmp325 = float3(state.text_results[17].w, state.text_results[18].x, state.text_results[18].y);
        tmp326 = tmp286.zxy;
        tmp327 = tmp286.yzx;
        tmp328 = tmp325.yzx * tmp326 - tmp325.zxy * tmp327;
        float3 tmp329 = tmp328 * tmp328;
        tmp330 = tmp329.x + tmp329.y + tmp329.z;
        if (tmp330 < 9.999999939e-09f) {
            sret_ptr.pdf = 0.0f;
            phi_in331 = 0.0f;
            phi_in333 = float3(0.0f, 0.0f, 0.0f);
            phi_in335 = 0.0f;
        } else {
            float tmp337 = 1.0f / sqrt(tmp330);
            tmp338 = float3(tmp337 * tmp328.x, tmp337 * tmp328.y, tmp337 * tmp328.z);
            tmp339 = tmp338.zxy * tmp327 - tmp338.yzx * tmp326;
            if (sret_ptr.ior1.x == -1.0f) {
                sret_ptr.ior1.x = 1.0f;
                sret_ptr.ior1.y = 1.0f;
                sret_ptr.ior1.z = 1.0f;
            }
            if (sret_ptr.ior2.x == -1.0f) {
                sret_ptr.ior2.x = 1.0f;
                sret_ptr.ior2.y = 1.0f;
                sret_ptr.ior2.z = 1.0f;
            }
            tmp340 = abs(tmp288);
            phi_in341 = 0.0f;
            phi_in343 = float3(0.0f, 0.0f, 0.0f);
            if (!tmp27) {
                float tmp345 = tmp17 + tmp4;
                float tmp346 = tmp18 + tmp5;
                float tmp347 = tmp19 + tmp6;
                float3 tmp348 = float3(sqrt(tmp346 * tmp346 + tmp345 * tmp345 + tmp347 * tmp347), 0.0f, 0.0f);
                tmp349 = float3(tmp345, tmp346, tmp347) / tmp348.xxx;
                float3 tmp350 = tmp286 * tmp349;
                tmp351 = tmp350.x + tmp350.y + tmp350.z;
                float3 tmp352 = tmp349 * tmp7;
                float3 tmp353 = tmp349 * tmp20;
                phi_in341 = 0.0f;
                phi_in343 = float3(0.0f, 0.0f, 0.0f);
                if (!(tmp353.x + tmp353.y + tmp353.z < 0.0f || (tmp352.x + tmp352.y + tmp352.z < 0.0f || tmp351 < 0.0f))) {
                    float3 tmp354 = tmp339 * tmp349;
                    float3 tmp355 = tmp338 * tmp349;
                    float tmp356 = 1.0f / tmp322;
                    float tmp357 = 1.0f / tmp323;
                    float tmp358 = (tmp354.x + tmp354.y + tmp354.z) * tmp356;
                    float tmp359 = (tmp355.x + tmp355.y + tmp355.z) * tmp357;
                    float tmp360 = tmp359 * tmp359 + tmp351 * tmp351 + tmp358 * tmp358;
                    float3 tmp361 = tmp339 * tmp7;
                    float3 tmp362 = tmp338 * tmp7;
                    float3 tmp363 = tmp339 * tmp20;
                    float3 tmp364 = tmp338 * tmp20;
                    float tmp365 = (tmp361.x + tmp361.y + tmp361.z) * tmp322;
                    float tmp366 = (tmp362.x + tmp362.y + tmp362.z) * tmp323;
                    float tmp367 = (tmp363.x + tmp363.y + tmp363.z) * tmp322;
                    float tmp368 = (tmp364.x + tmp364.y + tmp364.z) * tmp323;
                    tmp369 = tmp351 * 0.1591549367f * tmp357 * tmp356 / (tmp360 * tmp360 * (tmp340 * tmp351) * (sqrt((tmp365 * tmp365 + tmp366 * tmp366) / (tmp288 * tmp288) + 1.0f) + 1.0f));
                    float tmp370 = tmp369 * 2.0f / (sqrt((tmp367 * tmp367 + tmp368 * tmp368) / (tmp291 * tmp291) + 1.0f) + 1.0f);
                    tmp371 = float3(tmp370, tmp370, tmp370);
                    phi_in341 = tmp369;
                    phi_in343 = tmp371;
                }
            }
            phi_out342 = phi_in341;
            phi_out344 = phi_in343;
            phi_in331 = phi_out342;
            phi_in333 = phi_out344;
            phi_in335 = 0.0f;
            if (tmp324) {
                tmp372 = min(max(sqrt(tmp321 * tmp320), 0.0f), 1.0f) * 0.984375f + 0.0078125f;
                tmp373 = tex_lookup_float3_3d(1, float3(min(max(acos(min(max(tmp340, 0.0f), 1.0f)) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp372, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                tmp374 = tmp373 * phi_out342;
                phi_in331 = tmp374;
                phi_in333 = phi_out344;
                phi_in335 = 0.0f;
                if (!(tmp26 < 0.0f)) {
                    tmp375 = (1.0f - tmp373) * tmp292 * (1.0f - tex_lookup_float3_3d(1, float3(min(max(acos(tmp310) * 0.6366197467f, 0.0f), 1.0f) * 0.9692307711f + 0.007692307699f, tmp372, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x) / tex_lookup_float3_3d(1, float3(1.0f, tmp372, 0.0f), 0, 0, 0, float2(0.0f, 1.0f), float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x;
                    tmp376 = 0.3183098733f - tmp373 * 0.3183098733f + tmp374;
                    sret_ptr.pdf = tmp376;
                    phi_in331 = tmp376;
                    phi_in333 = phi_out344;
                    phi_in335 = tmp375;
                }
            }
        }
        phi_out332 = phi_in331;
        phi_out334 = phi_in333;
        phi_out336 = phi_in335;
        tmp377 = min(max(tmp319.x, 0.0f), 1.0f) * tmp313 * phi_out336 + sret_ptr.bsdf_diffuse.x;
        sret_ptr.bsdf_diffuse.x = tmp377;
        tmp378 = sret_ptr.bsdf_diffuse.y + min(max(tmp319.y, 0.0f), 1.0f) * tmp314 * phi_out336;
        sret_ptr.bsdf_diffuse.y = tmp378;
        tmp379 = sret_ptr.bsdf_diffuse.z + min(max(tmp319.z, 0.0f), 1.0f) * tmp315 * phi_out336;
        sret_ptr.bsdf_diffuse.z = tmp379;
        sret_ptr.bsdf_glossy.x = sret_ptr.bsdf_glossy.x + min(max(tmp316, 0.0f), 1.0f) * tmp313 * phi_out334.x;
        sret_ptr.bsdf_glossy.y = sret_ptr.bsdf_glossy.y + min(max(tmp317, 0.0f), 1.0f) * tmp314 * phi_out334.y;
        sret_ptr.bsdf_glossy.z = sret_ptr.bsdf_glossy.z + min(max(tmp318, 0.0f), 1.0f) * tmp315 * phi_out334.z;
        float tmp380 = 1.0f - max(tmp309, tmp311) * tmp282;
        tmp381 = tmp380 * tmp277;
        tmp382 = tmp380 * tmp278;
        tmp383 = tmp380 * tmp279;
        tmp384 = min(max(state.text_results[19].y, 0.0f), 1.0f);
        tmp385 = min(max(state.text_results[19].z, 0.0f), 1.0f);
        tmp386 = min(max(state.text_results[19].w, 0.0f), 1.0f);
        tmp387 = max(state.text_results[15].z, 0.0f);
        phi_in388 = 0.0f;
        if (tmp26 > 0.0f) {
            float3 tmp390 = tmp286 * tmp24;
            float tmp391 = max(tmp291, 0.0f);
            tmp392 = tmp391 / (max(tmp390.x + tmp390.y + tmp390.z, 0.0f) * 1.570796371f + 1.570796371f);
            phi_in393 = 0.0f;
            phi_in395 = 0.0f;
            phi_in397 = 0.0f;
            if (tmp391 > 0.0f) {
                tmp399 = tmp384 * tmp392;
                tmp400 = tmp385 * tmp392;
                tmp401 = tmp386 * tmp392;
                phi_in393 = tmp399;
                phi_in395 = tmp400;
                phi_in397 = tmp401;
                if (tmp387 > 0.0f) {
                    tmp402 = tmp387 * tmp387;
                    tmp403 = float3(tmp17 - tmp291 * tmp283, tmp18 - tmp291 * tmp284, tmp19 - tmp291 * tmp285);
                    float3 tmp404 = tmp403 * tmp403;
                    tmp405 = float3(tmp4 - tmp288 * tmp283, tmp5 - tmp288 * tmp284, tmp6 - tmp288 * tmp285);
                    float3 tmp406 = tmp405 * tmp405;
                    tmp407 = (tmp404.x + tmp404.y + tmp404.z) * (tmp406.x + tmp406.y + tmp406.z);
                    phi_in408 = 0.0f;
                    if (!(tmp407 == 0.0f)) {
                        float3 tmp410 = tmp403 * tmp405;
                        tmp411 = max(sqrt((1.0f - tmp291 * tmp291) * (1.0f - tmp288 * tmp288) / tmp407) * (tmp410.x + tmp410.y + tmp410.z) / max(tmp291, tmp288), 0.0f) * 0.4499999881f * tmp402 / (tmp402 + 0.09000000358f);
                        phi_in408 = tmp411;
                    }
                    phi_out409 = phi_in408;
                    float tmp412 = phi_out409 + (1.0f - tmp402 / (tmp402 * 2.0f + 0.6600000262f));
                    tmp413 = tmp412 * tmp399;
                    tmp414 = tmp412 * tmp400;
                    tmp415 = tmp412 * tmp401;
                    phi_in393 = tmp413;
                    phi_in395 = tmp414;
                    phi_in397 = tmp415;
                }
            }
            phi_out394 = phi_in393;
            phi_out396 = phi_in395;
            phi_out398 = phi_in397;
            sret_ptr.bsdf_diffuse.x = tmp381 * phi_out394 + tmp377;
            sret_ptr.bsdf_diffuse.y = tmp382 * phi_out396 + tmp378;
            sret_ptr.bsdf_diffuse.z = tmp383 * phi_out398 + tmp379;
            phi_in388 = tmp392;
        }
        phi_out389 = phi_in388;
        tmp416 = (tmp309 * tmp282 * (phi_out332 - phi_out389) + phi_out389) * tmp276 + phi_out121;
        phi_in274 = tmp416;
    }
    phi_out275 = phi_in274;
    sret_ptr.pdf = tmp46 * tmp2 * (phi_out63 - phi_out275) + phi_out275;
    return;
}

void mdl_surface_scattering_pdf(inout Bsdf_pdf_data sret_ptr, in Shading_state_material state)
{
    gen_custom_curve_layer_pdf(sret_ptr, state);
    return;
}

void mdl_surface_scattering_auxiliary(inout Bsdf_auxiliary_data sret_ptr, in Shading_state_material state)
{
    float3 tmp4;
    float tmp6;
    float tmp7;
    float tmp8;
    float tmp9;
    float tmp14;
    float3 tmp16;
    float3 tmp17;
    float tmp21;
    float tmp22;
    float tmp23;
    float tmp24;
    float tmp25;
    float tmp26;
    float tmp27;
    float tmp28;
    float tmp29;
    float tmp30;
    float tmp31;
    float tmp32;
    float tmp33;
    float tmp34;
    float tmp35;
    float tmp36;
    float3 tmp37;
    float tmp39;
    float tmp42;
    float phi_in;
    float phi_out;
    float tmp43;
    float phi_in44;
    float phi_out45;
    float phi_in46;
    float phi_out47;
    float phi_in48;
    float phi_out49;
    float tmp50;
    float tmp51;
    float tmp93;
    float tmp94;
    float tmp95;
    float tmp98;
    float tmp101;
    float tmp102;
    float tmp103;
    float tmp105;
    float tmp106;
    float tmp107;
    float tmp108;
    bool tmp109;
    float tmp112;
    float tmp113;
    float tmp114;
    float tmp115;
    float tmp116;
    float tmp117;
    float phi_in118;
    float phi_out119;
    float phi_in120;
    float phi_out121;
    float phi_in122;
    float phi_out123;
    float tmp125;
    float tmp126;
    float tmp127;
    float tmp129;
    sret_ptr.albedo_diffuse = float3(0.0f, 0.0f, 0.0f);
    sret_ptr.albedo_glossy = float3(0.0f, 0.0f, 0.0f);
    sret_ptr.normal = float3(0.0f, 0.0f, 0.0f);
    sret_ptr.roughness = float3(0.0f, 0.0f, 0.0f);
    float tmp0 = min(max(state.text_results[16].z, 0.0f), 1.0f);
    float tmp1 = sret_ptr.k1.x;
    float tmp2 = sret_ptr.k1.y;
    float tmp3 = sret_ptr.k1.z;
    tmp4 = float3(tmp1, tmp2, tmp3);
    float3 tmp5 = tmp4 * state.geom_normal;
    tmp6 = asfloat((asint(tmp5.x + tmp5.y + tmp5.z) & -2147483648) | 1065353216);
    tmp7 = state.text_results[20].w * tmp6;
    tmp8 = state.text_results[21].x * tmp6;
    tmp9 = state.text_results[21].y * tmp6;
    float3 tmp10 = float3(tmp7, tmp8, tmp9);
    float3 tmp11 = tmp10 * tmp4;
    float tmp12 = 1.0f - min(max(min(max(tmp11.x + tmp11.y + tmp11.z, 0.0f), 1.0f), 0.0f), 1.0f);
    float tmp13 = tmp12 * tmp12;
    tmp14 = (tmp13 * tmp13 * (tmp12 * (min(max(1.0f - state.text_results[12].x, 0.0f), 1.0f) - tmp0)) + tmp0) * min(max(state.text_results[12].y, 0.0f), 1.0f);
    float3 tmp15 = state.tangent_u[0];
    tmp16 = tmp15.yzx;
    tmp17 = tmp15.zxy;
    float3 tmp18 = tmp10.zxy * tmp16 - tmp10.yzx * tmp17;
    float3 tmp19 = tmp18 * tmp18;
    if (!(tmp19.x + tmp19.y + tmp19.z < 9.999999939e-09f)) {
        sret_ptr.albedo_glossy.x = tmp14;
        sret_ptr.albedo_glossy.y = tmp14;
        sret_ptr.albedo_glossy.z = tmp14;
        sret_ptr.normal.x = tmp14 * tmp7;
        sret_ptr.normal.y = tmp14 * tmp8;
        sret_ptr.normal.z = tmp14 * tmp9;
        sret_ptr.roughness.x = state.text_results[16].x * tmp14;
        sret_ptr.roughness.y = state.text_results[16].y * tmp14;
        sret_ptr.roughness.z = tmp14;
    }
    float tmp20 = 1.0f - tmp14;
    tmp21 = min(max(state.text_results[13].z, 0.0f), 1.0f) * tmp20;
    tmp22 = min(max(state.text_results[13].w, 0.0f), 1.0f) * tmp20;
    tmp23 = min(max(state.text_results[14].x, 0.0f), 1.0f) * tmp20;
    tmp24 = min(max(state.text_results[15].y, 0.0f), 1.0f);
    tmp25 = tmp24 * tmp21;
    tmp26 = tmp24 * tmp22;
    tmp27 = tmp24 * tmp23;
    tmp28 = state.text_results[23].x;
    tmp29 = state.text_results[23].y;
    tmp30 = state.text_results[23].z;
    tmp31 = state.text_results[22].y;
    tmp32 = state.text_results[22].z;
    tmp33 = state.text_results[22].w;
    tmp34 = state.text_results[20].x * tmp6;
    tmp35 = state.text_results[20].y * tmp6;
    tmp36 = state.text_results[20].z * tmp6;
    tmp37 = float3(tmp34, tmp35, tmp36);
    float3 tmp38 = tmp37 * tmp4;
    tmp39 = tmp38.x + tmp38.y + tmp38.z;
    if (tmp39 < 0.0f) {
        float3 tmp40 = tmp37.zxy * tmp16 - tmp37.yzx * tmp17;
        float3 tmp41 = tmp40 * tmp40;
        tmp42 = tmp41.x + tmp41.y + tmp41.z;
        phi_in = tmp42;
    } else {
        tmp43 = sret_ptr.ior1.x;
        if (tmp43 == -1.0f) {
            sret_ptr.ior1.x = 1.0f;
            sret_ptr.ior1.y = 1.0f;
            sret_ptr.ior1.z = 1.0f;
            phi_in44 = 1.0f;
            phi_in46 = 1.0f;
            phi_in48 = 1.0f;
        } else {
            tmp50 = sret_ptr.ior1.y;
            tmp51 = sret_ptr.ior1.z;
            phi_in44 = tmp51;
            phi_in46 = tmp50;
            phi_in48 = tmp43;
        }
        phi_out45 = phi_in44;
        phi_out47 = phi_in46;
        phi_out49 = phi_in48;
        float tmp52 = 1.0f / phi_out49;
        float tmp53 = 1.0f / phi_out47;
        float tmp54 = 1.0f / phi_out45;
        float tmp55 = tmp52 * tmp31;
        float tmp56 = tmp53 * tmp32;
        float tmp57 = tmp54 * tmp33;
        float tmp58 = tmp52 * tmp28;
        float tmp59 = tmp53 * tmp29;
        float tmp60 = tmp54 * tmp30;
        float tmp61 = tmp39 * tmp39;
        float tmp62 = 1.0f - tmp61;
        float tmp63 = -tmp62;
        float tmp64 = tmp55 * tmp55;
        float tmp65 = tmp58 * tmp58;
        float tmp66 = tmp63 - tmp65 + tmp64;
        float tmp67 = sqrt(tmp66 * tmp66 + tmp64 * 4.0f * tmp65);
        float tmp68 = tmp67 + tmp61;
        float tmp69 = tmp39 * 2.0f;
        float tmp70 = sqrt(max((tmp67 + tmp66) * 0.5f, 0.0f)) * tmp69;
        float tmp71 = (tmp68 - tmp70) / (tmp70 + tmp68);
        float tmp72 = tmp62 * tmp62;
        float tmp73 = tmp67 * tmp61 + tmp72;
        float tmp74 = tmp70 * tmp62;
        float tmp75 = tmp56 * tmp56;
        float tmp76 = tmp59 * tmp59;
        float tmp77 = tmp63 - tmp76 + tmp75;
        float tmp78 = sqrt(tmp77 * tmp77 + tmp75 * 4.0f * tmp76);
        float tmp79 = tmp78 + tmp61;
        float tmp80 = sqrt(max((tmp78 + tmp77) * 0.5f, 0.0f)) * tmp69;
        float tmp81 = (tmp79 - tmp80) / (tmp80 + tmp79);
        float tmp82 = tmp78 * tmp61 + tmp72;
        float tmp83 = tmp80 * tmp62;
        float tmp84 = tmp57 * tmp57;
        float tmp85 = tmp60 * tmp60;
        float tmp86 = tmp63 - tmp85 + tmp84;
        float tmp87 = sqrt(tmp86 * tmp86 + tmp84 * 4.0f * tmp85);
        float tmp88 = tmp87 + tmp61;
        float tmp89 = sqrt(max((tmp87 + tmp86) * 0.5f, 0.0f)) * tmp69;
        float tmp90 = (tmp88 - tmp89) / (tmp89 + tmp88);
        float tmp91 = tmp87 * tmp61 + tmp72;
        float tmp92 = tmp89 * tmp62;
        tmp93 = tmp25 * min(max((tmp71 * (tmp73 - tmp74) / (tmp74 + tmp73) + tmp71) * 0.5f, 0.0f), 1.0f);
        tmp94 = tmp26 * min(max((tmp81 * (tmp82 - tmp83) / (tmp83 + tmp82) + tmp81) * 0.5f, 0.0f), 1.0f);
        tmp95 = tmp27 * min(max((tmp90 * (tmp91 - tmp92) / (tmp92 + tmp91) + tmp90) * 0.5f, 0.0f), 1.0f);
        float3 tmp96 = tmp37.zxy * tmp16 - tmp37.yzx * tmp17;
        float3 tmp97 = tmp96 * tmp96;
        tmp98 = tmp97.x + tmp97.y + tmp97.z;
        phi_in = tmp98;
        if (!(tmp98 < 9.999999939e-09f)) {
            float tmp99 = tmp94 * 0.7151600122f + tmp95 * 0.07216899842f + tmp93 * 0.2126709968f;
            sret_ptr.albedo_glossy.x = sret_ptr.albedo_glossy.x + tmp93;
            sret_ptr.albedo_glossy.y = sret_ptr.albedo_glossy.y + tmp94;
            sret_ptr.albedo_glossy.z = sret_ptr.albedo_glossy.z + tmp95;
            sret_ptr.normal.x = sret_ptr.normal.x + tmp99 * tmp34;
            sret_ptr.normal.y = sret_ptr.normal.y + tmp99 * tmp35;
            sret_ptr.normal.z = sret_ptr.normal.z + tmp99 * tmp36;
            sret_ptr.roughness.x = sret_ptr.roughness.x + state.text_results[13].x * tmp99;
            sret_ptr.roughness.y = sret_ptr.roughness.y + state.text_results[13].y * tmp99;
            sret_ptr.roughness.z = sret_ptr.roughness.z + tmp99;
            phi_in = tmp98;
        }
    }
    phi_out = phi_in;
    float tmp100 = 1.0f - tmp24;
    tmp101 = tmp100 * tmp21;
    tmp102 = tmp100 * tmp22;
    tmp103 = tmp100 * tmp23;
    float tmp104 = min(max(state.text_results[16].w, 0.0f), 1.0f);
    tmp105 = ((min(max(1.0f - state.text_results[12].z, 0.0f), 1.0f) - tmp104) * pow(1.0f - min(max(min(max(tmp39, 0.0f), 1.0f), 0.0f), 1.0f), 4.0f) + tmp104) * min(max(state.text_results[15].x, 0.0f), 1.0f);
    tmp106 = tmp105 * tmp101;
    tmp107 = tmp105 * tmp102;
    tmp108 = tmp105 * tmp103;
    tmp109 = phi_out < 9.999999939e-09f;
    if (!tmp109) {
        float tmp110 = tmp107 * 0.7151600122f + tmp106 * 0.2126709968f + tmp108 * 0.07216899842f;
        sret_ptr.albedo_glossy.x = min(max(state.text_results[21].z, 0.0f), 1.0f) * tmp106 + sret_ptr.albedo_glossy.x;
        sret_ptr.albedo_glossy.y = sret_ptr.albedo_glossy.y + min(max(state.text_results[21].w, 0.0f), 1.0f) * tmp107;
        sret_ptr.albedo_glossy.z = sret_ptr.albedo_glossy.z + min(max(state.text_results[22].x, 0.0f), 1.0f) * tmp108;
        sret_ptr.normal.x = sret_ptr.normal.x + tmp110 * tmp34;
        sret_ptr.normal.y = sret_ptr.normal.y + tmp110 * tmp35;
        sret_ptr.normal.z = sret_ptr.normal.z + tmp110 * tmp36;
        sret_ptr.roughness.x = sret_ptr.roughness.x + state.text_results[13].x * tmp110;
        sret_ptr.roughness.y = sret_ptr.roughness.y + state.text_results[13].y * tmp110;
        sret_ptr.roughness.z = sret_ptr.roughness.z + tmp110;
    }
    float tmp111 = 1.0f - tmp105;
    tmp112 = tmp111 * tmp101;
    tmp113 = tmp111 * tmp102;
    tmp114 = tmp111 * tmp103;
    if (tmp109) {
        tmp115 = sret_ptr.normal.x;
        tmp116 = sret_ptr.normal.y;
        tmp117 = sret_ptr.normal.z;
        phi_in118 = tmp117;
        phi_in120 = tmp116;
        phi_in122 = tmp115;
    } else {
        float tmp124 = tmp113 * 0.7151600122f + tmp112 * 0.2126709968f + tmp114 * 0.07216899842f;
        sret_ptr.albedo_diffuse.x = min(max(state.text_results[19].y, 0.0f), 1.0f) * tmp112;
        sret_ptr.albedo_diffuse.y = min(max(state.text_results[19].z, 0.0f), 1.0f) * tmp113;
        sret_ptr.albedo_diffuse.z = min(max(state.text_results[19].w, 0.0f), 1.0f) * tmp114;
        tmp125 = sret_ptr.normal.x + tmp124 * tmp34;
        sret_ptr.normal.x = tmp125;
        tmp126 = sret_ptr.normal.y + tmp124 * tmp35;
        sret_ptr.normal.y = tmp126;
        tmp127 = sret_ptr.normal.z + tmp124 * tmp36;
        sret_ptr.normal.z = tmp127;
        sret_ptr.roughness.z = sret_ptr.roughness.z + tmp124;
        phi_in118 = tmp127;
        phi_in120 = tmp126;
        phi_in122 = tmp125;
    }
    phi_out119 = phi_in118;
    phi_out121 = phi_in120;
    phi_out123 = phi_in122;
    if (phi_out123 != 0.0f || (phi_out121 != 0.0f || phi_out119 != 0.0f)) {
        float3 tmp128 = float3(sqrt(phi_out121 * phi_out121 + phi_out123 * phi_out123 + phi_out119 * phi_out119), 0.0f, 0.0f);
        sret_ptr.normal = float3(phi_out123, phi_out121, phi_out119) / tmp128.xxx;
    }
    tmp129 = sret_ptr.roughness.z;
    if (!(tmp129 == 0.0f)) {
        sret_ptr.roughness.x = sret_ptr.roughness.x / tmp129;
        sret_ptr.roughness.y = sret_ptr.roughness.y / tmp129;
    }
    return;
}

void mdl_surface_emission_sample(inout Edf_sample_data sret_ptr, in Shading_state_material state)
{
    float3 tmp0;
    float tmp1;
    float tmp2;
    float tmp3;
    float3 tmp4;
    float tmp5;
    float tmp6;
    float3 phi_in;
    float3 phi_out;
    float tmp9;
    float tmp10;
    float tmp11;
    float tmp12;
    float tmp13;
    float phi_in14;
    float phi_out15;
    float phi_in16;
    float phi_out17;
    float phi_in18;
    float phi_out19;
    float tmp20;
    float tmp21;
    float3 tmp22;
    float tmp23;
    float3 tmp25;
    float3 tmp26;
    float tmp29;
    bool tmp30;
    float phi_in31;
    float phi_out32;
    float phi_in33;
    float phi_out34;
    float phi_in35;
    float phi_out36;
    float phi_in37;
    float phi_out38;
    float phi_in39;
    float phi_out40;
    float phi_in41;
    float phi_out42;
    float tmp44;
    float tmp45;
    float tmp46;
    float phi_in49;
    float phi_out50;
    float phi_in51;
    float phi_out52;
    float phi_in53;
    float phi_out54;
    float phi_in55;
    float phi_out56;
    float3 tmp63;
    int phi_in64;
    int phi_out65;
    float phi_in66;
    float phi_out67;
    float phi_in68;
    float phi_out69;
    float phi_in70;
    float phi_out71;
    float phi_in72;
    float phi_out73;
    float tmp76;
    float phi_in77;
    float phi_out78;
    float phi_in79;
    float phi_out80;
    float phi_in81;
    float phi_out82;
    tmp0 = state.normal;
    tmp1 = 1.0f - max(1.0f - state.text_results[12].x, 0.0f);
    tmp2 = state.text_results[12].y;
    tmp3 = 1.0f - state.text_results[16].z;
    tmp4 = state.geom_normal;
    tmp5 = sret_ptr.xi.x;
    tmp6 = sret_ptr.xi.y;
    phi_in = float3(0.0f, 1.0f, 0.0f);
    if (!(tmp5 == 0.0f && tmp6 == 0.0f)) {
        float tmp7 = tmp5 * 2.0f;
        float tmp8 = tmp6 * 2.0f;
        tmp9 = tmp7 < 1.0f ? tmp7 : tmp7 + -2.0f;
        tmp10 = tmp8 < 1.0f ? tmp8 : tmp8 + -2.0f;
        tmp11 = tmp9 * tmp9;
        tmp12 = tmp10 * tmp10;
        if (tmp11 > tmp12) {
            tmp13 = tmp10 * -0.7853981853f / tmp9;
            phi_in14 = tmp9;
            phi_in16 = tmp13;
            phi_in18 = tmp11;
        } else {
            tmp20 = tmp9 * 0.7853981853f / tmp10 + -1.570796371f;
            phi_in14 = tmp10;
            phi_in16 = tmp20;
            phi_in18 = tmp12;
        }
        phi_out15 = phi_in14;
        phi_out17 = phi_in16;
        phi_out19 = phi_in18;
        tmp21 = 1.0f - phi_out19;
        phi_in = float3(0.0f, 1.0f, 0.0f);
        if (tmp21 > 0.0f) {
            tmp22 = float3(sin(phi_out17) * phi_out15, sqrt(tmp21), cos(phi_out17) * phi_out15);
            phi_in = tmp22;
        }
    }
    phi_out = phi_in;
    tmp23 = phi_out.y;
    float3 tmp24 = state.tangent_u[0];
    tmp25 = tmp0.zxy;
    tmp26 = tmp0.yzx;
    float3 tmp27 = tmp24.yzx * tmp25 - tmp24.zxy * tmp26;
    float3 tmp28 = tmp27 * tmp27;
    tmp29 = tmp28.x + tmp28.y + tmp28.z;
    tmp30 = tmp29 < 9.999999939e-09f;
    phi_in31 = tmp27.x;
    phi_in33 = tmp27.y;
    phi_in35 = tmp27.z;
    phi_in37 = 0.0f;
    phi_in39 = 0.0f;
    phi_in41 = 0.0f;
    if (!tmp30) {
        float tmp43 = 1.0f / sqrt(tmp29);
        tmp44 = tmp43 * tmp27.x;
        tmp45 = tmp43 * tmp27.y;
        tmp46 = tmp43 * tmp27.z;
        float3 tmp47 = float3(tmp44, tmp45, tmp46);
        float3 tmp48 = tmp47.zxy * tmp26 - tmp47.yzx * tmp25;
        phi_in31 = tmp44;
        phi_in33 = tmp45;
        phi_in35 = tmp46;
        phi_in37 = tmp48.x;
        phi_in39 = tmp48.y;
        phi_in41 = tmp48.z;
    }
    phi_out32 = phi_in31;
    phi_out34 = phi_in33;
    phi_out36 = phi_in35;
    phi_out38 = phi_in37;
    phi_out40 = phi_in39;
    phi_out42 = phi_in41;
    if (tmp30) {
        sret_ptr.k1 = float3(0.0f, 0.0f, 0.0f);
        sret_ptr.pdf = 0.0f;
        sret_ptr.edf_over_pdf = float3(0.0f, 0.0f, 0.0f);
        sret_ptr.event_type = Edf_event_type(0);
        phi_in49 = 0.0f;
        phi_in51 = 0.0f;
        phi_in53 = 0.0f;
        phi_in55 = 0.0f;
    } else {
        float tmp57 = phi_out.z;
        float tmp58 = phi_out.x;
        float tmp59 = phi_out32 * tmp57 + tmp23 * tmp0.x + phi_out38 * tmp58;
        float tmp60 = phi_out34 * tmp57 + tmp23 * tmp0.y + phi_out40 * tmp58;
        float tmp61 = phi_out36 * tmp57 + tmp23 * tmp0.z + phi_out42 * tmp58;
        float3 tmp62 = float3(sqrt(tmp60 * tmp60 + tmp59 * tmp59 + tmp61 * tmp61), 0.0f, 0.0f);
        tmp63 = float3(tmp59, tmp60, tmp61) / tmp62.xxx;
        sret_ptr.k1.x = tmp63.x;
        sret_ptr.k1.y = tmp63.y;
        sret_ptr.k1.z = tmp63.z;
        phi_in64 = 0;
        phi_in66 = 0.0f;
        phi_in68 = 0.0f;
        phi_in70 = 0.0f;
        phi_in72 = 0.0f;
        if (tmp23 > 0.0f) {
            float3 tmp74 = tmp63 * tmp4;
            phi_in64 = 0;
            phi_in66 = 0.0f;
            phi_in68 = 0.0f;
            phi_in70 = 0.0f;
            phi_in72 = 0.0f;
            if (tmp74.x + tmp74.y + tmp74.z > 0.0f) {
                sret_ptr.event_type = Edf_event_type(1);
                sret_ptr.handle = 0;
                phi_in64 = 1;
                phi_in66 = 1.0f;
                phi_in68 = tmp63.z;
                phi_in70 = tmp63.y;
                phi_in72 = tmp63.x;
            }
        }
        phi_out65 = phi_in64;
        phi_out67 = phi_in66;
        phi_out69 = phi_in68;
        phi_out71 = phi_in70;
        phi_out73 = phi_in72;
        phi_in49 = phi_out67;
        phi_in51 = phi_out69;
        phi_in53 = phi_out71;
        phi_in55 = phi_out73;
        if (phi_out65 == 0) {
            sret_ptr.k1 = float3(0.0f, 0.0f, 0.0f);
            sret_ptr.pdf = 0.0f;
            sret_ptr.edf_over_pdf = float3(0.0f, 0.0f, 0.0f);
            sret_ptr.event_type = Edf_event_type(0);
            phi_in49 = 0.0f;
            phi_in51 = 0.0f;
            phi_in53 = 0.0f;
            phi_in55 = 0.0f;
        }
    }
    phi_out50 = phi_in49;
    phi_out52 = phi_in51;
    phi_out54 = phi_in53;
    phi_out56 = phi_in55;
    float3 tmp75 = float3(phi_out56, phi_out54, phi_out52) * tmp0;
    tmp76 = tmp75.x + tmp75.y + tmp75.z;
    if (tmp76 < 0.0f) {
        sret_ptr.k1 = float3(0.0f, 0.0f, 0.0f);
        sret_ptr.pdf = 0.0f;
        sret_ptr.edf_over_pdf = float3(0.0f, 0.0f, 0.0f);
        sret_ptr.event_type = Edf_event_type(0);
        phi_in77 = 0.0f;
        phi_in79 = 0.0f;
        phi_in81 = 0.0f;
    } else {
        float tmp83 = 1.0f - tmp2;
        float tmp84 = min(max(tmp3 * tmp2 + tmp83, 0.0f), 1.0f);
        float tmp85 = (pow(1.0f - min(max(tmp76, 0.0f), 1.0f), 4.0f) * (min(max(tmp1 * tmp2 + tmp83, 0.0f), 1.0f) - tmp84) + tmp84) * phi_out50;
        sret_ptr.edf_over_pdf.x = tmp85;
        sret_ptr.edf_over_pdf.y = tmp85;
        sret_ptr.edf_over_pdf.z = tmp85;
        phi_in77 = phi_out52;
        phi_in79 = phi_out54;
        phi_in81 = phi_out56;
    }
    phi_out78 = phi_in77;
    phi_out80 = phi_in79;
    phi_out82 = phi_in81;
    float3 tmp86 = float3(phi_out82, phi_out80, phi_out78);
    float3 tmp87 = tmp86 * tmp4;
    float tmp88 = asfloat((asint(tmp87.x + tmp87.y + tmp87.z) & -2147483648) | 1065353216);
    float3 tmp89 = float3(tmp0.x * tmp88, tmp0.y * tmp88, tmp0.z * tmp88) * tmp86;
    sret_ptr.pdf = max(tmp89.x + tmp89.y + tmp89.z, 0.0f) * 0.3183098733f;
    return;
}

void mdl_surface_emission_evaluate(inout Edf_evaluate_data sret_ptr, in Shading_state_material state)
{
    float tmp1;
    float3 tmp2;
    float tmp4;
    float3 phi_in;
    float3 phi_out;
    float3 tmp8;
    float tmp9;
    float tmp10;
    float tmp11;
    float phi_in12;
    float phi_out13;
    float tmp18;
    float3 tmp0 = state.normal;
    sret_ptr.edf.x = 0.0f;
    sret_ptr.edf.y = 0.0f;
    sret_ptr.edf.z = 0.0f;
    tmp1 = state.text_results[12].y;
    tmp2 = sret_ptr.k1;
    float3 tmp3 = tmp2 * tmp0;
    tmp4 = tmp3.x + tmp3.y + tmp3.z;
    phi_in = float3(0.0f, 0.0f, 0.0f);
    if (!(tmp4 < 0.0f)) {
        float tmp5 = 1.0f - tmp1;
        float tmp6 = min(max((1.0f - state.text_results[16].z) * tmp1 + tmp5, 0.0f), 1.0f);
        float tmp7 = (min(max((1.0f - max(1.0f - state.text_results[12].x, 0.0f)) * tmp1 + tmp5, 0.0f), 1.0f) - tmp6) * pow(1.0f - min(max(tmp4, 0.0f), 1.0f), 4.0f) + tmp6;
        tmp8 = float3(tmp7, tmp7, tmp7);
        phi_in = tmp8;
    }
    phi_out = phi_in;
    tmp9 = phi_out.x;
    tmp10 = phi_out.y;
    tmp11 = phi_out.z;
    phi_in12 = 0.0f;
    if (!(tmp11 == 0.0f && (tmp9 == 0.0f && tmp10 == 0.0f))) {
        float3 tmp14 = state.geom_normal * tmp2;
        float tmp15 = asfloat((asint(tmp14.x + tmp14.y + tmp14.z) & -2147483648) | 1065353216);
        float3 tmp16 = float3(tmp0.x * tmp15, tmp0.y * tmp15, tmp0.z * tmp15) * tmp2;
        float tmp17 = max(tmp16.x + tmp16.y + tmp16.z, 0.0f);
        sret_ptr.cos = tmp17;
        tmp18 = tmp17 * 0.3183098733f;
        sret_ptr.edf.x = tmp9 * 0.3183098733f;
        sret_ptr.edf.y = tmp10 * 0.3183098733f;
        sret_ptr.edf.z = tmp11 * 0.3183098733f;
        phi_in12 = tmp18;
    }
    phi_out13 = phi_in12;
    sret_ptr.pdf = phi_out13;
    return;
}

void mdl_surface_emission_pdf(inout Edf_pdf_data sret_ptr, in Shading_state_material state)
{
    float3 tmp0 = state.normal;
    float3 tmp1 = sret_ptr.k1;
    float3 tmp2 = tmp1 * state.geom_normal;
    float tmp3 = asfloat((asint(tmp2.x + tmp2.y + tmp2.z) & -2147483648) | 1065353216);
    float3 tmp4 = float3(tmp0.x * tmp3, tmp0.y * tmp3, tmp0.z * tmp3) * tmp1;
    sret_ptr.pdf = max(tmp4.x + tmp4.y + tmp4.z, 0.0f) * 0.3183098733f;
    return;
}

void mdl_surface_emission_auxiliary(in Edf_auxiliary_data sret_ptr, in Shading_state_material state)
{
    return;
}

float3 mdl_surface_emission_intensity(in Shading_state_material state)
{
    return state.text_results[14].yzw;
}

float mdl_standalone_geometry_cutout_opacity(in Shading_state_material state)
{
    int tmp0;
    float tmp1;
    int tmp2;
    structtype0 tmp16;
    float3 newret;
    int tmp17;
    float newret2;
    float phi_in;
    float phi_out;
    float tmp18;
    float tmp19;
    tmp0 = state.arg_block_offset;
    tmp1 = mdl_read_argblock_as_float(tmp0 + 516);
    tmp2 = mdl_read_argblock_as_int(tmp0 + 520);
    int tmp3 = mdl_read_argblock_as_int(tmp0 + 56);
    int tmp4 = mdl_read_argblock_as_int(tmp0 + 60);
    Derived_float tmp5 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 64), 0.0f, 0.0f);
    Derived_float tmp6 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 68), 0.0f, 0.0f);
    Derived_float tmp7 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 72), 0.0f, 0.0f);
    Derived_float tmp8 = constr_Derived_float(mdl_read_argblock_as_float(tmp0 + 76), 0.0f, 0.0f);
    bool tmp9 = mdl_read_argblock_as_bool(tmp0 + 80);
    bool tmp10 = mdl_read_argblock_as_bool(tmp0 + 81);
    bool tmp11 = mdl_read_argblock_as_bool(tmp0 + 82);
    int tmp12 = mdl_read_argblock_as_int(tmp0 + 84);
    Derived_float3 tmp13 = constr_Derived_float3(float3(mdl_read_argblock_as_float(tmp0 + 96), mdl_read_argblock_as_float(tmp0 + 100), mdl_read_argblock_as_float(tmp0 + 104)), float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f));
    Derived_float3 tmp14 = constr_Derived_float3(float3(mdl_read_argblock_as_float(tmp0 + 112), mdl_read_argblock_as_float(tmp0 + 116), mdl_read_argblock_as_float(tmp0 + 120)), float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f));
    Derived_float3 tmp15 = constr_Derived_float3(float3(mdl_read_argblock_as_float(tmp0 + 128), mdl_read_argblock_as_float(tmp0 + 132), mdl_read_argblock_as_float(tmp0 + 136)), float3(0.0f, 0.0f, 0.0f), float3(0.0f, 0.0f, 0.0f));
    tmp16 = _ZN11OmniSurface9OmniImage16texture_lookup_2EU7uniformu10texture_2dU7uniformbu5colorU7uniformbu6float2U7uniformN11OmniSurface9OmniImage9wrap_modeEU7uniformN11OmniSurface9OmniImage9wrap_modeEN4base23texture_coordinate_infoE(tmp2, mdl_read_argblock_as_bool(tmp0 + 12), float3(mdl_read_argblock_as_float(tmp0 + 16), mdl_read_argblock_as_float(tmp0 + 20), mdl_read_argblock_as_float(tmp0 + 24)), mdl_read_argblock_as_bool(tmp0 + 32), constr_Derived_float2(float2(mdl_read_argblock_as_float(tmp0 + 40), mdl_read_argblock_as_float(tmp0 + 44)), float2(0.0f, 0.0f), float2(0.0f, 0.0f)), mdl_read_argblock_as_int(tmp0 + 48), mdl_read_argblock_as_int(tmp0 + 52), _ZN11OmniSurface9OmniImage28compute_texture_coordinate_2EU7uniformN4base25texture_coordinate_systemEU7uniformiU7uniformfU7uniformfU7uniformfU7uniformfU7uniformbU7uniformbU7uniformbU7uniformN11OmniSurface9OmniImage15projection_modeEU7uniformu6float3U7uniformu6float3U7uniformu6float3(state, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmp10, tmp11, tmp12, tmp13, tmp14, tmp15));
    newret = tmp16.m_0;
    tmp17 = mdl_read_argblock_as_int(tmp0 + 524);
    if (tmp17 == 0) {
        newret2 = tmp16.m_1;
        phi_in = newret2;
    } else if (tmp17 == 1)
        phi_in = newret.x;
    else if (tmp17 == 2)
        phi_in = newret.y;
    else if (tmp17 == 3)
        phi_in = newret.z;
    else if (tmp17 == 4)
        phi_in = 1.0f;
    else if (tmp17 == 7) {
        tmp18 = (newret.x + newret.y + newret.z) * 0.3333333433f;
        phi_in = tmp18;
    } else if (tmp17 == 6) {
        tmp19 = newret.x * 0.2126709968f + newret.y * 0.7151600122f + newret.z * 0.07216899842f;
        phi_in = tmp19;
    } else
        phi_in = 0.0f;
    phi_out = phi_in;
    float tmp20 = tex_texture_isvalid(tmp2) ? phi_out : mdl_read_argblock_as_float(tmp0 + 528);
    return mdl_read_argblock_as_bool(tmp0 + 512) ? tmp1 == 0.0f ? tmp20 : tmp1 <= tmp20 ? 1.0f : 0.0f : 1.0f;
}
