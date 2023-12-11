
extrn MessageBoxA : proc
extrn ExitProcess : proc

.data
szCaption db "Information", 0
szErrorText db "Error while generating random number.", 0

.code
Main proc
    ;debug me!
    rdrand rcx ; rcx = random number
    jnc _error
    rdrand rcx
    jnc _error
    rdrand rcx
    jnc _error
    rdrand rcx
    jnc _error
    rdrand rcx
    jnc _error

    jmp _exit

_error:
    sub rsp, 28h
    xor r9, r9
    lea r8, szCaption
    lea rdx, szErrorText
    xor rcx, rcx
    call MessageBoxA

_exit:
    xor rcx, rcx
    call ExitProcess
Main endp
end