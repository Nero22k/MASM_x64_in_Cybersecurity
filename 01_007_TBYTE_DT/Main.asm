;„These statements (FWORD, TBYTE) were originally intended for 
;floating point and BCD values. There are better directives for 
;the floating point variables and you do not need to concern yourself
;with the other data types you would use these directives for.”
;
;Randall Hyde, 1996 – The Art of Assembly Language

.data
myTbyte tbyte 1 ; 10 bytes
myTbyte1 dt 1 ; 10 bytes

.code
Main proc
    mov rdx, offset myTbyte ; get address of myTbyte variable and store it in rdx
    
    ;sizeof myTbyte == 10 bytes == 80 bits
    mov r8, sizeof myTbyte

    ret
Main endp
end
