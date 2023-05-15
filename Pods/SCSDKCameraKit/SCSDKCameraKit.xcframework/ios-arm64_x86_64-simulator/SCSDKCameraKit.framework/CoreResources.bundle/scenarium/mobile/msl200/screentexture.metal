#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
#define STD_DISABLE_VERTEX_NORMAL 1
#define STD_DISABLE_VERTEX_TANGENT 1
#define STD_DISABLE_VERTEX_TEXTURE1 1
#include "required2.metal"
#include "std2_vs.metal"
#include "std2_fs.metal"
#include "std2_texture.metal"
using namespace metal;
//SG_REFLECTION_BEGIN(100)
//sampler sampler screenTextureSmpSC 2:1
//texture texture2D screenTexture 2:0:2:1
//ubo float UserUniforms 2:2:192 {
//float3x3 meshTransform 0
//float screenTextureBias 48
//float screenTextureLevel 52
//float4 screenTextureSize 64
//float4 screenTextureDims 80
//float4 screenTextureView 96
//float3x3 screenTextureTransform 112
//float4 screenTextureUvMinMax 160
//float4 screenTextureBorderColor 176
//}
//SG_REFLECTION_END

namespace SNAP_VS {
struct userUniformsObj
{
float3x3 meshTransform;
float screenTextureBias;
float screenTextureLevel;
float4 screenTextureSize;
float4 screenTextureDims;
float4 screenTextureView;
float3x3 screenTextureTransform;
float4 screenTextureUvMinMax;
float4 screenTextureBorderColor;
};
#ifndef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 0
#elif screenTextureHasSwappedViews==1
#undef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 1
#endif
#ifndef screenTextureLayout
#define screenTextureLayout 0
#endif
#ifndef ONLY_VERTEX_ATTRIBUTE
#define ONLY_VERTEX_ATTRIBUTE 0
#elif ONLY_VERTEX_ATTRIBUTE==1
#undef ONLY_VERTEX_ATTRIBUTE
#define ONLY_VERTEX_ATTRIBUTE 1
#endif
#ifndef USE_MESH_TRANSFORM
#define USE_MESH_TRANSFORM 0
#elif USE_MESH_TRANSFORM==1
#undef USE_MESH_TRANSFORM
#define USE_MESH_TRANSFORM 1
#endif
#ifndef USE_MIP_BIAS
#define USE_MIP_BIAS 0
#elif USE_MIP_BIAS==1
#undef USE_MIP_BIAS
#define USE_MIP_BIAS 1
#endif
#ifndef SWAP_R_B_CHANNELS
#define SWAP_R_B_CHANNELS 0
#elif SWAP_R_B_CHANNELS==1
#undef SWAP_R_B_CHANNELS
#define SWAP_R_B_CHANNELS 1
#endif
#ifndef GRAYSCALE_AS_ALPHA
#define GRAYSCALE_AS_ALPHA 0
#elif GRAYSCALE_AS_ALPHA==1
#undef GRAYSCALE_AS_ALPHA
#define GRAYSCALE_AS_ALPHA 1
#endif
#ifndef screenTextureUV
#define screenTextureUV 0
#endif
#ifndef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 0
#elif SC_USE_UV_TRANSFORM_screenTexture==1
#undef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_screenTexture
#define SC_SOFTWARE_WRAP_MODE_U_screenTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_screenTexture
#define SC_SOFTWARE_WRAP_MODE_V_screenTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 0
#elif SC_USE_UV_MIN_MAX_screenTexture==1
#undef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 0
#elif SC_USE_CLAMP_TO_BORDER_screenTexture==1
#undef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 1
#endif
struct sc_Set2
{
texture2d<float> screenTexture [[id(0)]];
sampler screenTextureSmpSC [[id(1)]];
constant userUniformsObj* UserUniforms [[id(2)]];
};
struct sc_VertOut
{
sc_SysOut sc_sysOut;
};
struct sc_VertIn
{
sc_SysAttributes sc_sysAttributes;
};
vertex sc_VertOut main_vert(sc_VertIn sc_vertIn [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],constant sc_Set1& sc_set1 [[buffer(1)]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_VertexIndex [[vertex_id]],uint gl_InstanceIndex [[instance_id]])
{
sc_SysIn sc_sysIn;
sc_sysIn.sc_sysAttributes=sc_vertIn.sc_sysAttributes;
sc_sysIn.gl_VertexIndex=gl_VertexIndex;
sc_sysIn.gl_InstanceIndex=gl_InstanceIndex;
sc_VertOut sc_vertOut={};
sc_Vertex_t v=sc_LoadVertexAttributes(sc_sysIn,sc_vertOut.sc_sysOut,sc_set0,sc_set1);
float2 texture0;
#if (ONLY_VERTEX_ATTRIBUTE)
{
texture0=(v.position.xy+float2(1.0))*0.5;
}
#else
{
texture0=v.texture0;
}
#endif
v.texture0=float2(((*sc_set2.UserUniforms).screenTextureTransform*float3(texture0,1.0)).xy);
#if (USE_MESH_TRANSFORM)
{
float2 l9_0=float2(((*sc_set2.UserUniforms).meshTransform*float3(sc_sysIn.sc_sysAttributes.position.xy,1.0)).xy);
v.position=float4(l9_0.x,l9_0.y,v.position.z,v.position.w);
}
#endif
sc_Vertex_t param=v;
sc_ProcessVertex(param,sc_sysIn,sc_vertOut.sc_sysOut,sc_set0,sc_set1);
return sc_vertOut;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct userUniformsObj
{
float3x3 meshTransform;
float screenTextureBias;
float screenTextureLevel;
float4 screenTextureSize;
float4 screenTextureDims;
float4 screenTextureView;
float3x3 screenTextureTransform;
float4 screenTextureUvMinMax;
float4 screenTextureBorderColor;
};
#ifndef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 0
#elif screenTextureHasSwappedViews==1
#undef screenTextureHasSwappedViews
#define screenTextureHasSwappedViews 1
#endif
#ifndef screenTextureLayout
#define screenTextureLayout 0
#endif
#ifndef USE_MIP_BIAS
#define USE_MIP_BIAS 0
#elif USE_MIP_BIAS==1
#undef USE_MIP_BIAS
#define USE_MIP_BIAS 1
#endif
#ifndef SWAP_R_B_CHANNELS
#define SWAP_R_B_CHANNELS 0
#elif SWAP_R_B_CHANNELS==1
#undef SWAP_R_B_CHANNELS
#define SWAP_R_B_CHANNELS 1
#endif
#ifndef GRAYSCALE_AS_ALPHA
#define GRAYSCALE_AS_ALPHA 0
#elif GRAYSCALE_AS_ALPHA==1
#undef GRAYSCALE_AS_ALPHA
#define GRAYSCALE_AS_ALPHA 1
#endif
#ifndef USE_MESH_TRANSFORM
#define USE_MESH_TRANSFORM 0
#elif USE_MESH_TRANSFORM==1
#undef USE_MESH_TRANSFORM
#define USE_MESH_TRANSFORM 1
#endif
#ifndef ONLY_VERTEX_ATTRIBUTE
#define ONLY_VERTEX_ATTRIBUTE 0
#elif ONLY_VERTEX_ATTRIBUTE==1
#undef ONLY_VERTEX_ATTRIBUTE
#define ONLY_VERTEX_ATTRIBUTE 1
#endif
#ifndef screenTextureUV
#define screenTextureUV 0
#endif
#ifndef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 0
#elif SC_USE_UV_TRANSFORM_screenTexture==1
#undef SC_USE_UV_TRANSFORM_screenTexture
#define SC_USE_UV_TRANSFORM_screenTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_screenTexture
#define SC_SOFTWARE_WRAP_MODE_U_screenTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_screenTexture
#define SC_SOFTWARE_WRAP_MODE_V_screenTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 0
#elif SC_USE_UV_MIN_MAX_screenTexture==1
#undef SC_USE_UV_MIN_MAX_screenTexture
#define SC_USE_UV_MIN_MAX_screenTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 0
#elif SC_USE_CLAMP_TO_BORDER_screenTexture==1
#undef SC_USE_CLAMP_TO_BORDER_screenTexture
#define SC_USE_CLAMP_TO_BORDER_screenTexture 1
#endif
struct sc_Set2
{
texture2d<float> screenTexture [[id(0)]];
sampler screenTextureSmpSC [[id(1)]];
constant userUniformsObj* UserUniforms [[id(2)]];
};
struct sc_FragOut
{
sc_SysOut sc_sysOut;
};
struct sc_FragIn
{
sc_SysIn sc_sysIn;
};
int screenTextureGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (screenTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float2 screenTextureGetDims2D(constant userUniformsObj& UserUniforms)
{
return UserUniforms.screenTextureDims.xy;
}
float4 screenTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,constant userUniformsObj& UserUniforms,thread texture2d<float> screenTexture,thread sampler screenTextureSmpSC)
{
float2 param=screenTextureGetDims2D(UserUniforms);
float2 param_1=uv;
int param_2=screenTextureLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(screenTexture,screenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 screenTextureSampleViewBias(thread const float2& uv,thread const float& bias0,constant userUniformsObj& UserUniforms,thread texture2d<float> screenTexture,thread sampler screenTextureSmpSC,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=screenTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return screenTextureSampleViewIndexBias(param,param_1,param_2,UserUniforms,screenTexture,screenTextureSmpSC);
}
float4 screenTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,constant userUniformsObj& UserUniforms,thread texture2d<float> screenTexture,thread sampler screenTextureSmpSC)
{
#if (sc_CanUseTextureLod)
{
float2 param=screenTextureGetDims2D(UserUniforms);
float2 param_1=uv;
int param_2=screenTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(screenTexture,screenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 screenTextureSampleViewLevel(thread const float2& uv,thread const float& level,constant userUniformsObj& UserUniforms,thread texture2d<float> screenTexture,thread sampler screenTextureSmpSC,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=screenTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return screenTextureSampleViewIndexLevel(param,param_1,param_2,UserUniforms,screenTexture,screenTextureSmpSC);
}
fragment sc_FragOut main_frag(sc_FragIn sc_fragIn [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],constant sc_Set1& sc_set1 [[buffer(1)]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]],bool gl_FrontFacing [[front_facing]])
{
sc_fragIn.sc_sysIn.gl_FragCoord=gl_FragCoord;
sc_fragIn.sc_sysIn.gl_FrontFacing=gl_FrontFacing;
sc_FragOut sc_fragOut={};
float4 l9_0;
#if (USE_MIP_BIAS)
{
float2 param=sc_fragIn.sc_sysIn.varPackedTex.xy;
float param_1=(*sc_set2.UserUniforms).screenTextureBias;
l9_0=screenTextureSampleViewBias(param,param_1,(*sc_set2.UserUniforms),sc_set2.screenTexture,sc_set2.screenTextureSmpSC,sc_fragIn.sc_sysIn,sc_set0,sc_set1);
}
#else
{
float2 param_2=sc_fragIn.sc_sysIn.varPackedTex.xy;
float param_3=(*sc_set2.UserUniforms).screenTextureLevel;
l9_0=screenTextureSampleViewLevel(param_2,param_3,(*sc_set2.UserUniforms),sc_set2.screenTexture,sc_set2.screenTextureSmpSC,sc_fragIn.sc_sysIn,sc_set0,sc_set1);
}
#endif
float4 screenTextureColor=l9_0;
#if (SWAP_R_B_CHANNELS)
{
float4 param_4=screenTextureColor.zyxw;
sc_writeFragData0(param_4,sc_fragIn.sc_sysIn,sc_fragOut.sc_sysOut,sc_set0,sc_set1);
}
#else
{
#if (GRAYSCALE_AS_ALPHA)
{
float4 param_5=float4(1.0,1.0,1.0,screenTextureColor.x);
sc_writeFragData0(param_5,sc_fragIn.sc_sysIn,sc_fragOut.sc_sysOut,sc_set0,sc_set1);
}
#else
{
float4 param_6=screenTextureColor;
sc_writeFragData0(param_6,sc_fragIn.sc_sysIn,sc_fragOut.sc_sysOut,sc_set0,sc_set1);
}
#endif
}
#endif
return sc_fragOut;
}
} // FRAGMENT SHADER
