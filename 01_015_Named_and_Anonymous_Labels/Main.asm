.code ; code segment
Main proc

    mov rax, 3 ; moves 3 to rax
@@:
    dec rax ; decrements rax by 1
    test rax, rax ; tests if rax is 0
    jne @b ; jumps backwards if rax is not 0 to label @@

    mov rax, 9 ; moves 9 to rax
    jmp @f ; jumps fowards to label @@
    mov rax, 5
@@:
    sub rax, rax ; subtracts 9 from rax which holds 9 and stores result in rax
    jmp _exit ; jumps to _exit
    
_exit:
    ret ; returns 0
Main endp
end