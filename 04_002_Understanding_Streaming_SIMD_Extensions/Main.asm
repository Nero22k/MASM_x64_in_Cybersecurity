
.data ; data segment
mem128a dword 1.0, 2.0, 3.0, 4.0
mem128b dword 1.0, 2.0, 3.0, 4.0
mem128c dword 10.0, 5.0, 8.0, 2.0
mem128d dword 1.0, 2.0, 4.0, 3.0
mem128e dword 1.0, 0.0, 0.0, 1.0
mem128f dword 1.0, 0.0, 1.0, 0.0

mem128g dword 0, 0, 1, 1
mem128h dword 0, 1, 0, 1

.code ; code segment
Main proc
    ;MOVUPS - Move four unaligned packed 
    ;single-precision floating-point values 
    ;between XMM registers or between 
    ;and XMM register and memory.
    movups xmm0, mem128a
    movups xmm1, mem128b
    ;ADDPS - Add packed single-precision floating-point values.
    addps xmm0, xmm1

    movups xmm0, mem128c
    movups xmm1, mem128d
    ;SUBPS - Subtract packed single-precision floating-point values.
    subps xmm0, xmm1

    movups xmm0, mem128e
    movups xmm1, mem128f
    ;XORPS - Perform bitwise logical XOR of 
    ;packed single-precision floating-point values.
    xorps xmm0, xmm1

    mov rdx, offset mem128g
    movdqu xmm1, xmmword ptr [rdx]
    mov rdx, offset mem128h
    movdqu xmm2, xmmword ptr [rdx]
    ;PXOR - Bitwise XOR of XMM2/m128 and XMM1.
    pxor xmm1, xmm2

    ;ANDPS - Perform bitwise logical AND of 
    ;packed single-precision floating-point values.
    ;ANDNPS - Perform bitwise logical AND NOT of 
    ;packed single-precision floating-point values.
    ;ORPS - Perform bitwise logical OR of 
    ;packed single-precision floating-point values.

    ;ANDPD - Perform bitwise logical AND of 
    ;packed double-precision floating-point values.
    ;ANDNPD - Perform bitwise logical AND NOT of
    ;packed double-precision floating-point values.
    ;ORPD - Perform bitwise logical OR of
    ;packed double-precision floating-point values.
    ;XORPD - Perform bitwise logical XOR of 
    ;packed double-precision floating-point values.

    ret
Main endp
end
