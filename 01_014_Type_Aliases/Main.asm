int64 typedef sqword ; signed quad word
int32 typedef sdword ; signed double word
signed typedef sdword ; signed double word
unsigned typedef dword ; unsigned double word
float typedef real4 ; single precision real
bool typedef byte ; boolean

.const ; constants
FALSE equ 0 ; equ is used to define constants
TRUE equ 1

.data ; data segment
check bool FALSE ; check is a boolean variable initialized to FALSE
half float 0.5 ; half is a real variable initialized to 0.5
num1 int64 12345 ; num1 is a signed quad word variable initialized to 12345

.code ; code segment
Main proc ; main procedure
    mov rdx, offset num1 ; moves address of num1 into rdx
    mov rax, int64 ptr [rdx] ; moves value of num1 into rax
    
    mov r8, sizeof int64 ; 8 bytes
    mov r9, sizeof bool ; 1 byte

    ret ; return to caller
Main endp
end
