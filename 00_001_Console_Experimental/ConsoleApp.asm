
; Experimental code in this file.

include Header.inc

.data
szRAX db "RAX = ", 0

.code
Main proc
    sub rsp, 38h

    invoke_ConsoleWrite szRAX

    mov rax, 0DEADBEEFh

    invoke_ConsoleWriteHex rax
    invoke_ConsoleNewLine

    invoke_ConsoleReadKey

    invoke_Quit
Main endp
end