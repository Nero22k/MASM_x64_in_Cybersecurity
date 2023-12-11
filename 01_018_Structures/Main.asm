extrn MessageBoxA : proc ; MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType)
extrn ExitProcess : proc ; ExitProcess(UINT uExitCode)

potion struct ; defines a potion structure
    itemName byte 128 dup(0) ; array of 128 bytes set to 0
    price real4 0.0 ; 4 byte floating point number set to 0.0
    healthBonus qword 0 ; 8 byte integer set to 0
    manaBonus qword 0 ; 8 byte integer set to 0
potion ends

.data ; data segment
healthPotion1 potion <"Small health potion", 9.99, 10, 0> ; creates a potion structure with the given values

.code ; code segment
Main proc
    sub rsp, 28h ; allocate 40 bytes on the stack (28h)
    xor r9, r9 ; set r9 to 0
    lea r8, healthPotion1.itemName ; set r8 to the address of healthPotion1.itemName
    lea rdx, healthPotion1.itemName ; set rdx to the address of healthPotion1.itemName
    xor rcx, rcx
    call MessageBoxA ; display a message box with the text in healthPotion1.itemName
    
    xor rcx, rcx
    call ExitProcess
Main endp
end
