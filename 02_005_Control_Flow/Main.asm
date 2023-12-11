
.code
Main proc
    xor rax, rax
    mov rcx, 13 ; rcx = Counter
@@:
    ;code here will be executed 13 times
    inc rax
loop @b

    mov rax, 1
    mov rcx, 2
    add rax, rcx
    cmp rax, 3 ; rax == 3
    je _seven ; jump if equal
    jmp _eight ; jump to _eight this will never be executed

_seven:
    mov rax, 7
    ret

_eight:
    mov rax, 8
    ret
Main endp
end