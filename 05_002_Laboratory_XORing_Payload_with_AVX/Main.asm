
extrn CreateFileA : proc
extrn GetFileSizeEx : proc
extrn VirtualAlloc : proc
extrn VirtualFree : proc
extrn ReadFile : proc
extrn WriteFile : proc
extrn CloseHandle : proc
extrn ExitProcess : proc

include Constants.inc

.data
szFileName db "C:\\Users\\Nero\\Desktop\\bytes.hex", 0
szDestFileName db "C:\\Users\\Nero\\Desktop\\bytes_XORed.hex", 0
keyForXOR dword 77777777h, 77777777h, 77777777h, 77777777h
          dword 77777777h, 77777777h, 77777777h, 77777777h
bufferSize qword 0
remainder qword 0
readWritten dword 0

.data?  ; uninitialized data
hFile qword ?
hDestFile qword ?
pMemory qword ?

.code
Main proc
    sub rsp, 38h    ; reserve stack space for local variables and arguments (56 bytes)

    mov qword ptr [rsp+30h], 0
    mov qword ptr [rsp+28h], FILE_ATTRIBUTE_NORMAL
    mov qword ptr [rsp+20h], OPEN_EXISTING
    xor r9, r9
    xor r8, r8
    mov rdx, GENERIC_READ
    mov rcx, offset szFileName
    call CreateFileA
    mov hFile, rax
    test rax, rax
    jz _exit

    lea rdx, bufferSize
    mov rcx, hFile
    call GetFileSizeEx
    test rax, rax
    jz _exit

_align_data:            ; align data to 32 bytes
    mov rax, bufferSize
    cqo
    mov rcx, 32
    div ecx
    mov remainder, rdx
    cmp rdx, 0
    je _alloc_memory

    mov r9, 32
    sub r9, rdx

    add bufferSize, r9

_alloc_memory:          ; allocate memory for file content
    mov r9, PAGE_READWRITE
    mov r8, MEM_RESERVE
    mov rdx, bufferSize
    xor rcx, rcx
    call VirtualAlloc
    mov pMemory, rax
    test rax, rax
    jz _exit

    mov r9, PAGE_READWRITE
    mov r8, MEM_COMMIT
    mov rdx, bufferSize
    mov rcx, pMemory
    call VirtualAlloc
    mov pMemory, rax
    test rax, rax
    jz _exit

    mov qword ptr [rsp+20h], 0
    lea r9, readWritten
    mov r8, bufferSize
    mov rdx, pMemory
    mov rcx, hFile
    call ReadFile
    test rax, rax
    jz _exit

    mov rcx, hFile
    call CloseHandle

    xor rcx, rcx
    mov rdx, pMemory

    mov r8, offset keyForXOR
    vmovdqu ymm2, ymmword ptr [r8]

_xor_payload:           ; XOR payload with key (32 bytes at a time)
    vpxor ymm1, ymm2, ymmword ptr [rdx + rcx]
    vmovdqu ymmword ptr [rdx + rcx], ymm1

    inc rcx
    cmp rcx, bufferSize
    jbe _xor_payload

    mov qword ptr [rsp+30h], 0
    mov qword ptr [rsp+28h], FILE_ATTRIBUTE_NORMAL
    mov qword ptr [rsp+20h], CREATE_ALWAYS
    xor r9, r9
    xor r8, r8
    mov rdx, GENERIC_WRITE
    mov rcx, offset szDestFileName
    call CreateFileA
    mov hDestFile, rax
    test rax, rax
    jz _exit

    mov qword ptr [rsp+20h], 0
    lea r9, readWritten
    mov r8, bufferSize
    mov rdx, pMemory
    mov rcx, hDestFile
    call WriteFile
    test rax, rax
    jz _exit

    mov rcx, hDestFile
    call CloseHandle

    mov r8, MEM_RELEASE
    xor rdx, rdx
    mov rcx, pMemory
    call VirtualFree

_exit:
    xor rcx, rcx
    call ExitProcess
Main endp
end
