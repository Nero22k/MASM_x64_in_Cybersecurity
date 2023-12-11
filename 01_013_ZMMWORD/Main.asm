.data ; data segment
mem512 dword 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0,\
           9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0 ; 16 floats == 512 bits == 64 bytes
mem512b dword 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ; 16 dwords == 512 bits == 64 bytes

.code ; code segment
Main proc
    ;[i] Memory data that is aligned on a 16 byte boundary will have
    ;    a memory address that is a multiple of two.

    ;VMOVUPS — Move Unaligned Packed Floating-Point Values
    mov rdx, offset mem512 ; moves the address of mem512 into rdx
    vmovups zmm0, zmmword ptr [rdx] ; moves the 512 bits of data at the address in rdx into zmm0

    ;VMOVAPS — Move Aligned Packed Floating-Point Values
    ;When MOV between registers it is best to use the aligned version.
    vmovaps zmm1, zmm0
    
    ;VMOVDQU — Move Unaligned Packed Integer Values
    mov rdx, offset mem512b
    vmovdqu64 zmm0, zmmword ptr [rdx]

    ;VMOVDQA — Move Aligned Packed Integer Values
    ;When MOV between registers it is best to use the aligned version.
    vmovdqa64 zmm1, zmm0
    
    mov r8, sizeof zmmword ;512 bits == 64 bytes

    ret ; return to caller
Main endp
end
