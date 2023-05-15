#pragma once
//SG_REFLECTION_BEGIN(100)
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#include <required2_gl.glsl>
#ifndef sc_CanUseSampler2DArray
#define sc_CanUseSampler2DArray 0
#elif sc_CanUseSampler2DArray==1
#undef sc_CanUseSampler2DArray
#define sc_CanUseSampler2DArray 1
#endif
#ifndef sc_CanUseTextureLod
#define sc_CanUseTextureLod 0
#elif sc_CanUseTextureLod==1
#undef sc_CanUseTextureLod
#define sc_CanUseTextureLod 1
#endif
#ifndef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 0
#elif sc_CanUseStandardDerivatives==1
#undef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 1
#endif
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#include <required2_gl.glsl>
#ifndef sc_CanUseSampler2DArray
#define sc_CanUseSampler2DArray 0
#elif sc_CanUseSampler2DArray==1
#undef sc_CanUseSampler2DArray
#define sc_CanUseSampler2DArray 1
#endif
#ifndef sc_CanUseTextureLod
#define sc_CanUseTextureLod 0
#elif sc_CanUseTextureLod==1
#undef sc_CanUseTextureLod
#define sc_CanUseTextureLod 1
#endif
#ifndef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 0
#elif sc_CanUseStandardDerivatives==1
#undef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 1
#endif
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
