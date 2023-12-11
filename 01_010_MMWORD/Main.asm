.data ; data segment
mem64 mmword 1.25 ; 64-bit memory location
;mem64_2 mmword 6     ;wrong initializer
;mem64_3 mmword 0BADh ;wrong initializer

.code ; code segment
Main proc
    mov rax, 7 ; move 7 into rax
    
    ;MOVQ — Move Quadword
    ;Copies a quadword from the second operand to the first operand.
    ;The source and destination operands can be MMX technology registers,
    ;XMM registers or 64-bit memory locations.
    movq mm0, rax ; move 7 into mm0
    movq mm1, mem64 ; move 1.25 into mm1

    mov r8, sizeof mmword ;8 bytes = 64 bits

    ret
Main endp
end
