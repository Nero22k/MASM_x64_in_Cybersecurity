
Nested3 proc
    push rbp ; save stack frame onto the stack
    mov rbp, rsp ; set up new stack frame
    sub rsp, 50h ; allocate 80 bytes of stack space 48h + 8h = 50h

    xor r9, r9 ; clear r9
    lea r8, szCaption ; load address of caption into r8
    lea rdx, szText ; load address of text into rdx
    xor rcx, rcx ; clear rcx
    call MessageBoxA ; call MessageBoxA

    add rsp, 50h ; deallocate 80 bytes of stack space
    leave ; restore stack frame from the stack
    ret ; return to caller
Nested3 endp

Nested2 proc
    push rbp ; save stack frame onto the stack
    mov rbp, rsp ; set up new stack frame
    sub rsp, 40h ; allocate 64 bytes of stack space 38h + 8h = 40h

    call Nested3 ; call Nested3

    add rsp, 40h ; deallocate 64 bytes of stack space
    leave ; restore stack frame from the stack
    ret ; return to caller
Nested2 endp
    
Nested1 proc
    push rbp ; save stack frame onto the stack
    mov rbp, rsp ; set up new stack frame
    sub rsp, 30h ; allocate 48 bytes of stack space 28h + 8h = 30h

    call Nested2 ; call Nested2

    add rsp, 30h ; deallocate 48 bytes of stack space
    leave ; restore stack frame from the stack
    ret ; return to caller
Nested1 endp