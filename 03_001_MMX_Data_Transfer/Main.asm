
.data
mem64 mmword 1.0
myDword dword 0C0FFEEh
myQword qword 0ADD1C7EDh

.code
Main proc
    movd mm0, myDword ;MOVD - Move Doubleword
    movq mm1, myQword ;MOVQ - Move Quadword

    mov eax, 7
    movd mm0, eax

    mov rax, 8
    movq mm0, rax

    mov rcx, offset mem64
    movq mm1, mmword ptr [rcx]
    
    mov r8, sizeof mmword

    ret
Main endp
end