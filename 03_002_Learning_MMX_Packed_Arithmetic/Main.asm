
.data
mem64a qword 0FEFFFFFFFFFFFEFDh
mem64b qword 00101010101010101h

.code
Main proc
    movq mm0, mem64a ;MOVQ - Move Quadword
    movq mm1, mem64b ;MOVQ - Move Quadword
    paddb mm0, mm1 ;PADDB - Add packed byte integers.

    mov rax, 0FFFEFFFDFFFEFFFFh
    movq mm0, rax
    mov rax, 00001000100010001h
    movq mm1, rax
    paddw mm0, mm1 ;PADDW - Add packed word integers.

    mov rax, 0FFFFFFFAFFFFFFFFh
    movq mm0, rax
    mov rax, 00000000100000001h
    movq mm1, rax
    paddd mm0, mm1 ;PADDD - Add packed doubleword integers.

    ;More:
    ;PADDSB - Add packed signed byte integers with signed saturation.
    ;PADDSW - Add packed signed word integers with signed saturation.
    ;PADDUSB - Add packed unsigned byte integers with unsigned saturation.
    ;PADDUSW - Add packed unsigned word integers with unsigned saturation.

    movq mm0, mem64a ;MOVQ - Move Quadword
    movq mm1, mem64b ;MOVQ - Move Quadword
    psubb mm0, mm1 ;PSUBB - Subtract packed byte integers.

    ;More:
    ;PSUBW - Subtract packed word integers.
    ;PSUBD - Subtract packed doubleword integers.
    ;PSUBSB - Subtract packed signed byte integers with signed saturation.
    ;PSUBSW - Subtract packed signed word integers with signed saturation.
    ;PSUBUSB - Subtract packed unsigned byte integers with unsigned saturation.
    ;PSUBUSW - Subtract packed unsigned word integers with unsigned saturation.
    ;PMULHW - Multiply packed signed word integers and store high result.
    ;PMULLW - Multiply packed signed word integers and store low result.
    ;PMADDWD - Multiply and add packed word integers.

    ret
Main endp
end
