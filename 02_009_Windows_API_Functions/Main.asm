
extrn InternetOpenA : proc
extrn InternetOpenUrlA : proc
extrn InternetReadFile : proc
extrn InternetCloseHandle : proc
extrn MessageBoxA : proc
extrn ExitProcess : proc

includelib Wininet.lib

.const
INTERNET_OPEN_TYPE_PRECONFIG equ 0
INTERNET_FLAG_RELOAD equ 80000000h

.data
szUserAgent db "xyz", 0
szURL db "https://ethical.blue/uploads/win64asm.txt", 0
szData db 1024 dup(0)

.data?
hInet dq ?
hFile dq ?
dwReadWritten dd ?

.code
Main proc
    sub rsp, 38h

    mov dword ptr [rsp + 20h], 0
    xor r9d, r9d
    xor r8d, r8d
    xor edx, edx
    lea rcx, szUserAgent
    call InternetOpenA
    mov hInet, rax
    test rax, rax
    jz _error

    mov qword ptr [rsp + 28h], 0  
    mov dword ptr [rsp + 20h], INTERNET_FLAG_RELOAD
    xor r9d, r9d
    xor r8d, r8d
    lea rdx, szURL
    mov rcx, hInet
    call InternetOpenUrlA
    mov hFile, rax
    test rax, rax
    jz _error

    lea r9, dwReadWritten
    mov r8d, sizeof szData - 1
    lea rdx, szData
    mov rcx, hFile
    call InternetReadFile
    test rax, rax
    jz _error

    mov rdx, offset szData
    mov ecx, dwReadWritten
    mov byte ptr [rdx + rcx], 0

    mov rcx, hFile
    call InternetCloseHandle
    test rax, rax
    jz _error

    mov rcx, hInet
    call InternetCloseHandle
    test rax, rax
    jz _error

    xor r9, r9
    lea r8, szURL
    lea rdx, szData
    xor rcx, rcx
    call MessageBoxA

_error:
    ;TODO: Error handling

    xor rcx, rcx
    call ExitProcess
Main endp
end