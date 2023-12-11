
.data
sampleVar1 word 1010110001110111b
sampleVar2 word 0111101110110110b
beef qword 0BEEFh

.code
Main proc
    movzx r8d, sampleVar1 ;1010110001110111b
    movzx r9d, sampleVar2 ;0111101110110110b
    and r8d, r9d          ;0010100000110110b

    movzx r8d, sampleVar1 ;1010110001110111b
    movzx r9d, sampleVar2 ;0111101110110110b
    or r8d, r9d           ;1111111111110111b

    movzx r8d, sampleVar1 ;1010110001110111b
    movzx r9d, sampleVar2 ;0111101110110110b
    xor r8d, r9d          ;1101011111000001b

    mov rax, beef         ;0BEEFh
    xor rax, rax          ;0h

    movzx r8d, sampleVar1 ;1010110001110111b
    not r8d               ;0101001110001000b

    movzx r8d, sampleVar1 ;1010110001110111b
    movzx r9d, sampleVar2 ;0111101110110110b
    andn r8d, r8d, r9d    ;0010100000110110b

    mov rax, 3            ;3
    sub rax, 3            ;0
    test rax, rax         ; test if rax is 0

    ret
Main endp
end