.data ; data segment
var1 byte 1, 2, 3, 4, 5, 6, 7 ;array with 7 byte elements
var2 word 1, 2, 3, 4, 5, 6, 7 ;array with 7 word elements
var3 dword 1, 2, 3, 4, 5, 6, 7 ;array with 7 dword elements
var4 qword 1, 2, 3, 4, 5, 6, 7 ;array with 7 qword elements

;array with 2048 quadword elements
;initialized with zero
bigArray1 qword 2048 dup(0)

;array with 512 byte elements
;initialized with letter a
bigArray2 byte 512 dup('a')

;multiline arrays
payload byte 090h, 090h, 090h, 090h, 090h, 090h
        byte 090h, 090h, 090h, 090h, 090h
        byte 090h, 090h, 090h, 0C3h
        
payload2 byte 090h, 090h, 090h, 090h, 090h, 090h, \
         090h, 090h, 090h, 090h, 090h, 090h, \
         090h, 090h, 090h, 090h, 0C3h

.code ; code segment
; rdx - base address of array
; rcx - index of element
; scale - sizeof element
; Displacement - usually zero
; rax - result
Main proc
    xor rax, rax ; clear rax
    lea rdx, var1 ; load address of var1 into rdx
    mov rcx, 4 ;access 5th element (from zero!)
    mov al, byte ptr [rdx + rcx * sizeof byte] ; loads 5th element from var1 array into al
    
    xor rax, rax ; clear rax
    lea rdx, var2 ; load address of var2 into rdx
    mov rcx, 3 ;access 4th element (from zero!)
    mov ax, word ptr [rdx + rcx * sizeof word]
    
    xor rax, rax
    lea rdx, var3
    mov rcx, 2 ;access 3rd element (from zero!)
    mov eax, dword ptr [rdx + rcx * sizeof dword]
    
    xor rax, rax
    lea rdx, var4
    mov rcx, 1 ;access 2nd element (from zero!)
    mov rax, qword ptr [rdx + rcx * sizeof qword]

    xor rax, rax
    lea rdx, payload
    mov al, byte ptr [rdx] ; loads first byte from payload into rax
    
    ret
Main endp
end
