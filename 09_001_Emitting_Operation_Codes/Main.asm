
extrn MessageBoxA : proc
extrn ExitProcess : proc

;create obfuscation macros
rogue_dword macro opcode
    jmp @f
    dd opcode
    @@:
endm

rogue_word macro opcode
    jmp @f
    dw opcode
    @@:
endm

rogue_byte macro opcode
    jmp @f
    db opcode
    @@:
endm

.data
szCaption db "Information", 0
szText db "Hello.", 0

.code
Main proc
    rogue_dword 0F30F38D8h ;obfuscation
    sub rsp, 28h
    rogue_word 00F66h ;obfuscation
    xor r9, r9
    rogue_byte 0E8h ;obfuscation
    lea r8, szCaption
    rogue_dword 0F30C3901h ;obfuscation
    lea rdx, szText
    rogue_byte 0E8h ;obfuscation
    xor rcx, rcx
    rogue_byte 0E8h ;obfuscation
    call MessageBoxA
    rogue_byte 0E8h ;obfuscation

    xor rcx, rcx
    call ExitProcess
Main endp
end