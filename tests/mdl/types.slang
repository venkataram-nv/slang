import enumerations;

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
