
; © ethical.blue Magazine // Cybersecurity clarified.

extrn MessageBoxA : proc
extrn ExitProcess : proc

.const
ONE equ 1 ;1
TWO equ ONE+ONE ;2
TRUE equ 1 ;1
FALSE equ 0 ;0
NULL equ 0 ;0
MINUS1 equ -1 ;0FFFFFFFFFFFFFFFFh
LETTER_A equ 'A' ;041h == 65d
CAPTION01 equ "Question", 0 ;text
NOT0FF equ NOT 0FFh ;0FFFFFFFFFFFFFF00h

;for MessageBoxA
IDOK equ 1
MB_OKCANCEL equ 00000001h

.data
szCaption db CAPTION01
szText db "Are you sure that you want to enter "
       db "the world of Windows x64 Assembly Language?", 0

.code
Main proc
    sub rsp, 28h

    ;debug me!
    mov rax, ONE
    mov rax, TWO
    mov rax, TRUE
    mov rax, FALSE
    mov rax, NULL
    mov rax, MINUS1
    mov al, LETTER_A
    mov al, 'A'
    mov rax, offset szCaption
    mov rax, NOT0FF
    
_again:
    mov r9, MB_OKCANCEL
    lea r8, szCaption
    lea rdx, szText
    xor rcx, rcx
    call MessageBoxA
    
    cmp rax, IDOK
    jne _again

_exit:
    xor rcx, rcx
    call ExitProcess
Main endp
end
