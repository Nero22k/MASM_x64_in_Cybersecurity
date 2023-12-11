
.code
my_procedure proc

    push rbp
    mov rbp, rsp

    mov rax, 08h

    leave
    ret

my_procedure endp

end
