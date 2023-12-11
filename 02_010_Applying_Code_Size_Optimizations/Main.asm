
.code
Main proc
    ;------------------------------------------------------------
    ;comparison
    ;------------------------------------------------------------
    cmp rax, 0    ;48 83 f8 00 (4 bytes)
    cmp eax, 0    ;83 f8 00    (3 bytes)
    test rax, rax ;48 85 c0    (3 bytes)
    test eax, eax ;85 c0       (2 bytes)

    ;------------------------------------------------------------
    ;loops
    ;------------------------------------------------------------
    ;48 31 c0 48 c7 c1 0d 00 00 00 48 ff c0 48 83 f9 0d 75 f7
    ;(19 bytes)
    xor rax, rax
    mov rcx, 13
@@:
    inc rax
    cmp rcx, 13
    jnz @b

    ;------------------------------------------------------------
    ;48 31 c0 48 c7 c1 0d 00 00 00 48 ff c0 e2 fb
    ;(15 bytes)
    xor rax, rax
    mov rcx, 13
@@:
    inc rax
    loop @b

    ;------------------------------------------------------------
    ;31 c0 b9 0d 00 00 00 ff c0 e2 fc
    ;(11 bytes)
    xor eax, eax
    mov ecx, 13
@@:
    inc eax
    loop @b

    ;------------------------------------------------------------
    ;zero register
    ;------------------------------------------------------------
    mov rax, 0    ;48 c7 c0 00 00 00 00 (7 bytes)
    sub rax, rax  ;48 29 c0             (3 bytes)
    xor rax, rax  ;48 31 c0             (3 bytes)
    xor eax, eax  ;31 c0                (2 bytes)

    ;------------------------------------------------------------
    ;register value exchange
    ;------------------------------------------------------------
    ;50 51 58 59
    ;(4 bytes)
    push rax
    push rcx
    pop rax
    pop rcx
    ;48 91
    ;(2 bytes)
    xchg rax, rcx

    ;------------------------------------------------------------
    ;avoiding REX prefix
    ;------------------------------------------------------------
    xor rax, rax ;48 31 c0 (3 bytes)
    xor eax, eax ;31 c0    (2 bytes)

    xchg rax, rcx ;48 91   (2 bytes)
    xchg eax, ecx ;91      (1 byte)

    ;...

    ret
Main endp
end