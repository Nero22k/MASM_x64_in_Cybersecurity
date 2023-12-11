
.data
var1 qword 1
var2 dword 2
var3 word  3
var4 byte  4

.code
Main proc
    push var1 ; push var1 qword onto stack
    
    mov eax, var2
    push rax ; push var2 dword onto stack
    
    movzx rax, var3
    push rax ; push var3 word onto stack (movzx is used to zero-extend)
    
    movzx rax, var4
    push rax ; push var4 byte onto stack (movzx is used to zero-extend)
    
    pop r8 ; pop var4 byte from stack
    pop r9 ; pop var3 word from stack
    pop r10 ; pop var2 dword from stack
    pop r11 ; pop var1 qword from stack
    
    sub rsp, 8 ; allocate 8 bytes on stack
    mov qword ptr [rsp], 0DEADBEEFh ; store 0DEADBEEFh at the top of the stack this will overwrite var1
    
    pop rax ; pop 0DEADBEEFh from stack

    ret
Main endp
end
