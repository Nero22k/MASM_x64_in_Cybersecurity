;„These statements (FWORD, TBYTE) were originally intended for 
;floating point and BCD values. There are better directives for 
;the floating point variables and you do not need to concern yourself
;with the other data types you would use these directives for.”
;
;Randall Hyde, 1996 – The Art of Assembly Language

.data
myFword fword 1 ; 6 bytes
myFword1 df 1 ; 6 bytes
myword dw 1 ; 2 bytes

.code
Main proc
    mov rdx, offset myFword1 ; move address of myFword1 to rdx
    
    ;sizeof myFword1 == 6 bytes == 48 bits
    mov r8, sizeof myFword1

    ret
Main endp
end
