
.data ; data segment
mem64a qword 0FF00FF0000FF00FFh ; 64-bit memory operand
mem64b qword 000FF00FF00FFFF00h ; 64-bit memory operand

.code ; code segment
Main proc
    movq mm0, mem64a ;MOVQ - Move Quadword
    movq mm1, mem64b ;MOVQ - Move Quadword

    ;Logical AND
    ;MM0 = 0xff00ff0000ff00ff
    ;MM1 = 0x00ff00ff00ffff00
    ;------------------------
    ;MM0 = 0x0000000000ff0000
    pand mm0, mm1 ;PAND - Bitwise logical AND

    ;------------------------------------------------

    movq mm0, mem64a ;MOVQ - Move Quadword
    movq mm1, mem64b ;MOVQ - Move Quadword

    ;Logical AND NOT
    ;MM0 = 0xff00ff0000ff00ff
    ;MM1 = 0x00ff00ff00ffff00
    ;------------------------
    ;MM0 = 0x00ff00ff0000ff00
    pandn mm0, mm1 ;PANDN - Bitwise logical AND NOT

    ;------------------------------------------------

    movq mm0, mem64a ;MOVQ - Move Quadword
    movq mm1, mem64b ;MOVQ - Move Quadword

    ;Logical OR
    ;MM0 = 0xff00ff0000ff00ff
    ;MM1 = 0x00ff00ff00ffff00
    ;------------------------
    ;MM0 = 0xffffffff00ffffff
    por mm0, mm1 ;POR - Bitwise logical OR

    ;------------------------------------------------

    movq mm0, mem64a ;MOVQ - Move Quadword
    movq mm1, mem64b ;MOVQ - Move Quadword

    ;Logical exclusive OR
    ;MM0 = 0xff00ff0000ff00ff
    ;MM1 = 0x00ff00ff00ffff00
    ;------------------------
    ;MM0 = 0xffffffff0000ffff
    pxor mm0, mm1 ;PXOR - Bitwise logical exclusive OR

    ;------------------------------------------------

    mov rax, 00000001000000010000000100000001b
    movq mm0, rax ;MOVQ - Move Quadword

    ;Shift packed words left logical
    ;MM0 = 0...00000001000000010000000100000001b
    ;Counter = 2 bits
    ;------------------------
    ;MM0 = 0...00000100000001000000010000000100b
    psllw mm0, 2 ;PSLLW - Shift packed words left logical.

    ;More:
    ;PSLLW - Shift packed words left logical.
    ;PSLLD - Shift packed doublewords left logical.
    ;PSLLQ - Shift packed quadword left logical.
    ;PSRLW - Shift packed words right logical.
    ;PSRLD - Shift packed doublewords right logical.
    ;PSRLQ - Shift packed quadword right logical.
    ;PSRAW - Shift packed words right arithmetic.
    ;PSRAD - Shift packed doublewords right arithmetic.

    ret
Main endp
end
