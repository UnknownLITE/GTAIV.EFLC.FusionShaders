// Summary: removed unnecessary stipple + light on/off switch
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 colorize;
//   float emissiveMultiplier;
//   float4 gDayNightEffects;
//   float4 globalScalars;
//   float4 shadowmap_res;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   NearFarPlane       c128     1
//   globalScalars      c39      1
//   gDayNightEffects   c45      1
//   colorize           c51      1
//   emissiveMultiplier c66      1
//   shadowmap_res      c207     1
//   TextureSampler     s0       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.3541814201e-43 // 168
    def c127, 1, 0.99, 0, 0 // LogDepth constants
    def c0, 3.99600005, 4, 0.125, 0.25
    def c1, 0, -1, -0, 1280
    dcl_texcoord v0.xy
    dcl_color v1
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    mov r1.xy, c1_abs.wy
    add r1.x, r1.x, -c207.x
    cmp r1.y, -r1_abs.x, r1.y, c223.w
    mul r0.w, r0.w, r1.y
    mul r0, r0, v1
    mov r1.x, c66.x
    mul r1.x, r1.x, c45.w
    mul r1.xyz, r0, r1.x
    mul r1.w, r0.w, c39.x
    mul oC0, r1, c51
    
    // LogDepth Write (emissive)
    if_ne v9.y, c127.x
      mov r20.x, c127.y
      mad r20.x, r20.x, c209.y, -v9.w
      texkill r20.x
      rcp r20.x, c209.x
      add r20.y, c209.x, v9.x
      rcp r20.y, r20.y
      mul r20.y, r20.y, v9.w
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

// approximately 23 instruction slots used (3 texture, 20 arithmetic)
