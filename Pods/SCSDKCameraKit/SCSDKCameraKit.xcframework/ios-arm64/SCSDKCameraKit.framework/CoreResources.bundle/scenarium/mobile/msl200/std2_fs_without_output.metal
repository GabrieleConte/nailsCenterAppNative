#pragma once
#include <metal_stdlib>
#include <simd/simd.h>
#include "std2.metal"
using namespace metal;
//SG_REFLECTION_BEGIN(100)
//SG_REFLECTION_END

namespace SNAP_VS {
} // VERTEX SHADER


namespace SNAP_FS {
float4 sc_ApplyBlendModeModifications(thread const float4& color)
{
#if (sc_BlendMode_MultiplyOriginal)
{
return float4(mix(float3(1.0),color.xyz,float3(color.w)),color.w);
}
#else
{
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaHardware)
{
return float4(color.xyz*color.w,color.w);
}
#else
{
return color;
}
#endif
}
#endif
}
void sc_DiscardStereoFragment(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==1))
{
if (sc_sysIn.varClipDistance<0.0)
{
discard_fragment();
}
}
#endif
}
float4 getPixelRenderingCost(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_ShaderComplexityAnalyzer)
{
return float4((*sc_set0.LibraryUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
return float4(0.0);
}
#endif
}
void sc_MainInjector()
{
}
void sc_CallLensFragmentMain()
{
}
void sc_StereoFragmentMain(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
sc_DiscardStereoFragment(sc_sysIn,sc_set0,sc_set1);
sc_CallLensFragmentMain();
}
} // FRAGMENT SHADER
