
public my_procedure

.code
my_procedure proc

    push rbp        ; pushes the base pointer onto the stack (saves it) stack frame
    mov rbp, rsp    ; moves the stack pointer into the base pointer (sets it) stack frame

    mov rax, 07h    ; moves 07h into rax

    leave           ; mov rsp, rbp; pop rbp
    ret             ; pops the return address off the stack and jumps to it

my_procedure endp
end