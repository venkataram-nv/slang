//TEST(compute):COMPARE_COMPUTE_EX:-slang -compute -shaderobj -output-using-type
//TEST(compute, vulkan):COMPARE_COMPUTE_EX:-vk -compute -shaderobj -output-using-type
//TEST(compute):COMPARE_COMPUTE_EX:-cpu -compute -output-using-type -shaderobj

//TEST_INPUT:ubuffer(data=[0], stride=4):out,name=outputBuffer
RWStructuredBuffer<float> outputBuffer;

float rng(int state, float x)
{
    return state + x;
}

[BackwardDerivativeOf(rng)]
void rng_bwd(int inState, inout DifferentialPair<float> x, float dOut)
{
    x = diffPair(x.p, (float)inState + dOut - 1.0);
}

[numthreads(1, 1, 1)]
void computeMain(uint3 dispatchThreadID : SV_DispatchThreadID)
{
    var x = diffPair(2.0, 1.0);

    __bwd_diff(rng)(4, x, 3.0);

    outputBuffer[0] = x.d; // should be 6

}
