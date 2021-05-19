
// Native half not supported on CPU currently
//DISABLE_TEST(compute):COMPARE_COMPUTE_EX:-cpu -compute -output-using-type -shaderobj
// Doesn't work on DX11 currently - locks up on binding
//DISABLE_TEST(compute):COMPARE_COMPUTE_EX:-slang -compute -output-using-type -shaderobj
// Produces a different result on DX12 with DXBC than expected(!). So disabled for now
//DISABLE_TEST(compute):COMPARE_COMPUTE_EX:-slang -compute -dx12 -output-using-type -shaderobj
//DISABLE_TEST(compute):COMPARE_COMPUTE_EX:-slang -compute -dx12 -profile cs_6_0 -use-dxil -output-using-type -shaderobj
// TODO(JS): Doesn't work on vk currently, because createTextureView not implemented on vk renderer
//DIABLE_TEST(compute, vulkan):COMPARE_COMPUTE_EX:-vk -compute -output-using-type -shaderobj
// TODO(JS): Doesn't work on certain CI systems. 
//TEST(compute):COMPARE_COMPUTE_EX:-cuda -compute -output-using-type -shaderobj -render-features half

//TEST_INPUT: RWTexture2D(format=R_Float16, size=4, content = one, mipMaps = 1):name rwt2D
RWTexture2D<half> rwt2D;

//TEST_INPUT: RWTexture2D(format=RGBA_Float16, size=4, content = one, mipMaps = 1):name rwt2D_4
RWTexture2D<half4> rwt2D_4;

//TEST_INPUT: ubuffer(data=[0 0 0 0], stride=4):out,name outputBuffer
RWStructuredBuffer<float> outputBuffer;

[numthreads(4, 1, 1)]
void computeMain(uint3 dispatchThreadID : SV_DispatchThreadID)
{
    int idx = dispatchThreadID.x;
    
    float val = 0.0f;
 
    //val += rwt1D[idx];
    
    half h0 = rwt2D[uint2(idx, idx)];

    val += float(h0);
    
    half4 h1 = rwt2D_4[uint2(idx, idx)];
    float4 f1 = h1;
   
    val += f1.x + f1.y + f1.z + f1.w;
    
    // NOTE! This is disabled because on CUDA, whilst this has an effect it is not what is expected.
    // The value read back has changed but seems to always be 1.
    // rwt1D[idx] = idx;
    rwt2D[uint2(idx, idx)] = half(idx);    
    
    //val += rwt1D[idx];
    val += rwt2D[uint2(idx, idx)];
    //val += rwt3D[uint3(idx, idx, idx)];
 
    outputBuffer[idx] = val;
}