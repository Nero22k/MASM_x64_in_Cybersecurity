extrn MessageBoxA : proc
extrn ExitProcess : proc

.data
szText db "I am learning "
       db "Microsoft x64 "
       db "calling convention.", 0

.code
Main proc
    sub rsp, 28h ;(4 * 8) + 8 + 8 = 32 + 8 + 8 = 48
                 ;48 / 16 = 3

    xor r9, r9 ;fourth parameter
    lea r8, szText ;third parameter
    lea rdx, szText ;second parameter
    xor rcx, rcx ;first parameter
    call MessageBoxA ;function/procedure calling

    xor rcx, rcx
    call ExitProcess ; exits the program with exit code 0
Main endp
end