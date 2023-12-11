
extrn MessageBoxA : proc
extrn ExitProcess : proc

;create MessageBoxA macro
msgbox macro text, caption
    xor r9, r9
    lea r8, caption
    lea rdx, text
    xor rcx, rcx
    call MessageBoxA
endm

;create ExitProcess macro
bye macro
    xor rcx, rcx
    call ExitProcess
endm

.data
szCaption db "Information", 0
szText1 db "First MessageBoxA.", 0
szText2 db "Second MessageBoxA.", 0

.code
Main proc
    sub rsp, 28h
    msgbox szText1, szCaption
    msgbox szText2, szCaption

    bye
Main endp
end