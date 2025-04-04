Shader "Custom/Vive Movement Border" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _Alpha ("Total Alpha (Transparency)", Float) = 1.000000
 _FadeOutStartTexCoord ("Fade Out Start Texture Coordinate", Float) = 1.000000
 _FadeOutEndTexCoord ("Fade Out End Texture Coordinate", Float) = 1.000000
}
SubShader { 
 Tags { "QUEUE"="Overlay" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Overlay" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  GpuProgramID 9145
Program "vp" {
SubProgram "d3d9 " {
"vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   row_major float4x4 glstate_matrix_mvp;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   glstate_matrix_mvp c0       4
					//
					
					    vs_3_0
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_texcoord1 v2
					    dcl_texcoord o0.xy
					    dcl_texcoord1 o1.xy
					    dcl_position o2
					    dp4 o2.x, c0, v0
					    dp4 o2.y, c1, v0
					    dp4 o2.z, c2, v0
					    dp4 o2.w, c3, v0
					    mov o0.xy, v1
					    mov o1.xy, v2
					
					// approximately 6 instruction slots used"
}
SubProgram "d3d11 " {
"vs_4_0
					
					#version 330
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    return;
					}"
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"vs_4_0
					
					#version 330
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP;
						vec4 unused_1_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
					    return;
					}"
}
SubProgram "d3d11_9x " {
"vs_4_0_level_9_1
					
					#version 330
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    return;
					}"
}
}
Program "fp" {
SubProgram "d3d9 " {
"ps_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   float _Alpha;
					//   float4 _Color;
					//   float _FadeOutEndTexCoord;
					//   float _FadeOutStartTexCoord;
					//
					//
					// Registers:
					//
					//   Name                  Reg   Size
					//   --------------------- ----- ----
					//   _Color                c0       1
					//   _Alpha                c1       1
					//   _FadeOutStartTexCoord c2       1
					//   _FadeOutEndTexCoord   c3       1
					//
					
					    ps_3_0
					    def c4, 0.5, -2, 3, 0
					    def c5, 0, 1, -0, -1
					    dcl_texcoord v0.y
					    dcl_texcoord1 v1.y
					    mov r0.x, c2.x
					    add r0.x, -r0.x, c3.x
					    rcp r0.x, r0.x
					    add r0.y, -c2.x, v1.y
					    mul_sat r0.x, r0.x, r0.y
					    mad r0.y, r0.x, c4.y, c4.z
					    mul r0.x, r0.x, r0.x
					    mad r0.x, r0.y, -r0.x, c5.y
					    mov r0.w, c0.w
					    mul r0.y, r0.w, c1.x
					    mul_pp r0.x, r0.x, r0.y
					    cmp r0.y, -v0.y, c5.x, c5.y
					    cmp r0.z, v0.y, c5.z, c5.w
					    add r0.y, r0.z, r0.y
					    frc r0.z, v0_abs.y
					    cmp r0.z, v0.y, r0.z, -r0.z
					    mad r0.y, r0.y, c4.x, -r0.z
					    cmp_pp oC0.w, r0.y, r0.x, c5.x
					    mov_pp oC0.xyz, c0
					
					// approximately 19 instruction slots used"
}
SubProgram "d3d11 " {
"ps_4_0
					
					#version 330
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _Color;
						float _Alpha;
						float _FadeOutStartTexCoord;
						float _FadeOutEndTexCoord;
					};
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					float u_xlat2;
					void main()
					{
					    u_xlati0 = int((0.0<vs_TEXCOORD0.y) ? 0xFFFFFFFFu : uint(0));
					    u_xlati1 = int((vs_TEXCOORD0.y<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati0) + u_xlati1;
					    u_xlat0 = float(u_xlati0);
					    u_xlat0 = u_xlat0 * 0.5;
					    u_xlatb1 = vs_TEXCOORD0.y>=(-vs_TEXCOORD0.y);
					    u_xlat2 = fract(abs(vs_TEXCOORD0.y));
					    u_xlat1 = (u_xlatb1) ? u_xlat2 : (-u_xlat2);
					    u_xlatb0 = u_xlat0>=u_xlat1;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1 = _Color.w * _Alpha;
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat1 = (-_FadeOutStartTexCoord) + _FadeOutEndTexCoord;
					    u_xlat1 = float(1.0) / u_xlat1;
					    u_xlat2 = vs_TEXCOORD1.y + (-_FadeOutStartTexCoord);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat2 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = (-u_xlat2) * u_xlat1 + 1.0;
					    SV_Target0.w = u_xlat1 * u_xlat0;
					    SV_Target0.xyz = _Color.xyz;
					    return;
					}"
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"ps_4_0
					
					#version 330
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _Color;
						float _Alpha;
						float _FadeOutStartTexCoord;
						float _FadeOutEndTexCoord;
					};
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					float u_xlat2;
					void main()
					{
					    u_xlati0 = int((0.0<vs_TEXCOORD0.y) ? 0xFFFFFFFFu : uint(0));
					    u_xlati1 = int((vs_TEXCOORD0.y<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati0) + u_xlati1;
					    u_xlat0 = float(u_xlati0);
					    u_xlat0 = u_xlat0 * 0.5;
					    u_xlatb1 = vs_TEXCOORD0.y>=(-vs_TEXCOORD0.y);
					    u_xlat2 = fract(abs(vs_TEXCOORD0.y));
					    u_xlat1 = (u_xlatb1) ? u_xlat2 : (-u_xlat2);
					    u_xlatb0 = u_xlat0>=u_xlat1;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1 = _Color.w * _Alpha;
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat1 = (-_FadeOutStartTexCoord) + _FadeOutEndTexCoord;
					    u_xlat1 = float(1.0) / u_xlat1;
					    u_xlat2 = vs_TEXCOORD1.y + (-_FadeOutStartTexCoord);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat2 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = (-u_xlat2) * u_xlat1 + 1.0;
					    SV_Target0.w = u_xlat1 * u_xlat0;
					    SV_Target0.xyz = _Color.xyz;
					    return;
					}"
}
SubProgram "d3d11_9x " {
"ps_4_0_level_9_1
					
					#version 330
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _Color;
						float _Alpha;
						float _FadeOutStartTexCoord;
						float _FadeOutEndTexCoord;
					};
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					float u_xlat2;
					void main()
					{
					    u_xlati0 = int((0.0<vs_TEXCOORD0.y) ? 0xFFFFFFFFu : uint(0));
					    u_xlati1 = int((vs_TEXCOORD0.y<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati0) + u_xlati1;
					    u_xlat0 = float(u_xlati0);
					    u_xlat0 = u_xlat0 * 0.5;
					    u_xlatb1 = vs_TEXCOORD0.y>=(-vs_TEXCOORD0.y);
					    u_xlat2 = fract(abs(vs_TEXCOORD0.y));
					    u_xlat1 = (u_xlatb1) ? u_xlat2 : (-u_xlat2);
					    u_xlatb0 = u_xlat0>=u_xlat1;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1 = _Color.w * _Alpha;
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat1 = (-_FadeOutStartTexCoord) + _FadeOutEndTexCoord;
					    u_xlat1 = float(1.0) / u_xlat1;
					    u_xlat2 = vs_TEXCOORD1.y + (-_FadeOutStartTexCoord);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat2 = u_xlat1 * -2.0 + 3.0;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = (-u_xlat2) * u_xlat1 + 1.0;
					    SV_Target0.w = u_xlat1 * u_xlat0;
					    SV_Target0.xyz = _Color.xyz;
					    return;
					}"
}
}
 }
}
}