
magicRune struct ; 150 bytes in size (128 + 4 + 8 + 8 + 1 + 1)
    runeName byte 128 dup(0)
    price real4 0.0
    union
        fireDamage  qword 0
        waterDamage qword 0
        airDamage   qword 0
        earthDamage qword 0
    ends
    manaCost qword 0
    struct
        poisoned byte 0
        cursed   byte 0
    ends
magicRune ends

.data
fireRune1 magicRune <"Fire rune", 14.99, <8>, 3, <0,0>>

.code
Main proc
    lea rax, fireRune1.runeName
    fld fireRune1.price ; loads price into st(0)
    mov rcx, fireRune1.fireDamage
    mov rdx, fireRune1.manaCost
    xor r8, r8
    mov r8b, fireRune1.poisoned
    xor r9, r9
    mov r9b, fireRune1.cursed
    
    ;150 bytes == 128 (runeName) + 4 (price) + 8 (union) + 
    ;             + 8 (manaCost) + 1 (poisoned) + 1 (poisoned)
    mov r8, sizeof magicRune

    ret
Main endp
end
