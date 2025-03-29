Shader "Hidden/TonemappingColorGradingHistogram" {
SubShader { 
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 5294
Program "vp" {
SubProgram "d3d11 " {
"vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[6];
					};
					UNITY_BINDING(1) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP;
						vec4 unused_1_2[40];
					};
					UNITY_BINDING(2) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = unity_ObjectToWorld[1].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[1].xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[1].zzzz + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[1].wwww + u_xlat1;
					    u_xlat1 = u_xlat1 * in_POSITION0.yyyy;
					    u_xlat2 = unity_ObjectToWorld[0].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[0].xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[0].zzzz + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[0].wwww + u_xlat2;
					    u_xlat1 = u_xlat2 * in_POSITION0.xxxx + u_xlat1;
					    u_xlat2 = unity_ObjectToWorld[2].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[2].xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[2].zzzz + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[2].wwww + u_xlat2;
					    u_xlat1 = u_xlat2 * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = unity_ObjectToWorld[3].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[3].xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[3].zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[3].wwww + u_xlat2;
					    gl_Position = u_xlat0 * in_POSITION0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
}
}
Program "fp" {
SubProgram "d3d11 " {
"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					float ImmCB_0_0_0[4];
					float ImmCB_0_0_1[4];
					float ImmCB_0_0_2[4];
					float ImmCB_0_0_3[4];
					UNITY_BINDING(0) uniform PGlobals {
						vec4 unused_0_0[6];
						vec2 _Size;
						int _Channel;
						vec4 _ColorR;
						vec4 _ColorG;
						vec4 _ColorB;
						vec4 _ColorL;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					int u_xlati2;
					uvec2 u_xlatu2;
					float u_xlat4;
					uint u_xlatu4;
					int u_xlati6;
					void main()
					{
						ImmCB_0_0_0[0] = 1.0;
						ImmCB_0_0_0[1] = 0.0;
						ImmCB_0_0_0[2] = 0.0;
						ImmCB_0_0_0[3] = 0.0;
						ImmCB_0_0_1[0] = 0.0;
						ImmCB_0_0_1[1] = 1.0;
						ImmCB_0_0_1[2] = 0.0;
						ImmCB_0_0_1[3] = 0.0;
						ImmCB_0_0_2[0] = 0.0;
						ImmCB_0_0_2[1] = 0.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = 0.0;
						ImmCB_0_0_3[0] = 0.0;
						ImmCB_0_0_3[1] = 0.0;
						ImmCB_0_0_3[2] = 0.0;
						ImmCB_0_0_3[3] = 1.0;
					    u_xlat0 = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0);
					    u_xlat0 = fract(u_xlat0);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu4 = min(u_xlatu4, 255u);
					    u_xlati6 = _Channel << 2;
					    u_xlatu2.y = _Histogram_buf[u_xlatu4].value[(u_xlati6 >> 2) + 0];
					    u_xlatu2.x = _Histogram_buf[u_xlatu2.x].value[(u_xlati6 >> 2) + 0];
					    u_xlat2.xy = vec2(u_xlatu2.xy);
					    u_xlat4 = u_xlat0 * u_xlat2.y;
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat0 = u_xlat2.x * u_xlat0 + u_xlat4;
					    u_xlat2.x = vs_TEXCOORD0.y * _Size.y;
					    u_xlat2.x = roundEven(u_xlat2.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlat2.x = float(u_xlatu2.x);
					    u_xlatb0 = u_xlat0>=u_xlat2.x;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlati2 = _Channel;
					    u_xlat1 = _ColorR * ImmCB_0_0_0[u_xlati2];
					    u_xlat1 = ImmCB_0_0_1[u_xlati2] * _ColorG + u_xlat1;
					    u_xlat1 = ImmCB_0_0_2[u_xlati2] * _ColorB + u_xlat1;
					    u_xlat1 = ImmCB_0_0_3[u_xlati2] * _ColorL + u_xlat1;
					    SV_Target0 = vec4(u_xlat0) * u_xlat1;
					    return;
					}"
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					float ImmCB_0_0_0[4];
					float ImmCB_0_0_1[4];
					float ImmCB_0_0_2[4];
					float ImmCB_0_0_3[4];
					UNITY_BINDING(0) uniform PGlobals {
						vec4 unused_0_0[6];
						vec2 _Size;
						int _Channel;
						vec4 _ColorR;
						vec4 _ColorG;
						vec4 _ColorB;
						vec4 _ColorL;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					int u_xlati2;
					uvec2 u_xlatu2;
					float u_xlat4;
					uint u_xlatu4;
					int u_xlati6;
					void main()
					{
						ImmCB_0_0_0[0] = 1.0;
						ImmCB_0_0_0[1] = 0.0;
						ImmCB_0_0_0[2] = 0.0;
						ImmCB_0_0_0[3] = 0.0;
						ImmCB_0_0_1[0] = 0.0;
						ImmCB_0_0_1[1] = 1.0;
						ImmCB_0_0_1[2] = 0.0;
						ImmCB_0_0_1[3] = 0.0;
						ImmCB_0_0_2[0] = 0.0;
						ImmCB_0_0_2[1] = 0.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = 0.0;
						ImmCB_0_0_3[0] = 0.0;
						ImmCB_0_0_3[1] = 0.0;
						ImmCB_0_0_3[2] = 0.0;
						ImmCB_0_0_3[3] = 1.0;
					    u_xlat0 = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0);
					    u_xlat0 = fract(u_xlat0);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu4 = min(u_xlatu4, 255u);
					    u_xlati6 = _Channel << 2;
					    u_xlatu2.y = _Histogram_buf[u_xlatu4].value[(u_xlati6 >> 2) + 0];
					    u_xlatu2.x = _Histogram_buf[u_xlatu2.x].value[(u_xlati6 >> 2) + 0];
					    u_xlat2.xy = vec2(u_xlatu2.xy);
					    u_xlat4 = u_xlat0 * u_xlat2.y;
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat0 = u_xlat2.x * u_xlat0 + u_xlat4;
					    u_xlat2.x = vs_TEXCOORD0.y * _Size.y;
					    u_xlat2.x = roundEven(u_xlat2.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlat2.x = float(u_xlatu2.x);
					    u_xlatb0 = u_xlat0>=u_xlat2.x;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlati2 = _Channel;
					    u_xlat1 = _ColorR * ImmCB_0_0_0[u_xlati2];
					    u_xlat1 = ImmCB_0_0_1[u_xlati2] * _ColorG + u_xlat1;
					    u_xlat1 = ImmCB_0_0_2[u_xlati2] * _ColorB + u_xlat1;
					    u_xlat1 = ImmCB_0_0_3[u_xlati2] * _ColorL + u_xlat1;
					    SV_Target0 = vec4(u_xlat0) * u_xlat1;
					    return;
					}"
}
}
 }
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 84079
Program "vp" {
SubProgram "d3d11 " {
"vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[6];
					};
					UNITY_BINDING(1) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP;
						vec4 unused_1_2[40];
					};
					UNITY_BINDING(2) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = unity_ObjectToWorld[1].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[1].xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[1].zzzz + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[1].wwww + u_xlat1;
					    u_xlat1 = u_xlat1 * in_POSITION0.yyyy;
					    u_xlat2 = unity_ObjectToWorld[0].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[0].xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[0].zzzz + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[0].wwww + u_xlat2;
					    u_xlat1 = u_xlat2 * in_POSITION0.xxxx + u_xlat1;
					    u_xlat2 = unity_ObjectToWorld[2].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[2].xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[2].zzzz + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[2].wwww + u_xlat2;
					    u_xlat1 = u_xlat2 * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = unity_ObjectToWorld[3].yyyy * unity_StereoMatrixVP[(u_xlati0 + 1)];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0] * unity_ObjectToWorld[3].xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2)] * unity_ObjectToWorld[3].zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3)] * unity_ObjectToWorld[3].wwww + u_xlat2;
					    gl_Position = u_xlat0 * in_POSITION0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
}
}
Program "fp" {
SubProgram "d3d11 " {
"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform PGlobals {
						vec4 unused_0_0[6];
						vec2 _Size;
						vec4 _ColorR;
						vec4 _ColorG;
						vec4 _ColorB;
						vec4 unused_0_5;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					uvec3 u_xlatu1;
					vec3 u_xlat2;
					uvec3 u_xlatu2;
					uint u_xlatu4;
					float u_xlat6;
					uint u_xlatu6;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu1.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat1.xyz = vec3(u_xlatu1.xyz);
					    u_xlatu2.x = min(u_xlatu4, 255u);
					    u_xlatu2.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat2.xyz = vec3(u_xlatu2.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat6 = vs_TEXCOORD0.y * _Size.y;
					    u_xlat6 = roundEven(u_xlat6);
					    u_xlatu6 = uint(u_xlat6);
					    u_xlat6 = float(u_xlatu6);
					    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(u_xlat6)).xyz;
					    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
					    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
					;
					    u_xlat1 = u_xlat0.yyyy * _ColorG;
					    u_xlat1 = u_xlat0.xxxx * _ColorR + u_xlat1;
					    SV_Target0 = u_xlat0.zzzz * _ColorB + u_xlat1;
					    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
					    return;
					}"
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform PGlobals {
						vec4 unused_0_0[6];
						vec2 _Size;
						vec4 _ColorR;
						vec4 _ColorG;
						vec4 _ColorB;
						vec4 unused_0_5;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					uvec3 u_xlatu1;
					vec3 u_xlat2;
					uvec3 u_xlatu2;
					uint u_xlatu4;
					float u_xlat6;
					uint u_xlatu6;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu1.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat1.xyz = vec3(u_xlatu1.xyz);
					    u_xlatu2.x = min(u_xlatu4, 255u);
					    u_xlatu2.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat2.xyz = vec3(u_xlatu2.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat6 = vs_TEXCOORD0.y * _Size.y;
					    u_xlat6 = roundEven(u_xlat6);
					    u_xlatu6 = uint(u_xlat6);
					    u_xlat6 = float(u_xlatu6);
					    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(u_xlat6)).xyz;
					    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
					    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
					;
					    u_xlat1 = u_xlat0.yyyy * _ColorG;
					    u_xlat1 = u_xlat0.xxxx * _ColorR + u_xlat1;
					    SV_Target0 = u_xlat0.zzzz * _ColorB + u_xlat1;
					    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
					    return;
					}"
}
}
 }
}
Fallback Off
}