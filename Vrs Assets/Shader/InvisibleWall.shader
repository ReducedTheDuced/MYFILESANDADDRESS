Shader "AG/InvisibleWall" {
Properties {
 _ImpactColor ("Impact Color", Color) = (0.000000,0.000000,1.000000,1.000000)
}
SubShader { 
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  Blend One One
  GpuProgramID 18418
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
						vec4 unused_0_1[8];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_3[6];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 0) out vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
					layout(location = 0) out vec3 vs_TEXCOORD0;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
						vec4 _ImpactColor;
						vec4 _ImpactPoint0;
						vec4 _ImpactPoint1;
						vec4 _ImpactPoint2;
						vec4 _ImpactPoint3;
						vec4 _ImpactPoint4;
						vec4 _ImpactPoint5;
						vec4 _ImpactPoint6;
						vec4 _ImpactPoint7;
						float _ImpactPointAlpha0;
						float _ImpactPointAlpha1;
						float _ImpactPointAlpha2;
						float _ImpactPointAlpha3;
						float _ImpactPointAlpha4;
						float _ImpactPointAlpha5;
						float _ImpactPointAlpha6;
						float _ImpactPointAlpha7;
					};
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint1.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x / _ImpactPoint1.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat0 * vec4(vec4(_ImpactPointAlpha1, _ImpactPointAlpha1, _ImpactPointAlpha1, _ImpactPointAlpha1));
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint0.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint0.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(_ImpactPointAlpha0) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint2.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint2.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha2, _ImpactPointAlpha2, _ImpactPointAlpha2, _ImpactPointAlpha2)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint3.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint3.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha3, _ImpactPointAlpha3, _ImpactPointAlpha3, _ImpactPointAlpha3)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint4.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint4.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(_ImpactPointAlpha4) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint5.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint5.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha5, _ImpactPointAlpha5, _ImpactPointAlpha5, _ImpactPointAlpha5)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint6.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint6.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha6, _ImpactPointAlpha6, _ImpactPointAlpha6, _ImpactPointAlpha6)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint7.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint7.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    SV_Target0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha7, _ImpactPointAlpha7, _ImpactPointAlpha7, _ImpactPointAlpha7)) + u_xlat0;
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
						vec4 _ImpactColor;
						vec4 _ImpactPoint0;
						vec4 _ImpactPoint1;
						vec4 _ImpactPoint2;
						vec4 _ImpactPoint3;
						vec4 _ImpactPoint4;
						vec4 _ImpactPoint5;
						vec4 _ImpactPoint6;
						vec4 _ImpactPoint7;
						float _ImpactPointAlpha0;
						float _ImpactPointAlpha1;
						float _ImpactPointAlpha2;
						float _ImpactPointAlpha3;
						float _ImpactPointAlpha4;
						float _ImpactPointAlpha5;
						float _ImpactPointAlpha6;
						float _ImpactPointAlpha7;
					};
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint1.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x / _ImpactPoint1.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat0 * vec4(vec4(_ImpactPointAlpha1, _ImpactPointAlpha1, _ImpactPointAlpha1, _ImpactPointAlpha1));
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint0.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint0.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(_ImpactPointAlpha0) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint2.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint2.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha2, _ImpactPointAlpha2, _ImpactPointAlpha2, _ImpactPointAlpha2)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint3.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint3.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha3, _ImpactPointAlpha3, _ImpactPointAlpha3, _ImpactPointAlpha3)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint4.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint4.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(_ImpactPointAlpha4) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint5.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint5.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha5, _ImpactPointAlpha5, _ImpactPointAlpha5, _ImpactPointAlpha5)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint6.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint6.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    u_xlat0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha6, _ImpactPointAlpha6, _ImpactPointAlpha6, _ImpactPointAlpha6)) + u_xlat0;
					    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _ImpactPoint7.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _ImpactPoint7.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1 = u_xlat1.xxxx * _ImpactColor;
					    SV_Target0 = u_xlat1 * vec4(vec4(_ImpactPointAlpha7, _ImpactPointAlpha7, _ImpactPointAlpha7, _ImpactPointAlpha7)) + u_xlat0;
					    return;
					}"
}
}
 }
}
Fallback "Diffuse"
}