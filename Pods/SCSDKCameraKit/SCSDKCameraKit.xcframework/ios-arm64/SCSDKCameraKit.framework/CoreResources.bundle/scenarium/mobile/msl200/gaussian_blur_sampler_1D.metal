#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
#define STD_DISABLE_VERTEX_NORMAL 1
#define STD_DISABLE_VERTEX_TANGENT 1
#define STD_DISABLE_VERTEX_TEXTURE1 1
#include "std2_vs.metal"
#include "std2_fs.metal"
#include "std2_texture.metal"
using namespace metal;
//SG_REFLECTION_BEGIN(100)
//sampler sampler targetTextureSmpSC 2:1
//texture texture2D targetTexture 2:0:2:1
//ubo float UserUniforms 2:2 {
//float4 targetTextureSize 0
//float4 targetTextureDims 16
//float4 targetTextureView 32
//float3x3 targetTextureTransform 48
//float4 targetTextureUvMinMax 96
//float4 targetTextureBorderColor 112
//float gaussianFilterWeights 128:[]:16
//float gaussianFilterOffsets :[]:16
//}
//SG_REFLECTION_END

namespace SNAP_VS {
#ifndef sc_GaussianFilterDataLength
#define sc_GaussianFilterDataLength 5
#endif
struct userUniformsObj
{
float4 targetTextureSize;
float4 targetTextureDims;
float4 targetTextureView;
float3x3 targetTextureTransform;
float4 targetTextureUvMinMax;
float4 targetTextureBorderColor;
float gaussianFilterWeights[sc_GaussianFilterDataLength];
float gaussianFilterOffsets[sc_GaussianFilterDataLength];
};
#ifndef targetTextureHasSwappedViews
#define targetTextureHasSwappedViews 0
#elif targetTextureHasSwappedViews==1
#undef targetTextureHasSwappedViews
#define targetTextureHasSwappedViews 1
#endif
#ifndef targetTextureLayout
#define targetTextureLayout 0
#endif
#ifndef sc_GaussianFilterVerticalPass
#define sc_GaussianFilterVerticalPass 0
#elif sc_GaussianFilterVerticalPass==1
#undef sc_GaussianFilterVerticalPass
#define sc_GaussianFilterVerticalPass 1
#endif
#ifndef targetTextureUV
#define targetTextureUV 0
#endif
#ifndef SC_USE_UV_TRANSFORM_targetTexture
#define SC_USE_UV_TRANSFORM_targetTexture 0
#elif SC_USE_UV_TRANSFORM_targetTexture==1
#undef SC_USE_UV_TRANSFORM_targetTexture
#define SC_USE_UV_TRANSFORM_targetTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_targetTexture
#define SC_SOFTWARE_WRAP_MODE_U_targetTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_targetTexture
#define SC_SOFTWARE_WRAP_MODE_V_targetTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_targetTexture
#define SC_USE_UV_MIN_MAX_targetTexture 0
#elif SC_USE_UV_MIN_MAX_targetTexture==1
#undef SC_USE_UV_MIN_MAX_targetTexture
#define SC_USE_UV_MIN_MAX_targetTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_targetTexture
#define SC_USE_CLAMP_TO_BORDER_targetTexture 0
#elif SC_USE_CLAMP_TO_BORDER_targetTexture==1
#undef SC_USE_CLAMP_TO_BORDER_targetTexture
#define SC_USE_CLAMP_TO_BORDER_targetTexture 1
#endif
struct sc_Set2
{
texture2d<float> targetTexture [[id(0)]];
sampler targetTextureSmpSC [[id(1)]];
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
sc_Vertex_t param=v;
sc_ProcessVertex(param,sc_sysIn,sc_vertOut.sc_sysOut,sc_set0,sc_set1);
return sc_vertOut;
}
} // VERTEX SHADER


namespace SNAP_FS {
#ifndef sc_GaussianFilterDataLength
#define sc_GaussianFilterDataLength 5
#endif
struct userUniformsObj
{
float4 targetTextureSize;
float4 targetTextureDims;
float4 targetTextureView;
float3x3 targetTextureTransform;
float4 targetTextureUvMinMax;
float4 targetTextureBorderColor;
float gaussianFilterWeights[sc_GaussianFilterDataLength];
float gaussianFilterOffsets[sc_GaussianFilterDataLength];
};
#ifndef targetTextureHasSwappedViews
#define targetTextureHasSwappedViews 0
#elif targetTextureHasSwappedViews==1
#undef targetTextureHasSwappedViews
#define targetTextureHasSwappedViews 1
#endif
#ifndef targetTextureLayout
#define targetTextureLayout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_targetTexture
#define SC_USE_UV_TRANSFORM_targetTexture 0
#elif SC_USE_UV_TRANSFORM_targetTexture==1
#undef SC_USE_UV_TRANSFORM_targetTexture
#define SC_USE_UV_TRANSFORM_targetTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_targetTexture
#define SC_SOFTWARE_WRAP_MODE_U_targetTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_targetTexture
#define SC_SOFTWARE_WRAP_MODE_V_targetTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_targetTexture
#define SC_USE_UV_MIN_MAX_targetTexture 0
#elif SC_USE_UV_MIN_MAX_targetTexture==1
#undef SC_USE_UV_MIN_MAX_targetTexture
#define SC_USE_UV_MIN_MAX_targetTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_targetTexture
#define SC_USE_CLAMP_TO_BORDER_targetTexture 0
#elif SC_USE_CLAMP_TO_BORDER_targetTexture==1
#undef SC_USE_CLAMP_TO_BORDER_targetTexture
#define SC_USE_CLAMP_TO_BORDER_targetTexture 1
#endif
#ifndef sc_GaussianFilterVerticalPass
#define sc_GaussianFilterVerticalPass 0
#elif sc_GaussianFilterVerticalPass==1
#undef sc_GaussianFilterVerticalPass
#define sc_GaussianFilterVerticalPass 1
#endif
#ifndef targetTextureUV
#define targetTextureUV 0
#endif
struct sc_Set2
{
texture2d<float> targetTexture [[id(0)]];
sampler targetTextureSmpSC [[id(1)]];
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
float2 targetTextureGetDims2D(constant userUniformsObj& UserUniforms)
{
return UserUniforms.targetTextureDims.xy;
}
int targetTextureGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (targetTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
fragment sc_FragOut main_frag(sc_FragIn sc_fragIn [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],constant sc_Set1& sc_set1 [[buffer(1)]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]],bool gl_FrontFacing [[front_facing]])
{
sc_fragIn.sc_sysIn.gl_FragCoord=gl_FragCoord;
sc_fragIn.sc_sysIn.gl_FrontFacing=gl_FrontFacing;
sc_FragOut sc_fragOut={};
float4 result=float4(0.0);
float2 param=targetTextureGetDims2D((*sc_set2.UserUniforms));
int param_1=targetTextureLayout;
int param_2=targetTextureGetStereoViewIndex(sc_fragIn.sc_sysIn,sc_set0,sc_set1);
float2 param_3=sc_fragIn.sc_sysIn.varPackedTex.xy;
bool param_4=(int(SC_USE_UV_TRANSFORM_targetTexture)!=0);
float3x3 param_5=(*sc_set2.UserUniforms).targetTextureTransform;
int2 param_6=int2(SC_SOFTWARE_WRAP_MODE_U_targetTexture,SC_SOFTWARE_WRAP_MODE_V_targetTexture);
bool param_7=(int(SC_USE_UV_MIN_MAX_targetTexture)!=0);
float4 param_8=(*sc_set2.UserUniforms).targetTextureUvMinMax;
bool param_9=(int(SC_USE_CLAMP_TO_BORDER_targetTexture)!=0);
float4 param_10=(*sc_set2.UserUniforms).targetTextureBorderColor;
float param_11=0.0;
float4 l9_0=sc_SampleTextureBiasOrLevel(sc_set2.targetTexture,sc_set2.targetTextureSmpSC,param,param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8,param_9,param_10,param_11);
float4 l9_1=l9_0;
float4 targetTextureSample=l9_0;
result=targetTextureSample*(*sc_set2.UserUniforms).gaussianFilterWeights[0];
int index=1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (index<sc_GaussianFilterDataLength)
{
float4 uv=sc_fragIn.sc_sysIn.varPackedTex.xyxy;
#if (sc_GaussianFilterVerticalPass)
{
uv.y+=(*sc_set2.UserUniforms).gaussianFilterOffsets[index];
uv.w-=(*sc_set2.UserUniforms).gaussianFilterOffsets[index];
}
#else
{
uv.x+=(*sc_set2.UserUniforms).gaussianFilterOffsets[index];
uv.z-=(*sc_set2.UserUniforms).gaussianFilterOffsets[index];
}
#endif
float4 a=float4(0.0);
float2 param_12=targetTextureGetDims2D((*sc_set2.UserUniforms));
int param_13=targetTextureLayout;
int param_14=targetTextureGetStereoViewIndex(sc_fragIn.sc_sysIn,sc_set0,sc_set1);
float2 param_15=uv.xy;
bool param_16=(int(SC_USE_UV_TRANSFORM_targetTexture)!=0);
float3x3 param_17=(*sc_set2.UserUniforms).targetTextureTransform;
int2 param_18=int2(SC_SOFTWARE_WRAP_MODE_U_targetTexture,SC_SOFTWARE_WRAP_MODE_V_targetTexture);
bool param_19=(int(SC_USE_UV_MIN_MAX_targetTexture)!=0);
float4 param_20=(*sc_set2.UserUniforms).targetTextureUvMinMax;
bool param_21=(int(SC_USE_CLAMP_TO_BORDER_targetTexture)!=0);
float4 param_22=(*sc_set2.UserUniforms).targetTextureBorderColor;
float param_23=0.0;
float4 l9_2=sc_SampleTextureBiasOrLevel(sc_set2.targetTexture,sc_set2.targetTextureSmpSC,param_12,param_13,param_14,param_15,param_16,param_17,param_18,param_19,param_20,param_21,param_22,param_23);
float4 l9_3=l9_2;
float4 targetTextureSample_1=l9_2;
a=targetTextureSample_1;
float4 b=float4(0.0);
float2 param_24=targetTextureGetDims2D((*sc_set2.UserUniforms));
int param_25=targetTextureLayout;
int param_26=targetTextureGetStereoViewIndex(sc_fragIn.sc_sysIn,sc_set0,sc_set1);
float2 param_27=uv.zw;
bool param_28=(int(SC_USE_UV_TRANSFORM_targetTexture)!=0);
float3x3 param_29=(*sc_set2.UserUniforms).targetTextureTransform;
int2 param_30=int2(SC_SOFTWARE_WRAP_MODE_U_targetTexture,SC_SOFTWARE_WRAP_MODE_V_targetTexture);
bool param_31=(int(SC_USE_UV_MIN_MAX_targetTexture)!=0);
float4 param_32=(*sc_set2.UserUniforms).targetTextureUvMinMax;
bool param_33=(int(SC_USE_CLAMP_TO_BORDER_targetTexture)!=0);
float4 param_34=(*sc_set2.UserUniforms).targetTextureBorderColor;
float param_35=0.0;
float4 l9_4=sc_SampleTextureBiasOrLevel(sc_set2.targetTexture,sc_set2.targetTextureSmpSC,param_24,param_25,param_26,param_27,param_28,param_29,param_30,param_31,param_32,param_33,param_34,param_35);
float4 l9_5=l9_4;
float4 targetTextureSample_2=l9_4;
b=targetTextureSample_2;
result+=((a+b)*(*sc_set2.UserUniforms).gaussianFilterWeights[index]);
index++;
continue;
}
else
{
break;
}
}
float4 param_36=result;
sc_writeFragData0(param_36,sc_fragIn.sc_sysIn,sc_fragOut.sc_sysOut,sc_set0,sc_set1);
return sc_fragOut;
}
} // FRAGMENT SHADER
