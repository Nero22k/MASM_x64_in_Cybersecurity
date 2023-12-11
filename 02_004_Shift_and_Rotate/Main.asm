
.code
Main proc
    ;debug me to understand!
    mov r10, 1
    shl r10, 5 ; shifts left by 5 bits (Answer is 100000b)

    mov r10, 1
    sal r10, 5 ; shifts left by 5 bits (Answer is 100000b) keeps the sign bit

    mov r10, 010000000b
    shr r10, 2 ; shifts right by 2 bits (Answer is 001000000b)

    mov r10, 010000000b
    sar r10, 2 ; keeps the sign bit and shifts right by 2 bits (Answer is 111100000b)

    mov r10, 000000000000000Fh
    rol r10, 10h ; rotates left by 10 bits (Answer is 00000000000003Ch)

    mov r10, 0F000000000000000h
    rcl r10, 011h ; rotates left by 11 bits (Answer is 00000000000003Ch) keeps the sign bit

    mov r10, 000000000000000Fh
    ror r10, 10h ; rotates right by 10 bits (Answer is 00000000000003Ch)

    mov r10, 000000000000000Fh
    rcr r10, 11h ; rotates right by 11 bits (Answer is 00000000000003Ch) keeps the sign bit

    xor r9, r9
    xor rax, rax
    not rax ; rax = 1111111111111111b
    shld r9, rax, 3 ; shifts left by 3 bits (Answer is 1111111111111000b) keeps the sign bit

    xor r9, r9
    xor rax, rax
    not rax
    shrd r9, rax, 3 ; shifts right by 3 bits (Answer is 0001111111111111b) keeps the sign bit

    ret
Main endp
end