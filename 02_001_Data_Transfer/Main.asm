
.const
SEVEN equ 07h

.data
var1 qword SEVEN
var2 qword 03h
var3 byte "Hello!", 0
var4 dword 01h, 02h, 03h, 04h ; var4 = 01020304h
var5 byte 10001110b ;08Eh

.code
Main proc
    mov rax, 02h
    mov rcx, rax
    mov var1, rcx

    ;error
    ;mov var2, var1

    mov rax, var1
    mov var2, rax

    mov rbx, offset var3
    mov byte ptr [rbx + 1], 'a'

    mov rbx, offset var4
    mov dword ptr [rbx + 2], 0FFh

    movzx rax, var5 ; rax = 000000000000008Eh (zero-extended)

    movsx rax, var5 ; rax = FFFFFFFFFFFFFFFF8Eh (sign-extended)

    lahf ; load ah with flags
    sahf ; store ah into flags

    mov rax, 01h
    mov rcx, 02h
    xchg rax, rcx ; swap rax and rcx registers

    mov rax, "GO BLUE!" ; strings up to 8 bytes are allowed in x64 registers

    bswap rax ; reverse the byte order of rax
    bswap rax ; reverse the byte order of rax

    xor rax, rax ; rax = 0
    cmovz rcx, var1 ; cmovz = conditional move if zero flag is set (rax = 0)

    ret
Main endp
end