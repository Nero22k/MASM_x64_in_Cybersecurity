.data ; data segment
mem256 dword 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0 ; 8 floats == 256 bits == 32 bytes
mem256b dword 1, 2, 3, 4, 5, 6, 7, 8 ; 8 dwords == 256 bits == 32 bytes

.code ; code segment
Main proc
    ;[i] Memory data that is aligned on a 16 byte boundary will have
    ;    a memory address that is a multiple of two.

    ;VMOVUPS — Move Unaligned Packed Floating-Point Values
    mov rdx, offset mem256 ; moves the address of mem256 into rdx
    vmovups ymm0, ymmword ptr [rdx] ; moves the packed floats from mem256 into ymm0

    ;VMOVAPS — Move Aligned Packed Floating-Point Values
    ;When MOV between registers it is best to use the aligned version.
    vmovaps ymm1, ymm0 ; moves the packed floats from ymm0 into ymm1
    
    ;VMOVDQU — Move Unaligned Packed Integer Values
    mov rdx, offset mem256b ; moves the address of mem256b into rdx
    vmovdqu ymm0, ymmword ptr [rdx] ; moves the packed dwords from mem256b into ymm0

    ;VMOVDQA — Move Aligned Packed Integer Values
    ;When MOV between registers it is best to use the aligned version.
    vmovdqa ymm1, ymm0 ; moves the packed dwords from ymm0 into ymm1
    
    mov r8, sizeof ymmword ;256 bits == 32 bytes

    ret ; return to caller
Main endp
end
