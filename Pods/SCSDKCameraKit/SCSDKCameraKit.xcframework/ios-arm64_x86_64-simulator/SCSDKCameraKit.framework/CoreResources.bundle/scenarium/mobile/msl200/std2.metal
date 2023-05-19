#pragma once
#include <metal_stdlib>
#include <simd/simd.h>
#include "required2.metal"
#include "std2_texture.metal"
using namespace metal;
//SG_REFLECTION_BEGIN(100)
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Normal 14
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler sc_EnvmapDiffuseSmpSC 0:11
//sampler sampler sc_EnvmapSpecularSmpSC 0:12
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:13
//sampler sampler sc_ScreenTextureSmpSC 0:14
//sampler sampler sc_ShadowTextureSmpSC 0:15
//sampler sampler sc_StrandDataMapTextureSmpSC 0:16
//sampler sampler z_hitIdAndBarycentricSmp 0:17
//sampler sampler z_rayDirectionsSmpSC 0:18
//texture texture2D sc_EnvmapDiffuse 0:3:0:11
//texture texture2D sc_EnvmapSpecular 0:4:0:12
//texture texture2D sc_RayTracedReflectionTexture 0:5:0:13
//texture texture2D sc_ScreenTexture 0:6:0:14
//texture texture2D sc_ShadowTexture 0:7:0:15
//texture texture2D sc_StrandDataMapTexture 0:8:0:16
//texture utexture2D z_hitIdAndBarycentric 0:9:0:17
//texture texture2D z_rayDirections 0:10:0:18
//ubo int LibraryUniforms 0:19 {
//sc_PointLight_t sc_PointLights 0:[]:64
//int sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.angleScale 8
//float sc_PointLights.angleOffset 12
//float3 sc_PointLights.direction 16
//float3 sc_PointLights.position 32
//float4 sc_PointLights.color 48
//sc_DirectionalLight_t sc_DirectionalLights :[]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights :[]:16
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 12
//sc_LightEstimationData_t sc_LightEstimationData
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:32
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 12
//float3 sc_LightEstimationData.sg.axis 16
//float3 sc_LightEstimationData.ambientLight 384
//float4 sc_EnvmapDiffuseSize
//float4 sc_EnvmapDiffuseDims
//float4 sc_EnvmapDiffuseView
//float4 sc_EnvmapSpecularSize
//float4 sc_EnvmapSpecularDims
//float4 sc_EnvmapSpecularView
//float3 sc_EnvmapRotation
//float sc_EnvmapExposure
//float3 sc_Sh :[9]:16
//float sc_ShIntensity
//float4 sc_Time
//float4 sc_UniformConstants
//float4 sc_GeometryInfo
//float4x4 sc_ModelViewProjectionMatrixArray :[]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray :[]:64
//float4x4 sc_ViewProjectionMatrixArray :[]:64
//float4x4 sc_ViewProjectionMatrixInverseArray :[]:64
//float4x4 sc_ModelViewMatrixArray :[]:64
//float4x4 sc_ModelViewMatrixInverseArray :[]:64
//float3x3 sc_ViewNormalMatrixArray :[]:48
//float3x3 sc_ViewNormalMatrixInverseArray :[]:48
//float4x4 sc_ProjectionMatrixArray :[]:64
//float4x4 sc_ProjectionMatrixInverseArray :[]:64
//float4x4 sc_ViewMatrixArray :[]:64
//float4x4 sc_ViewMatrixInverseArray :[]:64
//float4x4 sc_ModelMatrix
//float4x4 sc_ModelMatrixInverse
//float3x3 sc_NormalMatrix
//float3x3 sc_NormalMatrixInverse
//float3 sc_LocalAabbMin
//float3 sc_LocalAabbMax
//float3 sc_WorldAabbMin
//float3 sc_WorldAabbMax
//float4 sc_WindowToViewportTransform
//sc_Camera_t sc_Camera
//float3 sc_Camera.position 0
//float sc_Camera.aspect 12
//float2 sc_Camera.clipPlanes 16
//float sc_ShadowDensity
//float4 sc_ShadowColor
//float4x4 sc_ProjectorMatrix
//float _sc_GetFramebufferColorInvalidUsageMarker
//float shaderComplexityValue
//float sc_DisableFrustumCullingMarker
//float4 sc_BoneMatrices :[]:16
//float3x3 sc_SkinBonesNormalMatrices :[]:48
//float4 weights0
//float4 weights1
//float4 weights2
//float4 sc_StereoClipPlanes :[]:16
//int sc_FallbackInstanceID
//float _sc_framebufferFetchMarker
//float2 sc_TAAJitterOffset
//float strandWidth
//float strandTaper
//float4 sc_StrandDataMapTextureSize
//float4 sc_StrandDataMapTextureDims
//float4 sc_StrandDataMapTextureView
//float clumpInstanceCount
//float clumpRadius
//float clumpTipScale
//float hairstyleInstanceCount
//float hairstyleNoise
//float4 sc_ScreenTextureSize
//float4 sc_ScreenTextureDims
//float4 sc_ScreenTextureView
//float4 sc_ShadowTextureSize
//float4 sc_ShadowTextureDims
//float4 sc_ShadowTextureView
//int receivesRayTracedReflections
//float4 sc_RayTracedReflectionTextureSize
//float4 sc_RayTracedReflectionTextureDims
//float4 sc_RayTracedReflectionTextureView
//int isProxyMode
//float receiver_mask
//float3 OriginNormalizationScale
//float3 OriginNormalizationScaleInv
//float3 OriginNormalizationOffset
//int ray_siever
//int instance_id
//int lray_triangles_last
//int noEarlyZ
//int has_animated_pn
//int emitter_stride
//int proxy_offset_position
//int proxy_offset_normal
//int proxy_offset_tangent
//int proxy_offset_color
//int proxy_offset_texture0
//int proxy_offset_texture1
//int proxy_offset_texture2
//int proxy_offset_texture3
//int proxy_format_position
//int proxy_format_normal
//int proxy_format_tangent
//int proxy_format_color
//int proxy_format_texture0
//int proxy_format_texture1
//int proxy_format_texture2
//int proxy_format_texture3
//float4 z_rayDirectionsSize
//float4 z_rayDirectionsDims
//float4 z_rayDirectionsView
//}
//ssbo int layoutIndices 0:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVertices 0:1:4 {
//float _Vertices 0:[]:4
//}
//ssbo float layoutVerticesPN 0:2:4 {
//float _VerticesPN 0:[]:4
//}
//SG_REFLECTION_END

namespace SNAP_VS {
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
struct libraryUniformsObj
{
sc_PointLight_t sc_PointLights[sc_PointLightsCount+1];
sc_DirectionalLight_t sc_DirectionalLights[sc_DirectionalLightsCount+1];
sc_AmbientLight_t sc_AmbientLights[sc_AmbientLightsCount+1];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
float4x4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
float4x4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ModelViewMatrixArray[sc_NumStereoViews];
float4x4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
float3x3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
float3x3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ProjectionMatrixArray[sc_NumStereoViews];
float4x4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ViewMatrixArray[sc_NumStereoViews];
float4x4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 sc_BoneMatrices[(sc_SkinBonesCount*3)+1];
float3x3 sc_SkinBonesNormalMatrices[sc_SkinBonesCount+1];
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[sc_NumStereoViews];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float4 sc_StrandDataMapTextureDims;
float4 sc_StrandDataMapTextureView;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 sc_ShadowTextureSize;
float4 sc_ShadowTextureDims;
float4 sc_ShadowTextureView;
int receivesRayTracedReflections;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
int isProxyMode;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int ray_siever;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
};
#ifndef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 0
#elif sc_EnvmapDiffuseHasSwappedViews==1
#undef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 1
#endif
#ifndef sc_EnvmapDiffuseLayout
#define sc_EnvmapDiffuseLayout 0
#endif
#ifndef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 0
#elif sc_EnvmapSpecularHasSwappedViews==1
#undef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 1
#endif
#ifndef sc_EnvmapSpecularLayout
#define sc_EnvmapSpecularLayout 0
#endif
#ifndef sc_StrandDataMapTextureHasSwappedViews
#define sc_StrandDataMapTextureHasSwappedViews 0
#elif sc_StrandDataMapTextureHasSwappedViews==1
#undef sc_StrandDataMapTextureHasSwappedViews
#define sc_StrandDataMapTextureHasSwappedViews 1
#endif
#ifndef sc_StrandDataMapTextureLayout
#define sc_StrandDataMapTextureLayout 0
#endif
#ifndef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 0
#elif sc_ScreenTextureHasSwappedViews==1
#undef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 1
#endif
#ifndef sc_ScreenTextureLayout
#define sc_ScreenTextureLayout 0
#endif
#ifndef sc_ShadowTextureHasSwappedViews
#define sc_ShadowTextureHasSwappedViews 0
#elif sc_ShadowTextureHasSwappedViews==1
#undef sc_ShadowTextureHasSwappedViews
#define sc_ShadowTextureHasSwappedViews 1
#endif
#ifndef sc_ShadowTextureLayout
#define sc_ShadowTextureLayout 0
#endif
#ifndef sc_RayTracedReflectionTextureHasSwappedViews
#define sc_RayTracedReflectionTextureHasSwappedViews 0
#elif sc_RayTracedReflectionTextureHasSwappedViews==1
#undef sc_RayTracedReflectionTextureHasSwappedViews
#define sc_RayTracedReflectionTextureHasSwappedViews 1
#endif
#ifndef sc_RayTracedReflectionTextureLayout
#define sc_RayTracedReflectionTextureLayout 0
#endif
#ifndef z_rayDirectionsHasSwappedViews
#define z_rayDirectionsHasSwappedViews 0
#elif z_rayDirectionsHasSwappedViews==1
#undef z_rayDirectionsHasSwappedViews
#define z_rayDirectionsHasSwappedViews 1
#endif
#ifndef z_rayDirectionsLayout
#define z_rayDirectionsLayout 0
#endif
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
#endif
#ifndef sc_RenderingSpace
#define sc_RenderingSpace -1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 0
#elif SC_GL_FRAGMENT_PRECISION_HIGH==1
#undef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef sc_FragDataCount
#define sc_FragDataCount 0
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_AmbientLightMode0
#define sc_AmbientLightMode0 0
#endif
#ifndef sc_AmbientLightMode1
#define sc_AmbientLightMode1 0
#endif
#ifndef sc_AmbientLightMode2
#define sc_AmbientLightMode2 0
#endif
#ifndef sc_AmbientLightMode_Constant
#define sc_AmbientLightMode_Constant 0
#endif
#ifndef sc_AmbientLightMode_SphericalHarmonics
#define sc_AmbientLightMode_SphericalHarmonics 0
#endif
#ifndef sc_AmbientLightMode_EnvironmentMap
#define sc_AmbientLightMode_EnvironmentMap 0
#endif
#ifndef sc_AmbientLightMode_FromCamera
#define sc_AmbientLightMode_FromCamera 0
#endif
#ifndef sc_EnvLightMode
#define sc_EnvLightMode 0
#endif
#ifndef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 0
#elif sc_RenderAlphaToColor==1
#undef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
#endif
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
#endif
#ifndef sc_MaxTextureImageUnits
#define sc_MaxTextureImageUnits 0
#endif
#ifndef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 0
#elif sc_HasDiffuseEnvmap==1
#undef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 1
#endif
#ifndef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 0
#elif sc_ShaderComplexityAnalyzer==1
#undef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_OITDepthPrepass
#define sc_OITDepthPrepass 0
#elif sc_OITDepthPrepass==1
#undef sc_OITDepthPrepass
#define sc_OITDepthPrepass 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 0
#elif sc_OITFrontLayerPass==1
#undef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 1
#endif
#ifndef sc_OITMaxLayers4
#define sc_OITMaxLayers4 0
#elif sc_OITMaxLayers4==1
#undef sc_OITMaxLayers4
#define sc_OITMaxLayers4 1
#endif
#ifndef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 0
#elif sc_OITMaxLayers4Plus1==1
#undef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 1
#endif
#ifndef sc_OITMaxLayers8
#define sc_OITMaxLayers8 0
#elif sc_OITMaxLayers8==1
#undef sc_OITMaxLayers8
#define sc_OITMaxLayers8 1
#endif
#ifndef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 0
#elif sc_OITMaxLayersVisualizeLayerCount==1
#undef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 1
#endif
#ifndef sc_BlendMode_Disabled
#define sc_BlendMode_Disabled 0
#elif sc_BlendMode_Disabled==1
#undef sc_BlendMode_Disabled
#define sc_BlendMode_Disabled 1
#endif
#ifndef sc_BlendMode_Normal
#define sc_BlendMode_Normal 0
#elif sc_BlendMode_Normal==1
#undef sc_BlendMode_Normal
#define sc_BlendMode_Normal 1
#endif
#ifndef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 0
#elif sc_BlendMode_Multiply==1
#undef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 1
#endif
#ifndef sc_BlendMode_Add
#define sc_BlendMode_Add 0
#elif sc_BlendMode_Add==1
#undef sc_BlendMode_Add
#define sc_BlendMode_Add 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 0
#elif sc_BlendMode_PremultipliedAlpha==1
#undef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 1
#endif
#ifndef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 0
#elif sc_BlendMode_AlphaToCoverage==1
#undef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 1
#endif
#ifndef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 0
#elif sc_BlendMode_MultiplyOriginal==1
#undef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 1
#endif
#ifndef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 0
#elif sc_BlendMode_AddWithAlphaFactor==1
#undef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 1
#endif
#ifndef sc_BlendMode_Min
#define sc_BlendMode_Min 0
#elif sc_BlendMode_Min==1
#undef sc_BlendMode_Min
#define sc_BlendMode_Min 1
#endif
#ifndef sc_BlendMode_Max
#define sc_BlendMode_Max 0
#elif sc_BlendMode_Max==1
#undef sc_BlendMode_Max
#define sc_BlendMode_Max 1
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
#endif
#ifndef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 0
#elif sc_BlendMode_ColoredGlass==1
#undef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 0
#elif sc_BlendMode_PremultipliedAlphaHardware==1
#undef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 1
#endif
#ifndef sc_BlendMode_Custom
#define sc_BlendMode_Custom 0
#elif sc_BlendMode_Custom==1
#undef sc_BlendMode_Custom
#define sc_BlendMode_Custom 1
#endif
#ifndef sc_BlendMode_Software
#define sc_BlendMode_Software 0
#elif sc_BlendMode_Software==1
#undef sc_BlendMode_Software
#define sc_BlendMode_Software 1
#endif
#ifndef sc_BlendMode_Hardware
#define sc_BlendMode_Hardware 0
#elif sc_BlendMode_Hardware==1
#undef sc_BlendMode_Hardware
#define sc_BlendMode_Hardware 1
#endif
#ifndef sc_LightEstimation
#define sc_LightEstimation 0
#elif sc_LightEstimation==1
#undef sc_LightEstimation
#define sc_LightEstimation 1
#endif
#ifndef sc_LightEstimationSGCount
#define sc_LightEstimationSGCount 0
#endif
#ifndef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 0
#elif sc_ProxyAlphaOne==1
#undef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 1
#endif
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
texture2d<float> sc_EnvmapDiffuse [[id(3)]];
texture2d<float> sc_EnvmapSpecular [[id(4)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(5)]];
texture2d<float> sc_ScreenTexture [[id(6)]];
texture2d<float> sc_ShadowTexture [[id(7)]];
texture2d<float> sc_StrandDataMapTexture [[id(8)]];
texture2d<uint> z_hitIdAndBarycentric [[id(9)]];
texture2d<float> z_rayDirections [[id(10)]];
sampler sc_EnvmapDiffuseSmpSC [[id(11)]];
sampler sc_EnvmapSpecularSmpSC [[id(12)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(13)]];
sampler sc_ScreenTextureSmpSC [[id(14)]];
sampler sc_ShadowTextureSmpSC [[id(15)]];
sampler sc_StrandDataMapTextureSmpSC [[id(16)]];
sampler z_hitIdAndBarycentricSmp [[id(17)]];
sampler z_rayDirectionsSmpSC [[id(18)]];
constant libraryUniformsObj* LibraryUniforms [[id(19)]];
};
struct sc_Set1 { };
struct sc_SysOut
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 gl_Position [[position]];
};
struct sc_SysAttributes
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
};
struct sc_SysIn
{
  sc_SysAttributes sc_sysAttributes;
  int gl_VertexIndex;
  int gl_InstanceIndex;
};
int sc_GetStereoViewIndex()
{
#if (sc_StereoRenderingMode==0)
{
return 0;
}
#else
{
return sc_StereoViewID;
}
#endif
}
float2 sc_SamplingCoordsGlobalToView(thread float3& uvi,thread const int& renderingLayout,thread const int& viewIndex)
{
if (renderingLayout==1)
{
uvi.y=((2.0*uvi.y)+float(viewIndex))-1.0;
}
return uvi.xy;
}
float2 sc_ScreenCoordsGlobalToView(thread const float2& uv)
{
#if (sc_StereoRenderingMode==1)
{
float3 uvi=float3(uv,0.0);
int instancedClippedLayout=1;
int viewIndex=sc_GetStereoViewIndex();
float3 param=float3(uv,0.0);
int param_1=instancedClippedLayout;
int param_2=viewIndex;
float2 l9_0=sc_SamplingCoordsGlobalToView(param,param_1,param_2);
return l9_0;
}
#else
{
return uv;
}
#endif
}
float2 sc_EnvmapDiffuseGetDims2D(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_EnvmapDiffuseDims.xy;
}
int sc_EnvmapDiffuseGetStereoViewIndex()
{
#if (sc_EnvmapDiffuseHasSwappedViews)
{
return 1-sc_GetStereoViewIndex();
}
#else
{
return sc_GetStereoViewIndex();
}
#endif
}
float4 sc_EnvmapDiffuseSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapDiffuseGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapDiffuseLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapDiffuseSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
float param_1=bias0;
return sc_EnvmapDiffuseSampleLevel(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapDiffuseSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapDiffuseGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapDiffuseLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapDiffuseSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapDiffuseGetStereoViewIndex();
float param_2=level;
return sc_EnvmapDiffuseSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_EnvmapDiffuseSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=bias0;
return sc_EnvmapDiffuseSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapDiffuseSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapDiffuseGetStereoViewIndex();
float param_2=bias0;
return sc_EnvmapDiffuseSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_EnvmapDiffuseSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_EnvmapDiffuseSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_EnvmapDiffuseSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapDiffuseGetStereoViewIndex();
return sc_EnvmapDiffuseSampleViewIndex(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float2 sc_EnvmapSpecularGetDims2D(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_EnvmapSpecularDims.xy;
}
int sc_EnvmapSpecularGetStereoViewIndex()
{
#if (sc_EnvmapSpecularHasSwappedViews)
{
return 1-sc_GetStereoViewIndex();
}
#else
{
return sc_GetStereoViewIndex();
}
#endif
}
float4 sc_EnvmapSpecularSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapSpecularGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapSpecularLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapSpecularSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
float param_1=bias0;
return sc_EnvmapSpecularSampleLevel(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapSpecularSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapSpecularGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapSpecularLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapSpecularSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapSpecularGetStereoViewIndex();
float param_2=level;
return sc_EnvmapSpecularSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_EnvmapSpecularSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=bias0;
return sc_EnvmapSpecularSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapSpecularSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapSpecularGetStereoViewIndex();
float param_2=bias0;
return sc_EnvmapSpecularSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_EnvmapSpecularSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_EnvmapSpecularSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_EnvmapSpecularSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapSpecularGetStereoViewIndex();
return sc_EnvmapSpecularSampleViewIndex(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float2 sc_StrandDataMapTextureGetDims2D(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_StrandDataMapTextureDims.xy;
}
int sc_StrandDataMapTextureGetStereoViewIndex()
{
#if (sc_StrandDataMapTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex();
}
#else
{
return sc_GetStereoViewIndex();
}
#endif
}
float4 sc_StrandDataMapTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_StrandDataMapTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_StrandDataMapTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_StrandDataMapTexture,sc_set0.sc_StrandDataMapTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_StrandDataMapTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
float param_1=bias0;
return sc_StrandDataMapTextureSampleLevel(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_StrandDataMapTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_StrandDataMapTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_StrandDataMapTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_StrandDataMapTexture,sc_set0.sc_StrandDataMapTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_StrandDataMapTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_StrandDataMapTextureGetStereoViewIndex();
float param_2=level;
return sc_StrandDataMapTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_StrandDataMapTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=bias0;
return sc_StrandDataMapTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_StrandDataMapTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_StrandDataMapTextureGetStereoViewIndex();
float param_2=bias0;
return sc_StrandDataMapTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_StrandDataMapTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_StrandDataMapTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_StrandDataMapTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_StrandDataMapTextureGetStereoViewIndex();
return sc_StrandDataMapTextureSampleViewIndex(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float2 sc_ScreenTextureGetDims2D(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_ScreenTextureDims.xy;
}
int sc_ScreenTextureGetStereoViewIndex()
{
#if (sc_ScreenTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex();
}
#else
{
return sc_GetStereoViewIndex();
}
#endif
}
float4 sc_ScreenTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ScreenTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ScreenTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ScreenTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
float param_1=bias0;
return sc_ScreenTextureSampleLevel(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ScreenTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ScreenTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ScreenTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ScreenTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ScreenTextureGetStereoViewIndex();
float param_2=level;
return sc_ScreenTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_ScreenTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=bias0;
return sc_ScreenTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ScreenTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ScreenTextureGetStereoViewIndex();
float param_2=bias0;
return sc_ScreenTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_ScreenTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_ScreenTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_ScreenTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ScreenTextureGetStereoViewIndex();
return sc_ScreenTextureSampleViewIndex(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float2 sc_ShadowTextureGetDims2D(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_ShadowTextureDims.xy;
}
int sc_ShadowTextureGetStereoViewIndex()
{
#if (sc_ShadowTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex();
}
#else
{
return sc_GetStereoViewIndex();
}
#endif
}
float4 sc_ShadowTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ShadowTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ShadowTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ShadowTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
float param_1=bias0;
return sc_ShadowTextureSampleLevel(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ShadowTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ShadowTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ShadowTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ShadowTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ShadowTextureGetStereoViewIndex();
float param_2=level;
return sc_ShadowTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_ShadowTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=bias0;
return sc_ShadowTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ShadowTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ShadowTextureGetStereoViewIndex();
float param_2=bias0;
return sc_ShadowTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_ShadowTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_ShadowTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_ShadowTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ShadowTextureGetStereoViewIndex();
return sc_ShadowTextureSampleViewIndex(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
bool ReceivesRayTracedReflections(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).receivesRayTracedReflections!=0;
}
float2 sc_RayTracedReflectionTextureGetDims2D(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_RayTracedReflectionTextureDims.xy;
}
int sc_RayTracedReflectionTextureGetStereoViewIndex()
{
#if (sc_RayTracedReflectionTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex();
}
#else
{
return sc_GetStereoViewIndex();
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_RayTracedReflectionTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_RayTracedReflectionTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
float param_1=bias0;
return sc_RayTracedReflectionTextureSampleLevel(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_RayTracedReflectionTextureGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_RayTracedReflectionTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_RayTracedReflectionTextureGetStereoViewIndex();
float param_2=level;
return sc_RayTracedReflectionTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_RayTracedReflectionTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=bias0;
return sc_RayTracedReflectionTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_RayTracedReflectionTextureGetStereoViewIndex();
float param_2=bias0;
return sc_RayTracedReflectionTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_RayTracedReflectionTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_RayTracedReflectionTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 sc_RayTracedReflectionTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_RayTracedReflectionTextureGetStereoViewIndex();
return sc_RayTracedReflectionTextureSampleViewIndex(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
bool IsProxyMode(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).isProxyMode!=0;
}
bool NoEarlyZ(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).noEarlyZ!=0;
}
float2 z_rayDirectionsGetDims2D(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).z_rayDirectionsDims.xy;
}
int z_rayDirectionsGetStereoViewIndex()
{
#if (z_rayDirectionsHasSwappedViews)
{
return 1-sc_GetStereoViewIndex();
}
#else
{
return sc_GetStereoViewIndex();
}
#endif
}
float4 z_rayDirectionsSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=z_rayDirectionsGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=z_rayDirectionsLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 z_rayDirectionsSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
float param_1=bias0;
return z_rayDirectionsSampleLevel(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 z_rayDirectionsSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=z_rayDirectionsGetDims2D(sc_sysIn,sc_sysOut,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=z_rayDirectionsLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 z_rayDirectionsSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=z_rayDirectionsGetStereoViewIndex();
float param_2=level;
return z_rayDirectionsSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 z_rayDirectionsSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=bias0;
return z_rayDirectionsSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
#else
{
return float4(0.0);
}
#endif
}
float4 z_rayDirectionsSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=z_rayDirectionsGetStereoViewIndex();
float param_2=bias0;
return z_rayDirectionsSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 z_rayDirectionsSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return z_rayDirectionsSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
float4 z_rayDirectionsSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=z_rayDirectionsGetStereoViewIndex();
return z_rayDirectionsSampleViewIndex(param,param_1,sc_sysIn,sc_sysOut,sc_set0,sc_set1);
}
uint4 lray_readHitIdAndBarycentric(thread const int2& screenPos,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return sc_set0.z_hitIdAndBarycentric.read(uint2(screenPos),0);
}
void sc_SetGlPosition(thread const float4& pos,thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
sc_sysOut.gl_Position=pos;
}
int sc_GetGlVertexIndex(thread sc_SysIn& sc_sysIn,thread sc_SysOut& sc_sysOut,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return sc_sysIn.gl_VertexIndex;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
struct libraryUniformsObj
{
sc_PointLight_t sc_PointLights[sc_PointLightsCount+1];
sc_DirectionalLight_t sc_DirectionalLights[sc_DirectionalLightsCount+1];
sc_AmbientLight_t sc_AmbientLights[sc_AmbientLightsCount+1];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
float4x4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
float4x4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ModelViewMatrixArray[sc_NumStereoViews];
float4x4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
float3x3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
float3x3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ProjectionMatrixArray[sc_NumStereoViews];
float4x4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ViewMatrixArray[sc_NumStereoViews];
float4x4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 sc_BoneMatrices[(sc_SkinBonesCount*3)+1];
float3x3 sc_SkinBonesNormalMatrices[sc_SkinBonesCount+1];
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[sc_NumStereoViews];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float4 sc_StrandDataMapTextureDims;
float4 sc_StrandDataMapTextureView;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 sc_ShadowTextureSize;
float4 sc_ShadowTextureDims;
float4 sc_ShadowTextureView;
int receivesRayTracedReflections;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
int isProxyMode;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int ray_siever;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
};
#ifndef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 0
#elif sc_EnvmapDiffuseHasSwappedViews==1
#undef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 1
#endif
#ifndef sc_EnvmapDiffuseLayout
#define sc_EnvmapDiffuseLayout 0
#endif
#ifndef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 0
#elif sc_EnvmapSpecularHasSwappedViews==1
#undef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 1
#endif
#ifndef sc_EnvmapSpecularLayout
#define sc_EnvmapSpecularLayout 0
#endif
#ifndef sc_StrandDataMapTextureHasSwappedViews
#define sc_StrandDataMapTextureHasSwappedViews 0
#elif sc_StrandDataMapTextureHasSwappedViews==1
#undef sc_StrandDataMapTextureHasSwappedViews
#define sc_StrandDataMapTextureHasSwappedViews 1
#endif
#ifndef sc_StrandDataMapTextureLayout
#define sc_StrandDataMapTextureLayout 0
#endif
#ifndef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 0
#elif sc_ScreenTextureHasSwappedViews==1
#undef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 1
#endif
#ifndef sc_ScreenTextureLayout
#define sc_ScreenTextureLayout 0
#endif
#ifndef sc_ShadowTextureHasSwappedViews
#define sc_ShadowTextureHasSwappedViews 0
#elif sc_ShadowTextureHasSwappedViews==1
#undef sc_ShadowTextureHasSwappedViews
#define sc_ShadowTextureHasSwappedViews 1
#endif
#ifndef sc_ShadowTextureLayout
#define sc_ShadowTextureLayout 0
#endif
#ifndef sc_RayTracedReflectionTextureHasSwappedViews
#define sc_RayTracedReflectionTextureHasSwappedViews 0
#elif sc_RayTracedReflectionTextureHasSwappedViews==1
#undef sc_RayTracedReflectionTextureHasSwappedViews
#define sc_RayTracedReflectionTextureHasSwappedViews 1
#endif
#ifndef sc_RayTracedReflectionTextureLayout
#define sc_RayTracedReflectionTextureLayout 0
#endif
#ifndef z_rayDirectionsHasSwappedViews
#define z_rayDirectionsHasSwappedViews 0
#elif z_rayDirectionsHasSwappedViews==1
#undef z_rayDirectionsHasSwappedViews
#define z_rayDirectionsHasSwappedViews 1
#endif
#ifndef z_rayDirectionsLayout
#define z_rayDirectionsLayout 0
#endif
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
#endif
#ifndef sc_RenderingSpace
#define sc_RenderingSpace -1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 0
#elif SC_GL_FRAGMENT_PRECISION_HIGH==1
#undef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef sc_FragDataCount
#define sc_FragDataCount 0
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_AmbientLightMode0
#define sc_AmbientLightMode0 0
#endif
#ifndef sc_AmbientLightMode1
#define sc_AmbientLightMode1 0
#endif
#ifndef sc_AmbientLightMode2
#define sc_AmbientLightMode2 0
#endif
#ifndef sc_AmbientLightMode_Constant
#define sc_AmbientLightMode_Constant 0
#endif
#ifndef sc_AmbientLightMode_SphericalHarmonics
#define sc_AmbientLightMode_SphericalHarmonics 0
#endif
#ifndef sc_AmbientLightMode_EnvironmentMap
#define sc_AmbientLightMode_EnvironmentMap 0
#endif
#ifndef sc_AmbientLightMode_FromCamera
#define sc_AmbientLightMode_FromCamera 0
#endif
#ifndef sc_EnvLightMode
#define sc_EnvLightMode 0
#endif
#ifndef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 0
#elif sc_RenderAlphaToColor==1
#undef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
#endif
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
#endif
#ifndef sc_MaxTextureImageUnits
#define sc_MaxTextureImageUnits 0
#endif
#ifndef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 0
#elif sc_HasDiffuseEnvmap==1
#undef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 1
#endif
#ifndef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 0
#elif sc_ShaderComplexityAnalyzer==1
#undef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_OITDepthPrepass
#define sc_OITDepthPrepass 0
#elif sc_OITDepthPrepass==1
#undef sc_OITDepthPrepass
#define sc_OITDepthPrepass 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 0
#elif sc_OITFrontLayerPass==1
#undef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 1
#endif
#ifndef sc_OITMaxLayers4
#define sc_OITMaxLayers4 0
#elif sc_OITMaxLayers4==1
#undef sc_OITMaxLayers4
#define sc_OITMaxLayers4 1
#endif
#ifndef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 0
#elif sc_OITMaxLayers4Plus1==1
#undef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 1
#endif
#ifndef sc_OITMaxLayers8
#define sc_OITMaxLayers8 0
#elif sc_OITMaxLayers8==1
#undef sc_OITMaxLayers8
#define sc_OITMaxLayers8 1
#endif
#ifndef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 0
#elif sc_OITMaxLayersVisualizeLayerCount==1
#undef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 1
#endif
#ifndef sc_BlendMode_Disabled
#define sc_BlendMode_Disabled 0
#elif sc_BlendMode_Disabled==1
#undef sc_BlendMode_Disabled
#define sc_BlendMode_Disabled 1
#endif
#ifndef sc_BlendMode_Normal
#define sc_BlendMode_Normal 0
#elif sc_BlendMode_Normal==1
#undef sc_BlendMode_Normal
#define sc_BlendMode_Normal 1
#endif
#ifndef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 0
#elif sc_BlendMode_Multiply==1
#undef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 1
#endif
#ifndef sc_BlendMode_Add
#define sc_BlendMode_Add 0
#elif sc_BlendMode_Add==1
#undef sc_BlendMode_Add
#define sc_BlendMode_Add 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 0
#elif sc_BlendMode_PremultipliedAlpha==1
#undef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 1
#endif
#ifndef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 0
#elif sc_BlendMode_AlphaToCoverage==1
#undef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 1
#endif
#ifndef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 0
#elif sc_BlendMode_MultiplyOriginal==1
#undef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 1
#endif
#ifndef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 0
#elif sc_BlendMode_AddWithAlphaFactor==1
#undef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 1
#endif
#ifndef sc_BlendMode_Min
#define sc_BlendMode_Min 0
#elif sc_BlendMode_Min==1
#undef sc_BlendMode_Min
#define sc_BlendMode_Min 1
#endif
#ifndef sc_BlendMode_Max
#define sc_BlendMode_Max 0
#elif sc_BlendMode_Max==1
#undef sc_BlendMode_Max
#define sc_BlendMode_Max 1
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
#endif
#ifndef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 0
#elif sc_BlendMode_ColoredGlass==1
#undef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 0
#elif sc_BlendMode_PremultipliedAlphaHardware==1
#undef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 1
#endif
#ifndef sc_BlendMode_Custom
#define sc_BlendMode_Custom 0
#elif sc_BlendMode_Custom==1
#undef sc_BlendMode_Custom
#define sc_BlendMode_Custom 1
#endif
#ifndef sc_BlendMode_Software
#define sc_BlendMode_Software 0
#elif sc_BlendMode_Software==1
#undef sc_BlendMode_Software
#define sc_BlendMode_Software 1
#endif
#ifndef sc_BlendMode_Hardware
#define sc_BlendMode_Hardware 0
#elif sc_BlendMode_Hardware==1
#undef sc_BlendMode_Hardware
#define sc_BlendMode_Hardware 1
#endif
#ifndef sc_LightEstimation
#define sc_LightEstimation 0
#elif sc_LightEstimation==1
#undef sc_LightEstimation
#define sc_LightEstimation 1
#endif
#ifndef sc_LightEstimationSGCount
#define sc_LightEstimationSGCount 0
#endif
#ifndef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 0
#elif sc_ProxyAlphaOne==1
#undef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 1
#endif
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
texture2d<float> sc_EnvmapDiffuse [[id(3)]];
texture2d<float> sc_EnvmapSpecular [[id(4)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(5)]];
texture2d<float> sc_ScreenTexture [[id(6)]];
texture2d<float> sc_ShadowTexture [[id(7)]];
texture2d<float> sc_StrandDataMapTexture [[id(8)]];
texture2d<uint> z_hitIdAndBarycentric [[id(9)]];
texture2d<float> z_rayDirections [[id(10)]];
sampler sc_EnvmapDiffuseSmpSC [[id(11)]];
sampler sc_EnvmapSpecularSmpSC [[id(12)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(13)]];
sampler sc_ScreenTextureSmpSC [[id(14)]];
sampler sc_ShadowTextureSmpSC [[id(15)]];
sampler sc_StrandDataMapTextureSmpSC [[id(16)]];
sampler z_hitIdAndBarycentricSmp [[id(17)]];
sampler z_rayDirectionsSmpSC [[id(18)]];
constant libraryUniformsObj* LibraryUniforms [[id(19)]];
};
struct sc_Set1 { };
struct sc_SysIn
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 gl_FragCoord;
bool gl_FrontFacing;
};
int sc_GetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_StereoRenderingMode==0)
{
return 0;
}
#else
{
return sc_sysIn.varStereoViewID;
}
#endif
}
float2 sc_SamplingCoordsGlobalToView(thread float3& uvi,thread const int& renderingLayout,thread const int& viewIndex)
{
if (renderingLayout==1)
{
uvi.y=((2.0*uvi.y)+float(viewIndex))-1.0;
}
return uvi.xy;
}
float2 sc_ScreenCoordsGlobalToView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_StereoRenderingMode==1)
{
float3 uvi=float3(uv,0.0);
int instancedClippedLayout=1;
int viewIndex=sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float3 param=float3(uv,0.0);
int param_1=instancedClippedLayout;
int param_2=viewIndex;
float2 l9_0=sc_SamplingCoordsGlobalToView(param,param_1,param_2);
return l9_0;
}
#else
{
return uv;
}
#endif
}
float2 sc_EnvmapDiffuseGetDims2D(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_EnvmapDiffuseDims.xy;
}
int sc_EnvmapDiffuseGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_EnvmapDiffuseHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float4 sc_EnvmapDiffuseSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapDiffuseGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapDiffuseLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapDiffuseSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_EnvmapDiffuseGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapDiffuseLayout;
int param_3=0;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_EnvmapDiffuseSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapDiffuseGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapDiffuseLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapDiffuseSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapDiffuseGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return sc_EnvmapDiffuseSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_EnvmapDiffuseSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_EnvmapDiffuseGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapDiffuseLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_EnvmapDiffuseSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapDiffuseGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return sc_EnvmapDiffuseSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_EnvmapDiffuseSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_EnvmapDiffuseSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_EnvmapDiffuseSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapDiffuseGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
return sc_EnvmapDiffuseSampleViewIndex(param,param_1,sc_sysIn,sc_set0,sc_set1);
}
float2 sc_EnvmapSpecularGetDims2D(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_EnvmapSpecularDims.xy;
}
int sc_EnvmapSpecularGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_EnvmapSpecularHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float4 sc_EnvmapSpecularSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapSpecularGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapSpecularLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapSpecularSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_EnvmapSpecularGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapSpecularLayout;
int param_3=0;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_EnvmapSpecularSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_EnvmapSpecularGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapSpecularLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_EnvmapSpecularSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapSpecularGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return sc_EnvmapSpecularSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_EnvmapSpecularSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_EnvmapSpecularGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_EnvmapSpecularLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_EnvmapSpecularSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapSpecularGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return sc_EnvmapSpecularSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_EnvmapSpecularSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_EnvmapSpecularSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_EnvmapSpecularSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_EnvmapSpecularGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
return sc_EnvmapSpecularSampleViewIndex(param,param_1,sc_sysIn,sc_set0,sc_set1);
}
float2 sc_StrandDataMapTextureGetDims2D(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_StrandDataMapTextureDims.xy;
}
int sc_StrandDataMapTextureGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_StrandDataMapTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float4 sc_StrandDataMapTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_StrandDataMapTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_StrandDataMapTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_StrandDataMapTexture,sc_set0.sc_StrandDataMapTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_StrandDataMapTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_StrandDataMapTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_StrandDataMapTextureLayout;
int param_3=0;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_StrandDataMapTexture,sc_set0.sc_StrandDataMapTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_StrandDataMapTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_StrandDataMapTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_StrandDataMapTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_StrandDataMapTexture,sc_set0.sc_StrandDataMapTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_StrandDataMapTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_StrandDataMapTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return sc_StrandDataMapTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_StrandDataMapTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_StrandDataMapTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_StrandDataMapTextureLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_StrandDataMapTexture,sc_set0.sc_StrandDataMapTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_StrandDataMapTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_StrandDataMapTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return sc_StrandDataMapTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_StrandDataMapTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_StrandDataMapTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_StrandDataMapTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_StrandDataMapTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
return sc_StrandDataMapTextureSampleViewIndex(param,param_1,sc_sysIn,sc_set0,sc_set1);
}
float2 sc_ScreenTextureGetDims2D(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_ScreenTextureDims.xy;
}
int sc_ScreenTextureGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_ScreenTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float4 sc_ScreenTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ScreenTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ScreenTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ScreenTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_ScreenTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ScreenTextureLayout;
int param_3=0;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_ScreenTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ScreenTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ScreenTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ScreenTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ScreenTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return sc_ScreenTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_ScreenTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_ScreenTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ScreenTextureLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_ScreenTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ScreenTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return sc_ScreenTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_ScreenTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_ScreenTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_ScreenTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ScreenTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
return sc_ScreenTextureSampleViewIndex(param,param_1,sc_sysIn,sc_set0,sc_set1);
}
float2 sc_ShadowTextureGetDims2D(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_ShadowTextureDims.xy;
}
int sc_ShadowTextureGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_ShadowTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float4 sc_ShadowTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ShadowTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ShadowTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ShadowTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_ShadowTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ShadowTextureLayout;
int param_3=0;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_ShadowTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_ShadowTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ShadowTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_ShadowTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ShadowTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return sc_ShadowTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_ShadowTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_ShadowTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_ShadowTextureLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_ShadowTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ShadowTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return sc_ShadowTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_ShadowTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_ShadowTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_ShadowTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_ShadowTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
return sc_ShadowTextureSampleViewIndex(param,param_1,sc_sysIn,sc_set0,sc_set1);
}
bool ReceivesRayTracedReflections(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).receivesRayTracedReflections!=0;
}
float2 sc_RayTracedReflectionTextureGetDims2D(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).sc_RayTracedReflectionTextureDims.xy;
}
int sc_RayTracedReflectionTextureGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_RayTracedReflectionTextureHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_RayTracedReflectionTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_RayTracedReflectionTextureLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_RayTracedReflectionTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_RayTracedReflectionTextureLayout;
int param_3=0;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_RayTracedReflectionTextureSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=sc_RayTracedReflectionTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_RayTracedReflectionTextureLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 sc_RayTracedReflectionTextureSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_RayTracedReflectionTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return sc_RayTracedReflectionTextureSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_RayTracedReflectionTextureSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_RayTracedReflectionTextureGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=sc_RayTracedReflectionTextureLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 sc_RayTracedReflectionTextureSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_RayTracedReflectionTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return sc_RayTracedReflectionTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_RayTracedReflectionTextureSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return sc_RayTracedReflectionTextureSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 sc_RayTracedReflectionTextureSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=sc_RayTracedReflectionTextureGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
return sc_RayTracedReflectionTextureSampleViewIndex(param,param_1,sc_sysIn,sc_set0,sc_set1);
}
bool IsProxyMode(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).isProxyMode!=0;
}
bool NoEarlyZ(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).noEarlyZ!=0;
}
float2 z_rayDirectionsGetDims2D(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (*sc_set0.LibraryUniforms).z_rayDirectionsDims.xy;
}
int z_rayDirectionsGetStereoViewIndex(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (z_rayDirectionsHasSwappedViews)
{
return 1-sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#else
{
return sc_GetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
}
#endif
}
float4 z_rayDirectionsSampleLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=z_rayDirectionsGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=z_rayDirectionsLayout;
int param_3=0;
float param_4=level;
return sc_SampleViewLevel(sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 z_rayDirectionsSampleBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=z_rayDirectionsGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=z_rayDirectionsLayout;
int param_3=0;
float param_4=bias0;
return sc_SampleView(sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 z_rayDirectionsSampleViewIndexLevel(thread const float2& uv,thread const int& viewIndex,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
#if (sc_CanUseTextureLod)
{
float2 param=z_rayDirectionsGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=z_rayDirectionsLayout;
int param_3=viewIndex;
float param_4=level;
return sc_SampleViewLevel(sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,param,param_1,param_2,param_3,param_4);
}
#else
{
return float4(0.0);
}
#endif
}
float4 z_rayDirectionsSampleViewLevel(thread const float2& uv,thread const float& level,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=z_rayDirectionsGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=level;
return z_rayDirectionsSampleViewIndexLevel(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 z_rayDirectionsSampleViewIndexBias(thread const float2& uv,thread const int& viewIndex,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=z_rayDirectionsGetDims2D(sc_sysIn,sc_set0,sc_set1);
float2 param_1=uv;
int param_2=z_rayDirectionsLayout;
int param_3=viewIndex;
float param_4=bias0;
return sc_SampleView(sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,param,param_1,param_2,param_3,param_4);
}
float4 z_rayDirectionsSampleViewBias(thread const float2& uv,thread const float& bias0,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=z_rayDirectionsGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
float param_2=bias0;
return z_rayDirectionsSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 z_rayDirectionsSampleViewIndex(thread const float2& uv,thread const int& viewIndex,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=viewIndex;
float param_2=0.0;
return z_rayDirectionsSampleViewIndexBias(param,param_1,param_2,sc_sysIn,sc_set0,sc_set1);
}
float4 z_rayDirectionsSampleView(thread const float2& uv,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=uv;
int param_1=z_rayDirectionsGetStereoViewIndex(sc_sysIn,sc_set0,sc_set1);
return z_rayDirectionsSampleViewIndex(param,param_1,sc_sysIn,sc_set0,sc_set1);
}
uint4 lray_readHitIdAndBarycentric(thread const int2& screenPos,thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return sc_set0.z_hitIdAndBarycentric.read(uint2(screenPos),0);
}
float4 sc_GetGlFragCoord(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return sc_sysIn.gl_FragCoord;
}
float2 sc_GetGlobalScreenCoords(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return (sc_GetGlFragCoord(sc_sysIn,sc_set0,sc_set1).xy*(*sc_set0.LibraryUniforms).sc_WindowToViewportTransform.xy)+(*sc_set0.LibraryUniforms).sc_WindowToViewportTransform.zw;
}
float2 sc_GetViewScreenCoords(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
float2 param=sc_GetGlobalScreenCoords(sc_sysIn,sc_set0,sc_set1);
return sc_ScreenCoordsGlobalToView(param,sc_sysIn,sc_set0,sc_set1);
}
float2 getScreenUV(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return sc_GetViewScreenCoords(sc_sysIn,sc_set0,sc_set1);
}
bool sc_GetGlFrontFacing(thread sc_SysIn& sc_sysIn,const constant sc_Set0& sc_set0,const constant sc_Set1& sc_set1)
{
return sc_sysIn.gl_FrontFacing;
}
} // FRAGMENT SHADER
