#pragma once
#include <metal_stdlib>
#include <simd/simd.h>
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
using namespace metal;
//SG_REFLECTION_BEGIN(100)
//SG_REFLECTION_END

namespace SNAP_VS {
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
#ifndef STRIDE
#define STRIDE 0
#endif
#ifndef OFFSET_POSITION
#define OFFSET_POSITION 0
#endif
#ifndef FORMAT_POSITION
#define FORMAT_POSITION 0
#endif
#ifndef OFFSET_NORMAL
#define OFFSET_NORMAL 0
#endif
#ifndef FORMAT_NORMAL
#define FORMAT_NORMAL 0
#endif
#ifndef OFFSET_TANGENT
#define OFFSET_TANGENT 0
#endif
#ifndef FORMAT_TANGENT
#define FORMAT_TANGENT 0
#endif
#ifndef OFFSET_COLOR
#define OFFSET_COLOR 0
#endif
#ifndef FORMAT_COLOR
#define FORMAT_COLOR 0
#endif
#ifndef OFFSET_TEXTURE0
#define OFFSET_TEXTURE0 0
#endif
#ifndef FORMAT_TEXTURE0
#define FORMAT_TEXTURE0 0
#endif
#ifndef OFFSET_TEXTURE1
#define OFFSET_TEXTURE1 0
#endif
#ifndef FORMAT_TEXTURE1
#define FORMAT_TEXTURE1 0
#endif
#ifndef OFFSET_TEXTURE2
#define OFFSET_TEXTURE2 0
#endif
#ifndef FORMAT_TEXTURE2
#define FORMAT_TEXTURE2 0
#endif
#ifndef OFFSET_TEXTURE3
#define OFFSET_TEXTURE3 0
#endif
#ifndef FORMAT_TEXTURE3
#define FORMAT_TEXTURE3 0
#endif
#ifndef HAS_ANIMATED_PN
#define HAS_ANIMATED_PN 0
#elif HAS_ANIMATED_PN==1
#undef HAS_ANIMATED_PN
#define HAS_ANIMATED_PN 1
#endif
#ifndef SKIP_GRADIENTS_CALCULATION
#define SKIP_GRADIENTS_CALCULATION 0
#elif SKIP_GRADIENTS_CALCULATION==1
#undef SKIP_GRADIENTS_CALCULATION
#define SKIP_GRADIENTS_CALCULATION 1
#endif
#ifndef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 0
#elif sc_ProxyAlphaOne==1
#undef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 1
#endif
float3 DecodeNormal(thread const float2& f)
{
float3 n=float3(f.x,f.y,(1.0-abs(f.x))-abs(f.y));
float t=fast::clamp(-n.z,0.0,1.0);
float l9_0;
if (n.x>=0.0)
{
l9_0=-t;
}
else
{
l9_0=t;
}
float l9_1=l9_0;
float l9_2;
if (n.y>=0.0)
{
l9_2=-t;
}
else
{
l9_2=t;
}
float2 l9_3=n.xy+float2(l9_1,l9_2);
n=float3(l9_3.x,l9_3.y,n.z);
return normalize(n);
}
float2 fetch_float2(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return float2((*sc_set0.layoutVertices)._Vertices[offset],(*sc_set0.layoutVertices)._Vertices[offset+1]);
}
float2 fetch_half2(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return float2(as_type<half2>(as_type<uint>((*sc_set0.layoutVertices)._Vertices[offset])));
}
float3 fetch_half3(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return float3(float2(as_type<half2>(as_type<uint>((*sc_set0.layoutVertices)._Vertices[offset]))),float2(as_type<half2>(as_type<uint>((*sc_set0.layoutVertices)._Vertices[offset+1]))).x);
}
float3 fetch_float3(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return float3((*sc_set0.layoutVertices)._Vertices[offset],(*sc_set0.layoutVertices)._Vertices[offset+1],(*sc_set0.layoutVertices)._Vertices[offset+2]);
}
float3 fetch_float3_animated(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return float3((*sc_set0.layoutVerticesPN)._VerticesPN[offset],(*sc_set0.layoutVerticesPN)._VerticesPN[offset+1],(*sc_set0.layoutVerticesPN)._VerticesPN[offset+2]);
}
float4 fetch_half4(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return float4(float2(as_type<half2>(as_type<uint>((*sc_set0.layoutVertices)._Vertices[offset]))),float2(as_type<half2>(as_type<uint>((*sc_set0.layoutVertices)._Vertices[offset+1]))));
}
float4 fetch_float4(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return float4((*sc_set0.layoutVertices)._Vertices[offset],(*sc_set0.layoutVertices)._Vertices[offset+1],(*sc_set0.layoutVertices)._Vertices[offset+2],(*sc_set0.layoutVertices)._Vertices[offset+3]);
}
float4 fetch_unorm_byte4(thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
uint v=as_type<uint>((*sc_set0.layoutVertices)._Vertices[offset]);
uint x=v&255u;
uint y=(v>>uint(8))&255u;
uint z=(v>>uint(16))&255u;
uint w=(v>>uint(24))&255u;
return float4(float(x),float(y),float(z),float(w))/float4(255.0);
}
float3 interpolate_POSITION(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_POSITION,(indices.y*STRIDE)+OFFSET_POSITION,(indices.z*STRIDE)+OFFSET_POSITION);
#if (FORMAT_POSITION==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float3(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float3(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float3(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_POSITION==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half3(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half3(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half3(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
return float3(1.0,0.0,0.0);
}
float3 interpolate_NORMAL(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_NORMAL,(indices.y*STRIDE)+OFFSET_NORMAL,(indices.z*STRIDE)+OFFSET_NORMAL);
#if (FORMAT_NORMAL==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float3(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float3(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float3(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_NORMAL==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half3(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half3(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half3(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
return float3(1.0,0.0,0.0);
}
float4 interpolate_TANGENT(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_TANGENT,(indices.y*STRIDE)+OFFSET_TANGENT,(indices.z*STRIDE)+OFFSET_TANGENT);
#if (FORMAT_TANGENT==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float4(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float4(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float4(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_TANGENT==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half4(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half4(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half4(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_TANGENT==2)
{
int param_6=vps.x;
int param_7=vps.y;
int param_8=vps.z;
return ((fetch_unorm_byte4(param_6,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_unorm_byte4(param_7,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_unorm_byte4(param_8,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
}
#endif
return float4(1.0,0.0,0.0,0.0);
}
float4 interpolate_COLOR(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_COLOR,(indices.y*STRIDE)+OFFSET_COLOR,(indices.z*STRIDE)+OFFSET_COLOR);
#if (FORMAT_COLOR==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float4(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float4(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float4(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_COLOR==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half4(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half4(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half4(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_COLOR==2)
{
int param_6=vps.x;
int param_7=vps.y;
int param_8=vps.z;
return ((fetch_unorm_byte4(param_6,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_unorm_byte4(param_7,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_unorm_byte4(param_8,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
}
#endif
return float4(1.0,0.0,0.0,0.0);
}
float2 interpolate_TEXTURE0(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_TEXTURE0,(indices.y*STRIDE)+OFFSET_TEXTURE0,(indices.z*STRIDE)+OFFSET_TEXTURE0);
#if (FORMAT_TEXTURE0==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float2(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float2(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float2(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_TEXTURE0==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half2(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half2(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half2(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
return float2(1.0,0.0);
}
float2 interpolate_TEXTURE1(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_TEXTURE1,(indices.y*STRIDE)+OFFSET_TEXTURE1,(indices.z*STRIDE)+OFFSET_TEXTURE1);
#if (FORMAT_TEXTURE1==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float2(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float2(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float2(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_TEXTURE1==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half2(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half2(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half2(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
return float2(1.0,0.0);
}
float2 interpolate_TEXTURE2(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_TEXTURE2,(indices.y*STRIDE)+OFFSET_TEXTURE2,(indices.z*STRIDE)+OFFSET_TEXTURE2);
#if (FORMAT_TEXTURE2==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float2(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float2(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float2(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_TEXTURE2==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half2(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half2(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half2(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
return float2(1.0,0.0);
}
float2 interpolate_TEXTURE3(thread const float3& brc,thread const int3& indices,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=int3((indices.x*STRIDE)+OFFSET_TEXTURE3,(indices.y*STRIDE)+OFFSET_TEXTURE3,(indices.z*STRIDE)+OFFSET_TEXTURE3);
#if (FORMAT_TEXTURE3==5)
{
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float2(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float2(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float2(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#else
{
#if (FORMAT_TEXTURE3==6)
{
int param_3=vps.x;
int param_4=vps.y;
int param_5=vps.z;
return ((fetch_half2(param_3,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_half2(param_4,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_half2(param_5,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
#endif
}
#endif
return float2(1.0,0.0);
}
float3 interp_float3_animated(thread const float3& brc,thread const int3& indices,thread const int& offset,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int3 vps=(indices*int3(6))+int3(offset);
int param=vps.x;
int param_1=vps.y;
int param_2=vps.z;
return ((fetch_float3_animated(param,sc_sysIn,sc_set0,sc_set1)*brc.x)+(fetch_float3_animated(param_1,sc_sysIn,sc_set0,sc_set1)*brc.y))+(fetch_float3_animated(param_2,sc_sysIn,sc_set0,sc_set1)*brc.z);
}
int3 get_indices(thread const uint& primitiveId,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
uint primId=min(primitiveId,uint((*sc_set0.LibraryUniforms).lray_triangles_last));
uint offset=primId*6u;
uint load_offset=offset&4294967292u;
uint4 t=(uint4(uint2((*sc_set0.layoutIndices)._Triangles[load_offset/4u]),uint2((*sc_set0.layoutIndices)._Triangles[(load_offset/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_0;
if (offset==load_offset)
{
l9_0=int3(t.xyz);
}
else
{
l9_0=int3(t.yzw);
}
return l9_0;
}
RayHitPayload GetHitData(thread const int2& screenPos,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int2 param=screenPos;
uint4 id_and_barycentric=lray_readHitIdAndBarycentric(param,sc_sysIn,sc_set0,sc_set1);
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint((*sc_set0.LibraryUniforms).instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=sc_set0.z_rayDirections.read(uint2(screenPos),0).xy;
float3 rayDir=DecodeNormal(param_1);
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
int3 i=get_indices(param_2,sc_sysIn,sc_set0,sc_set1);
#if (HAS_ANIMATED_PN)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
rhp.positionWS=interp_float3_animated(param_3,param_4,param_5,sc_sysIn,sc_set0,sc_set1);
}
#else
{
float3 param_6=brc;
int3 param_7=i;
float3 positionOS=interpolate_POSITION(param_6,param_7,sc_sysIn,sc_set0,sc_set1);
rhp.positionWS=((*sc_set0.LibraryUniforms).sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
#endif
#if (OFFSET_NORMAL>0)
{
#if (HAS_ANIMATED_PN)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
rhp.normalWS=interp_float3_animated(param_8,param_9,param_10,sc_sysIn,sc_set0,sc_set1);
}
#else
{
float3 param_11=brc;
int3 param_12=i;
float3 normalOS=interpolate_NORMAL(param_11,param_12,sc_sysIn,sc_set0,sc_set1);
rhp.normalWS=normalize((*sc_set0.LibraryUniforms).sc_NormalMatrix*normalOS);
}
#endif
}
#else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
#endif
#if ((!HAS_ANIMATED_PN)&&(OFFSET_TANGENT>0))
{
float3 param_13=brc;
int3 param_14=i;
float4 tangentOS=interpolate_TANGENT(param_13,param_14,sc_sysIn,sc_set0,sc_set1);
float3 tangentWS=normalize((*sc_set0.LibraryUniforms).sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
#else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
#endif
#if (FORMAT_COLOR>0)
{
float3 param_15=brc;
int3 param_16=i;
rhp.color=interpolate_COLOR(param_15,param_16,sc_sysIn,sc_set0,sc_set1);
}
#endif
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
#if (FORMAT_TEXTURE0>0)
{
float3 param_17=brc;
int3 param_18=i;
rhp.uv0=interpolate_TEXTURE0(param_17,param_18,sc_sysIn,sc_set0,sc_set1);
}
#else
{
rhp.uv0=dummy_red_black;
}
#endif
#if (FORMAT_TEXTURE1>0)
{
float3 param_19=brc;
int3 param_20=i;
rhp.uv1=interpolate_TEXTURE1(param_19,param_20,sc_sysIn,sc_set0,sc_set1);
}
#else
{
rhp.uv1=dummy_red_black;
}
#endif
#if (FORMAT_TEXTURE2>0)
{
float3 param_21=brc;
int3 param_22=i;
rhp.uv2=interpolate_TEXTURE2(param_21,param_22,sc_sysIn,sc_set0,sc_set1);
}
#else
{
rhp.uv2=dummy_red_black;
}
#endif
#if (FORMAT_TEXTURE3>0)
{
float3 param_23=brc;
int3 param_24=i;
rhp.uv3=interpolate_TEXTURE3(param_23,param_24,sc_sysIn,sc_set0,sc_set1);
}
#else
{
rhp.uv3=dummy_red_black;
}
#endif
return rhp;
}
RayHitPayload GetRayTracingHitData(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int2 param=int2(sc_GetGlFragCoord(sc_sysIn,sc_set0,sc_set1).xy);
return GetHitData(param,sc_sysIn,sc_set0,sc_set1);
}
float4 CalculateTextureGradients(thread const RayHitPayload& rhp0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (SKIP_GRADIENTS_CALCULATION)
{
return float4(0.0);
}
#endif
int2 screenPos=int2(sc_GetGlFragCoord(sc_sysIn,sc_set0,sc_set1).xy);
int2 param=screenPos+int2(1,0);
RayHitPayload rhp_x=GetHitData(param,sc_sysIn,sc_set0,sc_set1);
int2 param_1=screenPos+int2(0,1);
RayHitPayload rhp_y=GetHitData(param_1,sc_sysIn,sc_set0,sc_set1);
if (any(rhp_x.id!=rhp0.id))
{
int2 param_2=screenPos-int2(1,0);
rhp_x=GetHitData(param_2,sc_sysIn,sc_set0,sc_set1);
}
if (any(rhp_y.id!=rhp0.id))
{
int2 param_3=screenPos-int2(0,1);
rhp_y=GetHitData(param_3,sc_sysIn,sc_set0,sc_set1);
}
float2 l9_0;
if (any(rhp_x.id!=rhp0.id))
{
l9_0=float2(0.0);
}
else
{
l9_0=rhp_x.uv0-rhp0.uv0;
}
float2 duv_dx=l9_0;
float2 l9_1;
if (any(rhp_y.id!=rhp0.id))
{
l9_1=float2(0.0);
}
else
{
l9_1=rhp_y.uv0-rhp0.uv0;
}
float2 duv_dy=l9_1;
return float4(duv_dx,duv_dy);
}
float3 CalculateProxyFaceNormal(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
int2 screenPos=int2(sc_GetGlFragCoord(sc_sysIn,sc_set0,sc_set1).xy);
int2 param=screenPos;
uint4 id_and_barycentric=lray_readHitIdAndBarycentric(param,sc_sysIn,sc_set0,sc_set1);
if (id_and_barycentric.x!=uint((*sc_set0.LibraryUniforms).instance_id))
{
return float3(0.0,1.0,0.0);
}
uint param_1=id_and_barycentric.y;
int3 i=get_indices(param_1,sc_sysIn,sc_set0,sc_set1);
float3 pos0;
float3 pos1;
float3 pos2;
#if (HAS_ANIMATED_PN)
{
int param_2=i.x*6;
pos0=fetch_float3_animated(param_2,sc_sysIn,sc_set0,sc_set1);
int param_3=i.y*6;
pos1=fetch_float3_animated(param_3,sc_sysIn,sc_set0,sc_set1);
int param_4=i.z*6;
pos2=fetch_float3_animated(param_4,sc_sysIn,sc_set0,sc_set1);
}
#else
{
#if (FORMAT_POSITION==5)
{
int param_5=(i.x*STRIDE)+OFFSET_POSITION;
pos0=fetch_float3(param_5,sc_sysIn,sc_set0,sc_set1);
int param_6=(i.y*STRIDE)+OFFSET_POSITION;
pos1=fetch_float3(param_6,sc_sysIn,sc_set0,sc_set1);
int param_7=(i.z*STRIDE)+OFFSET_POSITION;
pos2=fetch_float3(param_7,sc_sysIn,sc_set0,sc_set1);
}
#else
{
#if (FORMAT_POSITION==6)
{
int param_8=(i.x*STRIDE)+OFFSET_POSITION;
pos0=fetch_half3(param_8,sc_sysIn,sc_set0,sc_set1);
int param_9=(i.y*STRIDE)+OFFSET_POSITION;
pos1=fetch_half3(param_9,sc_sysIn,sc_set0,sc_set1);
int param_10=(i.z*STRIDE)+OFFSET_POSITION;
pos2=fetch_half3(param_10,sc_sysIn,sc_set0,sc_set1);
}
#else
{
return float3(0.0,1.0,0.0);
}
#endif
}
#endif
}
#endif
float3 faceNormalOS=cross(pos1-pos0,pos2-pos0);
float3 faceNormalWS=normalize((*sc_set0.LibraryUniforms).sc_NormalMatrix*faceNormalOS);
return faceNormalWS;
}
float4 encodeReflection(thread float4& color)
{
#if (sc_ProxyAlphaOne)
{
color.w=1.0;
}
#endif
return fast::max(color,float4(0.0));
}
} // FRAGMENT SHADER
