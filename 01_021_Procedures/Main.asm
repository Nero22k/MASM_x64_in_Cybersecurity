
extrn MessageBoxA : proc
extrn ExitProcess : proc

.data
szCaption db "Information", 0
szText db "Nested procedures example.", 0

.code

include procedures.inc ; this file contains the definition of the procedures used in this example

Main proc
    sub rsp, 28h ; reserve stack space for the call to MessageBoxA - 40 bytes == args + return address (4x8 bytes) + 8 bytes return address
    call Nested1 ; call the first nested procedure and return address will be saved on the stack
    
    xor rcx, rcx ; rcx = 0
    call ExitProcess ; exit the program
Main endp
end
