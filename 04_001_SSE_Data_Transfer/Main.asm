
.data
mem128a dword 1.0, 2.0, 3.0, 4.0 ; packed double words
mem128b qword 1.0, 2.0 ; packed quad words
mem128c qword 1, 2 ; packed quad words

.code
Main proc
    ;MOVUPS (unaligned) vs. MOVAPS (align required)
    ;MOVUPD (unaligned) vs. MOVAPD (align required)
    ;MOVDQU (unaligned) vs. MOVDQA (align required)
    ;[i] Memory data that is aligned on a 16 byte boundary will have
    ;    a memory address that is a multiple of two.

    ;MOVUPS - Move four unaligned packed 
    ;single-precision floating-point values 
    ;between XMM registers or between 
    ;and XMM register and memory.
    movups xmm0, mem128a

    ;When MOV between registers it is best to use the aligned version.
    movaps xmm1, xmm0

    ;MOVUPD - Move two unaligned packed 
    ;double-precision floating-point values
    ;between XMM registers 
    ;or between and XMM register and memory.
    movupd xmm0, mem128b

    ;When MOV between registers it is best to use the aligned version.
    movapd xmm1, xmm0

    ;MOVDQU - Move unaligned double quadword.
    mov rdx, offset mem128c
    movdqu xmm0, xmmword ptr [rdx]

    ;When MOV between registers it is best to use the aligned version.
    movdqa xmm1, xmm0

    ret
Main endp
end
