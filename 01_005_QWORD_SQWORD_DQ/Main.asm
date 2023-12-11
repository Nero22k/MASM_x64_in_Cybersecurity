.data ; data segment
myQword qword 1 ; 8 bytes
mySQword1 sqword -1 ; 8 bytes (signed)
mySQword2 sqword +1
myQwordA dq 1 ; 8 bytes (unsigned)

.code ; code segment
Main proc ; main procedure
    mov myQword, 7 ; mov 7 into myQword
    mov rax, myQword ; mov myQword value into rax
    mov rdx, offset myQword ; mov myQword address into rdx
    mov qword ptr [rdx], 5 ; mov 5 into myQword using rdx as address pointer
    
    ;sizeof myQword == 8 bytes == 64 bits
    mov r8, sizeof myQword

    ret ; return
Main endp
end
