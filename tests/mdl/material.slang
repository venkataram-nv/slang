import types;
import buffers;
import runtime;
import enumerations;
import shading;

// functions
void mdl_init(inout Shading_state_material state)
{
    float3 tmp0 = state.text_coords[0];
    int tmp1 = state.arg_block_offset;
    state.text_results[0].x = mdl_read_argblock_as_float(tmp1) * tex_lookup_float3_2d(1, tmp0.xy, 1, 1, float2(0.0f, 1.0f), float2(0.0f, 1.0f), 0.0f).x + mdl_read_argblock_as_float(tmp1 + 4);
    return;
}

void gen_simple_glossy_bsdf_pdf(inout Bsdf_pdf_data p_00, in Shading_state_material p_11, in float3 p_22)
{
    float tmp5;
    float tmp7;
    float tmp8;
    float tmp9;
    float3 tmp10;
    float tmp13;
    float tmp14;
    float tmp15;
    float3 tmp16;
    float3 tmp17;
    float3 tmp18;
    float3 tmp19;
    float tmp21;
    float3 tmp23;
    float3 tmp24;
    float tmp26;
    float tmp27;
    float tmp28;
    float tmp29;
    float3 tmp30;
    float3 tmp36;
    float tmp38;
    float tmp40;
    float tmp43;
    float tmp45;
    float phi_in;
    float phi_out;
    float tmp46;
    float3 tmp3 = p_11.tangent_u[0];
    float tmp4 = max(p_11.text_results[0].x, 1.000000012e-07f);
    tmp5 = 2.0f / (tmp4 * tmp4);
    float3 tmp6 = p_11.geom_normal;
    tmp7 = p_00.k1.x;
    tmp8 = p_00.k1.y;
    tmp9 = p_00.k1.z;
    tmp10 = float3(tmp7, tmp8, tmp9);
    float3 tmp11 = tmp10 * tmp6;
    float tmp12 = asfloat((asint(tmp11.x + tmp11.y + tmp11.z) & -2147483648) | 1065353216);
    tmp13 = tmp6.x * tmp12;
    tmp14 = tmp6.y * tmp12;
    tmp15 = tmp6.z * tmp12;
    tmp16 = float3(p_22.x * tmp12, p_22.y * tmp12, p_22.z * tmp12);
    tmp17 = tmp16.zxy;
    tmp18 = tmp16.yzx;
    tmp19 = tmp17 * tmp3.yzx - tmp18 * tmp3.zxy;
    float3 tmp20 = tmp19 * tmp19;
    tmp21 = tmp20.x + tmp20.y + tmp20.z;
    if (tmp21 < 9.999999939e-09f)
        p_00.pdf = 0.0f;
    else {
        float tmp22 = 1.0f / sqrt(tmp21);
        tmp23 = float3(tmp22 * tmp19.x, tmp22 * tmp19.y, tmp22 * tmp19.z);
        tmp24 = tmp23.zxy * tmp18 - tmp23.yzx * tmp17;
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
        float3 tmp25 = tmp16 * tmp10;
        tmp26 = abs(tmp25.x + tmp25.y + tmp25.z);
        tmp27 = p_00.k2.x;
        tmp28 = p_00.k2.y;
        tmp29 = p_00.k2.z;
        tmp30 = float3(tmp27, tmp28, tmp29);
        float3 tmp31 = tmp30 * float3(tmp13, tmp14, tmp15);
        if (tmp31.x + tmp31.y + tmp31.z < 0.0f)
            p_00.pdf = 0.0f;
        else {
            float tmp32 = tmp27 + tmp7;
            float tmp33 = tmp28 + tmp8;
            float tmp34 = tmp29 + tmp9;
            float3 tmp35 = float3(sqrt(tmp33 * tmp33 + tmp32 * tmp32 + tmp34 * tmp34), 0.0f, 0.0f);
            tmp36 = float3(tmp32, tmp33, tmp34) / tmp35.xxx;
            float3 tmp37 = tmp36 * tmp16;
            tmp38 = tmp37.x + tmp37.y + tmp37.z;
            float3 tmp39 = tmp36 * tmp10;
            tmp40 = tmp39.x + tmp39.y + tmp39.z;
            float3 tmp41 = tmp36 * tmp30;
            if (tmp41.x + tmp41.y + tmp41.z < 0.0f || (tmp38 < 0.0f || tmp40 < 0.0f))
                p_00.pdf = 0.0f;
            else {
                float3 tmp42 = tmp36 * tmp24;
                tmp43 = tmp42.x + tmp42.y + tmp42.z;
                float3 tmp44 = tmp36 * tmp23;
                tmp45 = tmp44.x + tmp44.y + tmp44.z;
                phi_in = 0.1591549367f;
                if (!(tmp38 > 0.9999899864f)) {
                    tmp46 = pow(tmp38, (tmp45 * tmp45 + tmp43 * tmp43) * tmp5 / (1.0f - tmp38 * tmp38)) * 0.1591549367f;
                    phi_in = tmp46;
                }
                phi_out = phi_in;
                float tmp47 = tmp38 * tmp26;
                p_00.pdf = (tmp5 * 0.25f + 0.25f) * min(tmp47 * 2.0f / tmp40, 1.0f) * phi_out / tmp47;
            }
        }
    }
    return;
}

void mdl_surface_scattering_sample(inout Bsdf_sample_data sret_ptr, in Shading_state_material state)
{
    Bsdf_pdf_data pdf_data;
    float3 normal_buf;
    float tmp4;
    float tmp5;
    float tmp6;
    float tmp7;
    float tmp9;
    float tmp10;
    float tmp11;
    float3 tmp12;
    float tmp15;
    float tmp16;
    float tmp17;
    float tmp18;
    float tmp19;
    float tmp20;
    float3 tmp21;
    float3 tmp22;
    float3 tmp23;
    float3 tmp24;
    float tmp26;
    float tmp27;
    float tmp28;
    float phi_in;
    float phi_out;
    float phi_in29;
    float phi_out30;
    float tmp32;
    float tmp33;
    float tmp34;
    float3 tmp35;
    float3 tmp36;
    float tmp37;
    float phi_in38;
    float phi_out39;
    float tmp40;
    float phi_in41;
    float phi_out42;
    float tmp44;
    float tmp63;
    float tmp64;
    float tmp65;
    float tmp66;
    float phi_in67;
    float phi_out68;
    float phi_in69;
    float phi_out70;
    float tmp71;
    float tmp72;
    float tmp73;
    float3 tmp74;
    float tmp76;
    float3 tmp81;
    float tmp86;
    float tmp87;
    float3 tmp0 = state.normal;
    normal_buf.x = tmp0.x;
    normal_buf.y = tmp0.y;
    normal_buf.z = tmp0.z;
    float3 tmp1 = state.tangent_u[0];
    int tmp2 = state.arg_block_offset;
    float tmp3 = max(state.text_results[0].x, 1.000000012e-07f);
    tmp4 = 2.0f / (tmp3 * tmp3);
    tmp5 = min(max(mdl_read_argblock_as_float(tmp2 + 16), 0.0f), 1.0f);
    tmp6 = min(max(mdl_read_argblock_as_float(tmp2 + 20), 0.0f), 1.0f);
    tmp7 = min(max(mdl_read_argblock_as_float(tmp2 + 24), 0.0f), 1.0f);
    float3 tmp8 = state.geom_normal;
    tmp9 = sret_ptr.k1.x;
    tmp10 = sret_ptr.k1.y;
    tmp11 = sret_ptr.k1.z;
    tmp12 = float3(tmp9, tmp10, tmp11);
    float3 tmp13 = tmp12 * tmp8;
    float tmp14 = asfloat((asint(tmp13.x + tmp13.y + tmp13.z) & -2147483648) | 1065353216);
    tmp15 = tmp8.x * tmp14;
    tmp16 = tmp8.y * tmp14;
    tmp17 = tmp8.z * tmp14;
    tmp18 = tmp0.x * tmp14;
    tmp19 = tmp0.y * tmp14;
    tmp20 = tmp0.z * tmp14;
    tmp21 = float3(tmp18, tmp19, tmp20);
    tmp22 = tmp21.zxy;
    tmp23 = tmp21.yzx;
    tmp24 = tmp22 * tmp1.yzx - tmp23 * tmp1.zxy;
    float3 tmp25 = tmp24 * tmp24;
    tmp26 = tmp25.x + tmp25.y + tmp25.z;
    if (tmp26 < 9.999999939e-09f) {
        sret_ptr.pdf = 0.0f;
        sret_ptr.event_type = Bsdf_event_type(0);
        tmp27 = sret_ptr.ior1.x;
        tmp28 = sret_ptr.ior2.x;
        phi_in = tmp28;
        phi_in29 = tmp27;
    } else {
        float tmp31 = 1.0f / sqrt(tmp26);
        tmp32 = tmp31 * tmp24.x;
        tmp33 = tmp31 * tmp24.y;
        tmp34 = tmp31 * tmp24.z;
        tmp35 = float3(tmp32, tmp33, tmp34);
        tmp36 = tmp35.zxy * tmp23 - tmp35.yzx * tmp22;
        tmp37 = sret_ptr.ior1.x;
        phi_in38 = tmp37;
        if (tmp37 == -1.0f) {
            sret_ptr.ior1.x = 1.0f;
            sret_ptr.ior1.y = 1.0f;
            sret_ptr.ior1.z = 1.0f;
            phi_in38 = 1.0f;
        }
        phi_out39 = phi_in38;
        tmp40 = sret_ptr.ior2.x;
        phi_in41 = tmp40;
        if (tmp40 == -1.0f) {
            sret_ptr.ior2.x = 1.0f;
            sret_ptr.ior2.y = 1.0f;
            sret_ptr.ior2.z = 1.0f;
            phi_in41 = 1.0f;
        }
        phi_out42 = phi_in41;
        float3 tmp43 = tmp21 * tmp12;
        tmp44 = abs(tmp43.x + tmp43.y + tmp43.z);
        float3 tmp45 = tmp36 * tmp12;
        float3 tmp46 = tmp35 * tmp12;
        float tmp47 = sret_ptr.xi.x;
        float tmp48 = cos(frac(tmp47 * 4.0f) * 3.141592741f);
        float tmp49 = tmp4 + 1.0f;
        float tmp50 = (1.0f - tmp48) * tmp49;
        float tmp51 = (tmp48 + 1.0f) * tmp49;
        float tmp52 = tmp51 + tmp50;
        float tmp53 = (pow(1.0f - sret_ptr.xi.y, -tmp52 / (tmp49 * tmp49)) + -1.0f) / tmp52;
        float tmp54 = sqrt(tmp53 * tmp51);
        float tmp55 = sqrt(tmp53 * tmp50);
        float tmp56 = tmp47 >= 0.75f || tmp47 < 0.25f ? tmp54 : -tmp54;
        float tmp57 = tmp47 >= 0.5f ? -tmp55 : tmp55;
        float3 tmp58 = float3(sqrt(tmp56 * tmp56 + 1.0f + tmp57 * tmp57), 0.0f, 0.0f);
        float3 tmp59 = float3(tmp56, 1.0f, tmp57) / tmp58.xxx;
        float tmp60 = tmp59.y * tmp44;
        float tmp61 = tmp59.z * (tmp46.x + tmp46.y + tmp46.z) + tmp59.x * (tmp45.x + tmp45.y + tmp45.z);
        float tmp62 = max(tmp60 - tmp61, 0.0f);
        tmp63 = tmp62 / (tmp62 + max(tmp61 + tmp60, 0.0f));
        tmp64 = sret_ptr.xi.z;
        if (tmp64 < tmp63) {
            sret_ptr.xi.z = tmp64 / tmp63;
            tmp65 = -tmp59.x;
            tmp66 = -tmp59.z;
            phi_in67 = tmp65;
            phi_in69 = tmp66;
        } else {
            sret_ptr.xi.z = (tmp64 - tmp63) / (1.0f - tmp63);
            phi_in67 = tmp59.x;
            phi_in69 = tmp59.z;
        }
        phi_out68 = phi_in67;
        phi_out70 = phi_in69;
        if (tmp59.y == 0.0f) {
            sret_ptr.pdf = 0.0f;
            sret_ptr.event_type = Bsdf_event_type(0);
        } else {
            tmp71 = phi_out68 * tmp36.x + tmp59.y * tmp18 + phi_out70 * tmp32;
            tmp72 = phi_out68 * tmp36.y + tmp59.y * tmp19 + phi_out70 * tmp33;
            tmp73 = phi_out68 * tmp36.z + tmp59.y * tmp20 + phi_out70 * tmp34;
            tmp74 = float3(tmp71, tmp72, tmp73);
            float3 tmp75 = tmp74 * tmp12;
            tmp76 = tmp75.x + tmp75.y + tmp75.z;
            if (tmp76 > 0.0f) {
                float tmp77 = tmp76 * 2.0f;
                float tmp78 = tmp77 * tmp71 - tmp9;
                float tmp79 = tmp77 * tmp72 - tmp10;
                float tmp80 = tmp77 * tmp73 - tmp11;
                sret_ptr.k2.x = tmp78;
                sret_ptr.k2.y = tmp79;
                sret_ptr.k2.z = tmp80;
                sret_ptr.event_type = Bsdf_event_type(10);
                sret_ptr.bsdf_over_pdf.x = 1.0f;
                sret_ptr.bsdf_over_pdf.y = 1.0f;
                sret_ptr.bsdf_over_pdf.z = 1.0f;
                tmp81 = float3(tmp78, tmp79, tmp80);
                float3 tmp82 = tmp81 * float3(tmp15, tmp16, tmp17);
                if (tmp82.x + tmp82.y + tmp82.z > 0.0f) {
                    float3 tmp83 = tmp81 * tmp21;
                    float3 tmp84 = tmp81 * tmp74;
                    float tmp85 = tmp59.y * 2.0f;
                    tmp86 = min(tmp85 * tmp44 / tmp76, 1.0f);
                    tmp87 = min(tmp86, min(abs(tmp83.x + tmp83.y + tmp83.z) * tmp85 / abs(tmp84.x + tmp84.y + tmp84.z), 1.0f));
                    if (tmp87 > 0.0f) {
                        float tmp88 = tmp87 / tmp86;
                        sret_ptr.bsdf_over_pdf.x = tmp88;
                        sret_ptr.bsdf_over_pdf.y = tmp88;
                        sret_ptr.bsdf_over_pdf.z = tmp88;
                        sret_ptr.handle = 0;
                    } else {
                        sret_ptr.pdf = 0.0f;
                        sret_ptr.event_type = Bsdf_event_type(0);
                    }
                } else {
                    sret_ptr.pdf = 0.0f;
                    sret_ptr.event_type = Bsdf_event_type(0);
                }
            } else {
                sret_ptr.pdf = 0.0f;
                sret_ptr.event_type = Bsdf_event_type(0);
            }
        }
        sret_ptr.bsdf_over_pdf.x = sret_ptr.bsdf_over_pdf.x * tmp5;
        sret_ptr.bsdf_over_pdf.y = sret_ptr.bsdf_over_pdf.y * tmp6;
        sret_ptr.bsdf_over_pdf.z = sret_ptr.bsdf_over_pdf.z * tmp7;
        phi_in = phi_out42;
        phi_in29 = phi_out39;
    }
    phi_out = phi_in;
    phi_out30 = phi_in29;
    pdf_data.ior1.x = phi_out30;
    pdf_data.ior1.y = sret_ptr.ior1.y;
    pdf_data.ior1.z = sret_ptr.ior1.z;
    pdf_data.ior2.x = phi_out;
    pdf_data.ior2.y = sret_ptr.ior2.y;
    pdf_data.ior2.z = sret_ptr.ior2.z;
    pdf_data.k1.x = tmp9;
    pdf_data.k1.y = tmp10;
    pdf_data.k1.z = tmp11;
    pdf_data.k2.x = sret_ptr.k2.x;
    pdf_data.k2.y = sret_ptr.k2.y;
    pdf_data.k2.z = sret_ptr.k2.z;
    gen_simple_glossy_bsdf_pdf(pdf_data, state, normal_buf);
    float tmp89 = pdf_data.pdf;
    sret_ptr.pdf = tmp89;
    return;
}

void mdl_surface_scattering_evaluate(inout Bsdf_evaluate_data sret_ptr, in Shading_state_material state)
{
    int tmp2;
    float tmp4;
    float tmp6;
    float tmp7;
    float tmp8;
    float3 tmp9;
    float tmp12;
    float tmp13;
    float tmp14;
    float3 tmp15;
    float3 tmp16;
    float3 tmp17;
    float3 tmp18;
    float tmp20;
    float3 phi_in;
    float3 phi_out;
    float3 tmp22;
    float3 tmp23;
    float tmp25;
    float tmp26;
    float tmp27;
    float tmp28;
    float3 tmp29;
    float tmp31;
    float3 tmp37;
    float tmp39;
    float tmp41;
    float tmp43;
    float tmp45;
    float tmp47;
    float phi_in48;
    float phi_out49;
    float tmp50;
    float3 tmp55;
    float3 tmp0 = state.normal;
    sret_ptr.bsdf_diffuse = float3(0.0f, 0.0f, 0.0f);
    float3 tmp1 = state.tangent_u[0];
    tmp2 = state.arg_block_offset;
    float tmp3 = max(state.text_results[0].x, 1.000000012e-07f);
    tmp4 = 2.0f / (tmp3 * tmp3);
    float3 tmp5 = state.geom_normal;
    tmp6 = sret_ptr.k1.x;
    tmp7 = sret_ptr.k1.y;
    tmp8 = sret_ptr.k1.z;
    tmp9 = float3(tmp6, tmp7, tmp8);
    float3 tmp10 = tmp9 * tmp5;
    float tmp11 = asfloat((asint(tmp10.x + tmp10.y + tmp10.z) & -2147483648) | 1065353216);
    tmp12 = tmp5.x * tmp11;
    tmp13 = tmp5.y * tmp11;
    tmp14 = tmp5.z * tmp11;
    tmp15 = float3(tmp0.x * tmp11, tmp0.y * tmp11, tmp0.z * tmp11);
    tmp16 = tmp15.zxy;
    tmp17 = tmp15.yzx;
    tmp18 = tmp16 * tmp1.yzx - tmp17 * tmp1.zxy;
    float3 tmp19 = tmp18 * tmp18;
    tmp20 = tmp19.x + tmp19.y + tmp19.z;
    if (tmp20 < 9.999999939e-09f) {
        sret_ptr.pdf = 0.0f;
        phi_in = float3(0.0f, 0.0f, 0.0f);
    } else {
        float tmp21 = 1.0f / sqrt(tmp20);
        tmp22 = float3(tmp21 * tmp18.x, tmp21 * tmp18.y, tmp21 * tmp18.z);
        tmp23 = tmp22.zxy * tmp17 - tmp22.yzx * tmp16;
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
        float3 tmp24 = tmp15 * tmp9;
        tmp25 = abs(tmp24.x + tmp24.y + tmp24.z);
        tmp26 = sret_ptr.k2.x;
        tmp27 = sret_ptr.k2.y;
        tmp28 = sret_ptr.k2.z;
        tmp29 = float3(tmp26, tmp27, tmp28);
        float3 tmp30 = tmp29 * tmp15;
        tmp31 = abs(tmp30.x + tmp30.y + tmp30.z);
        float3 tmp32 = tmp29 * float3(tmp12, tmp13, tmp14);
        if (tmp32.x + tmp32.y + tmp32.z < 0.0f) {
            sret_ptr.pdf = 0.0f;
            phi_in = float3(0.0f, 0.0f, 0.0f);
        } else {
            float tmp33 = tmp26 + tmp6;
            float tmp34 = tmp27 + tmp7;
            float tmp35 = tmp28 + tmp8;
            float3 tmp36 = float3(sqrt(tmp34 * tmp34 + tmp33 * tmp33 + tmp35 * tmp35), 0.0f, 0.0f);
            tmp37 = float3(tmp33, tmp34, tmp35) / tmp36.xxx;
            float3 tmp38 = tmp37 * tmp15;
            tmp39 = tmp38.x + tmp38.y + tmp38.z;
            float3 tmp40 = tmp37 * tmp9;
            tmp41 = tmp40.x + tmp40.y + tmp40.z;
            float3 tmp42 = tmp37 * tmp29;
            tmp43 = tmp42.x + tmp42.y + tmp42.z;
            if (tmp43 < 0.0f || (tmp39 < 0.0f || tmp41 < 0.0f)) {
                sret_ptr.pdf = 0.0f;
                phi_in = float3(0.0f, 0.0f, 0.0f);
            } else {
                float3 tmp44 = tmp37 * tmp23;
                tmp45 = tmp44.x + tmp44.y + tmp44.z;
                float3 tmp46 = tmp37 * tmp22;
                tmp47 = tmp46.x + tmp46.y + tmp46.z;
                phi_in48 = 0.1591549367f;
                if (!(tmp39 > 0.9999899864f)) {
                    tmp50 = pow(tmp39, (tmp47 * tmp47 + tmp45 * tmp45) * tmp4 / (1.0f - tmp39 * tmp39)) * 0.1591549367f;
                    phi_in48 = tmp50;
                }
                phi_out49 = phi_in48;
                float tmp51 = tmp39 * 2.0f;
                float tmp52 = min(tmp51 * tmp25 / tmp41, 1.0f);
                float tmp53 = phi_out49 * (tmp4 * 0.25f + 0.25f) / (tmp39 * tmp25);
                float tmp54 = tmp53 * min(tmp52, min(tmp51 * tmp31 / tmp43, 1.0f));
                tmp55 = float3(tmp54, tmp54, tmp54);
                sret_ptr.pdf = tmp53 * tmp52;
                phi_in = tmp55;
            }
        }
    }
    phi_out = phi_in;
    sret_ptr.bsdf_glossy.x = min(max(mdl_read_argblock_as_float(tmp2 + 16), 0.0f), 1.0f) * phi_out.x;
    sret_ptr.bsdf_glossy.y = min(max(mdl_read_argblock_as_float(tmp2 + 20), 0.0f), 1.0f) * phi_out.y;
    sret_ptr.bsdf_glossy.z = min(max(mdl_read_argblock_as_float(tmp2 + 24), 0.0f), 1.0f) * phi_out.z;
    return;
}

void mdl_surface_scattering_pdf(inout Bsdf_pdf_data sret_ptr, in Shading_state_material state)
{
    float3 normal_buf;
    float3 tmp0 = state.normal;
    normal_buf.x = tmp0.x;
    normal_buf.y = tmp0.y;
    normal_buf.z = tmp0.z;
    gen_simple_glossy_bsdf_pdf(sret_ptr, state, normal_buf);
    return;
}

void mdl_surface_scattering_auxiliary(inout Bsdf_auxiliary_data sret_ptr, in Shading_state_material state)
{
    int tmp1;
    float tmp8;
    float tmp9;
    float tmp10;
    float phi_in;
    float phi_out;
    float phi_in14;
    float phi_out15;
    float phi_in16;
    float phi_out17;
    float phi_in18;
    float phi_out19;
    float phi_in20;
    float phi_out21;
    float tmp22;
    float3 tmp0 = state.normal;
    sret_ptr.albedo_diffuse = float3(0.0f, 0.0f, 0.0f);
    sret_ptr.albedo_glossy = float3(0.0f, 0.0f, 0.0f);
    sret_ptr.normal = float3(0.0f, 0.0f, 0.0f);
    sret_ptr.roughness = float3(0.0f, 0.0f, 0.0f);
    tmp1 = state.arg_block_offset;
    float3 tmp2 = state.tangent_u[0];
    float tmp3 = sret_ptr.k1.x;
    float tmp4 = sret_ptr.k1.y;
    float tmp5 = sret_ptr.k1.z;
    float3 tmp6 = float3(tmp3, tmp4, tmp5) * state.geom_normal;
    float tmp7 = asfloat((asint(tmp6.x + tmp6.y + tmp6.z) & -2147483648) | 1065353216);
    tmp8 = tmp0.x * tmp7;
    tmp9 = tmp0.y * tmp7;
    tmp10 = tmp0.z * tmp7;
    float3 tmp11 = float3(tmp8, tmp9, tmp10);
    float3 tmp12 = tmp11.zxy * tmp2.yzx - tmp11.yzx * tmp2.zxy;
    float3 tmp13 = tmp12 * tmp12;
    phi_in = 0.0f;
    phi_in14 = 0.0f;
    phi_in16 = 0.0f;
    phi_in18 = 0.0f;
    phi_in20 = 0.0f;
    if (!(tmp13.x + tmp13.y + tmp13.z < 9.999999939e-09f)) {
        tmp22 = state.text_results[0].x;
        sret_ptr.albedo_glossy.x = min(max(mdl_read_argblock_as_float(tmp1 + 16), 0.0f), 1.0f);
        sret_ptr.albedo_glossy.y = min(max(mdl_read_argblock_as_float(tmp1 + 20), 0.0f), 1.0f);
        sret_ptr.albedo_glossy.z = min(max(mdl_read_argblock_as_float(tmp1 + 24), 0.0f), 1.0f);
        sret_ptr.normal.x = tmp8;
        sret_ptr.normal.y = tmp9;
        sret_ptr.normal.z = tmp10;
        sret_ptr.roughness.x = tmp22;
        sret_ptr.roughness.y = tmp22;
        sret_ptr.roughness.z = 1.0f;
        phi_in = tmp22;
        phi_in14 = 1.0f;
        phi_in16 = tmp10;
        phi_in18 = tmp9;
        phi_in20 = tmp8;
    }
    phi_out = phi_in;
    phi_out15 = phi_in14;
    phi_out17 = phi_in16;
    phi_out19 = phi_in18;
    phi_out21 = phi_in20;
    if (phi_out21 != 0.0f || (phi_out19 != 0.0f || phi_out17 != 0.0f)) {
        float3 tmp23 = float3(sqrt(phi_out19 * phi_out19 + phi_out21 * phi_out21 + phi_out17 * phi_out17), 0.0f, 0.0f);
        sret_ptr.normal = float3(phi_out21, phi_out19, phi_out17) / tmp23.xxx;
    }
    if (!(phi_out15 == 0.0f)) {
        float tmp24 = phi_out / phi_out15;
        sret_ptr.roughness.x = tmp24;
        sret_ptr.roughness.y = tmp24;
    }
    return;
}

float mdl_standalone_geometry_cutout_opacity(in Shading_state_material state)
{
    return 1.0f;
}
