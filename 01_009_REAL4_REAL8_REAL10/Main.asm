.data ; data segment
myReal4 real4 0.1 ; 4 bytes = 32 bits
myReal8 real8 0.2 ; 8 bytes = 64 bits
myReal10 real10 0.3 ; 10 bytes = 80 bits

num1 real8 0.25
num2 real8 0.15
num3 real8 0.0

.code ; code segment
Main proc ; main procedure
    ;FLD — Load Floating Point Value
    ;Pushes the source operand onto the FPU (x87) register stack.
    ;ST0 = num1
    fld num1

    ;FADD — Add operand to ST0 and store result in ST0.
    ;ST0 = ST0 + num2
    fadd num2

    ;Store result in variable (num3 = ST0)
    fstp num3

    mov r8, sizeof myReal4 ;4 bytes = 32 bits
    mov r9, sizeof myReal8 ;8 bytes = 64 bits
    mov r10, sizeof myReal10 ;10 bytes = 80 bits

    ret
Main endp
end
