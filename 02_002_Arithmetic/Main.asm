
.data
var2 qword 3

.code
Main proc
    ;************/ ADDITION /************;
    mov rax, 1
    add rax, 7

    ;************/ SUBTRACTION /************;
    mov rax, 8
    mov rcx, 1
    sub rax, rcx

    ;************/ SIGNED MULTIPLY /************;
    mov rax, 4
    mov r8, -4
    imul r8

    ;************/ UNSIGNED MULTIPLY /************;
    mov rax, 2
    mov rcx, 4
    mul rcx

    ;************/ SIGNED DIVIDE /************;
    ;RAX = -5 = 0xfffffffffffffffb
    mov rax, -5

    ;RDX:RAX = sign-extend of RAX.
    cqo

    ;signed divide RDX:RAX by mem64
    ;with result stored in RAX = Quotient, RDX = Remainder.
    idiv var2

    ;************/ UNSIGNED DIVIDE /************;
    mov rax, 5
    cqo
    mov rcx, 2
    div rcx

    ;************/ INCREMENT BY ONE /************;
    mov r8, 1
    inc r8
    inc r8
    inc r8

    ;************/ DECREMENT BY ONE /************;
    dec r8
    dec r8
    dec r8
    dec r8

    ;************/ TWO`S COMPLEMENT NEGATION /************;
    mov r9, 7
    neg r9

    ret
Main endp
end