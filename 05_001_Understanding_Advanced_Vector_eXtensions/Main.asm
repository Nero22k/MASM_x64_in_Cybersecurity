
.data
mem256a dword 1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0, 8.0
mem256b dword 3.0, 5.0, 9.0, 1.0, 5.0, 0.0, 2.0, 4.0
mem512a dword 1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0, 8.0
        dword 3.0, 7.0, 1.0, 2.0, 5.0, 8.0, 0.0, 4.0
mem512b dword 7.0, 9.0, 4.0, 5.0, 8.0, 1.0, 2.0, 9.0
        dword 2.0, 1.0, 7.0, 4.0, 3.0, 5.0, 1.0, 11.0

mem256c dword 1, 0, 1, 0, 1, 0, 1, 0

mem256d dword 0, 1, 0, 1, 0, 1, 0, 1

mem512c dword 1, 0, 1, 0, 1, 0, 1, 0
        dword 1, 0, 0, 1, 1, 0, 0, 1

mem512d dword 0, 1, 0, 1, 0, 1, 0, 1
        dword 1, 0, 0, 1, 1, 0, 0, 1

.code
Main proc
    ;------------ AVX ------------;
    ;VMOVUPS is extended MOVUPS
    vmovups ymm1, mem256a
    vmovups ymm2, mem256b
    ;VADDPS is extended ADDPS
    vaddps ymm0, ymm1, ymm2

    vmovups ymm1, mem256a
    vmovups ymm2, mem256b
    ;VSUBPS is extended SUBPS
    vsubps ymm0, ymm1, ymm2

    vmovups ymm1, mem256a
    vmovups ymm2, mem256b
    ;VXORPS is extended XORPS
    vxorps ymm0, ymm1, ymm2

    mov rdx, offset mem256c
    vmovdqu ymm2, ymmword ptr [rdx]
    mov rdx, offset mem256d
    vmovdqu ymm3, ymmword ptr [rdx]
    ;VPXOR is bitwise XOR of YMM3/m256 and YMM2.
    vpxor ymm1, ymm2, ymm3

    ;---------- AVX-512 ----------;

    vmovups zmm1, mem512a
    vmovups zmm2, mem512b
    vaddps zmm0, zmm1, zmm2 ;ADD

    vmovups zmm1, mem512a
    vmovups zmm2, mem256b
    vsubps zmm0, zmm1, zmm2 ;SUB

    vmovups zmm1, mem512a
    vmovups zmm2, mem512b
    vxorps zmm0, zmm1, zmm2 ;XOR

    mov rdx, offset mem512c
    vmovdqu64 zmm2, zmmword ptr [rdx]
    mov rdx, offset mem512d
    vmovdqu64 zmm3, zmmword ptr [rdx]
    ;VPXORD is bitwise XOR of packed doubleword integers
    ;in ZMM2 and ZMM3/m512/m32bcst using writemask k1.
    vpxord zmm1, zmm2, zmm3

    ret
Main endp
end
