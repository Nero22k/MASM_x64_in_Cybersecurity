
myUnion union ; create a union named myUnion with 3 members of different sizes
    var1 dword 0
    var2 qword 0
    var3 qword 0
myUnion ends

.data ; data segment
union1 myUnion <7> ; create a variable named union1 of type myUnion and initialize it with 7

.code ; code segment
Main proc
    mov r8d, union1.var1 ; r8d = 7
    mov r9, union1.var2 ; r9 = 7
    mov r10, union1.var3 ; r10 = 7
    
    ;sizeof myUnion == sizeof qword == 8 bytes
    mov r8, sizeof myUnion

    ret
Main endp
end
