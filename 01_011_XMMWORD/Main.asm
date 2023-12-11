.data ; data segment
mem128 dword 1.0, 2.0, 3.0, 4.0 ; 4 floats = 128 bits = 16 bytes
mem128b qword 1, 2 ; 2 qwords = 128 bits = 16 bytes

.code ; code segment
Main proc
    ;MOVDQU (unaligned) vs. MOVDQA (align required)
    ;MOVUPS (unaligned) vs. MOVAPS (align required)
    ;[i] Memory data that is aligned on a 16 byte boundary will have
    ;    a memory address that is a multiple of two.

    ;MOVUPS — Move Unaligned Packed Floating-Point Values
    mov rdx, offset mem128 ; moves the address of mem128 into rdx
    movups xmm0, xmmword ptr [rdx] ; moves the value of mem128 into xmm0

    ;MOVAPS — Move Aligned Packed Floating-Point Values
    ;When MOV between registers it is best to use the aligned version.
    movaps xmm1, xmm0
    
    ;MOVDQU — Move Unaligned Double Quadword
    mov rdx, offset mem128b
    movdqu xmm0, xmmword ptr [rdx]

    ;MOVDQA — Move Aligned Packed Integer Values
    ;When MOV between registers it is best to use the aligned version.
    movdqa xmm1, xmm0
    
    mov r8, sizeof xmmword ;128 bits = 16 bytes
    
    ret
Main endp
end
