; Below is a list of data types and their sizes in bytes (8 bits)

.data
myByte byte 1
mySByte1 sbyte -1
mySByte2 sbyte +1
myByteA db 1

.code
Main proc
    mov myByte, 7 ; set myByte to 7
    mov al, myByte ; set al to myByte
    mov rdx, offset myByte ; set rdx to address of myByte alternative to using macro {offset} is to use [lea] rdx, myByte
    mov byte ptr [rdx], 5 ; set myByte to 5 using the address in rdx
    
    ;sizeof myByte == 1 byte
    mov r8, sizeof myByte ; set r8 to 1 byte because myByte is a byte

    ret
Main endp
end
