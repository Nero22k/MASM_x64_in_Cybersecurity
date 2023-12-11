.data ; data segment
myOword oword 1 ; 128 bits == 16 bytes / 1 oword == 4 qwords / 8 dwords == 16 words

.code ; code segment
Main proc
    mov rdx, offset myOword
    
    ;sizeof myOword == 16 bytes == 128 bits
    mov r8, sizeof myOword
    
    ret
Main endp
end


