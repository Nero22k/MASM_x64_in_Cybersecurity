.data ; data segement
myWord word 1 ; 2 bytes (16 bits) value == WORD
mySWord1 sword -1 ; 2 bytes (16 bits) value == WORD (negative signed)
mySWord2 sword +1 ; 2 bytes (16 bits) value == WORD (positive signed)
myWordA dw 1 ; 2 bytes (16 bits) value == WORD (unsigned)

.code
Main proc
    mov myWord, 7 ; moves 7 into myWord in memory
    mov ax, myWord ; moves myWord into ax which is general purpose register (16 bits)
    lea rdx, myWord ; moves the address of myWord into rdx (64 bits)
    mov word ptr [rdx], 5  ; moves 5 into myWord in memory
    
    ;sizeof myWord == 2 bytes == 16 bits
    mov r8, sizeof myWord

    ret
Main endp
end
