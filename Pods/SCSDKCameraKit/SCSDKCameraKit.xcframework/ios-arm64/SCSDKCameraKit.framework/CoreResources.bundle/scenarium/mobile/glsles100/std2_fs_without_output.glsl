#pragma once
//SG_REFLECTION_BEGIN(100)
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#include <std2.glsl>
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&!sc_StereoRendering_IsClipDistanceEnabled
        #define sc_StereoFragmentMain main
        #define sc_MainInjector MAIN(); void sc_MainInjected
    #else
        #define MAIN sc_MainInjector
    #endif
#include <std2.glsl>
vec4 sc_ApplyBlendModeModifications(vec4 color)
{
#if (sc_BlendMode_MultiplyOriginal)
{
return vec4(mix(vec3(1.0),color.xyz,vec3(color.w)),color.w);
}
#else
{
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaHardware)
{
return vec4(color.xyz*color.w,color.w);
}
#else
{
return color;
}
#endif
}
#endif
}
void sc_DiscardStereoFragment()
{
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==1))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
}
vec4 getPixelRenderingCost()
{
#if (sc_ShaderComplexityAnalyzer)
{
return vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
return vec4(0.0);
}
#endif
}
void sc_MainInjector()
{
}
void sc_CallLensFragmentMain()
{
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&!sc_StereoRendering_IsClipDistanceEnabled
        MAIN();
    #endif
}
void sc_StereoFragmentMain()
{
sc_DiscardStereoFragment();
sc_CallLensFragmentMain();
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
