// Summary: added snow texture toggle
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D DiffuseTexSampler;
//   sampler2D TextureSampler;
//   float gInvColorExpBias;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   NearFarPlane      c128     1
//   gInvColorExpBias  c46      1
//   DiffuseTexSampler s0       1
//   TextureSampler    s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.5109597688e-43 // 536
    def c127, 1, 0, 0, 0 // LogDepth constants
    def c0, 0, 1, 10, 0
    dcl_color v0
    dcl_texcoord v1.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    add r0.xy, c0.zxzw, v1
    texld r0, r0, s0
    mul r0, r0, v0
    mov r1.xy, c0
    mad r1, c46.x, r1.xxxy, r1.yyyx
    mul r0, r0, r1
    texld r2, v1, s1
    cmp r2.w, -c221_abs.y, r2.w, r2.y
    mov r2.xyz, c0.y
    mul r2, r2, v0
    mul r1, r1, r2
    cmp oC0, v1.x, r1, r0
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c209.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c209.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 10 instruction slots used (2 texture, 8 arithmetic)
