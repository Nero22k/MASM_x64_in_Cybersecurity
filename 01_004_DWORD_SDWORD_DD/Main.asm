.data ; data segment
myDword dword 1 ; 32 bits == 4 bytes
mySDword1 sdword -1 ; 32 bits == 4 bytes (signed)
mySDword2 sdword +1 ; 32 bits == 4 bytes (signed) positive
myDwordA dd 1

.code
Main proc
    mov myDword, 7 ; mov 7 into myDword
    mov eax, myDword ; mov value of myDword into eax
    mov rdx, offset myDword ; mov address of myDword into rdx
    mov dword ptr [rdx], 5 ; mov 5 into myDword
    
    ;sizeof myDword == 4 bytes == 32 bits
    mov r8, sizeof myDword ; mov 4 bytes into r8

    ret
Main endp
end
