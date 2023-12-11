
; © ethical.blue Magazine // Cybersecurity clarified.

public _NtCreateFile

.code
_NtCreateFile proc

    mov r10, rcx
    mov rax, 055h ;Microsoft Windows [Version 10.0.22621.674]
    
    syscall
    ret

_NtCreateFile endp
end