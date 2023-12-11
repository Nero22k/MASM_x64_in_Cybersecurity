extrn MessageBoxW : proc ; MessageBoxW(HWND hWnd, LPCWSTR lpText, LPCWSTR lpCaption, UINT uType)
extrn MultiByteToWideChar : proc ; MultiByteToWideChar(UINT CodePage, DWORD dwFlags, LPCSTR lpMultiByteStr, int cbMultiByte, LPWSTR lpWideCharStr, int cchWideChar)
extrn ExitProcess : proc ; ExitProcess(UINT uExitCode)

.const ; constants
CP_UTF8 equ 65001 ; UTF-8 code page

.data ; data segment
multibyteText db "Мова Aсемблера (Mova Asemblera)", 0 ; Some text in Russian
wideText db 512 dup(0) ; Buffer for wide characters

.code ; code segment
Main proc
    sub rsp, 38h ; Allocate stack space for 56 bytes (38h)

    mov qword ptr [rsp+28h], sizeof wideText ; Set the size of the buffer for wide characters to 512 bytes and save it on the stack
    lea rdx, wideText ; Set the address of the buffer for wide characters
    mov qword ptr [rsp+20h], rdx ; Save the address of the buffer for wide characters on the stack
    mov r9, sizeof multibyteText ; Set the size of the buffer for multibyte characters to 38 bytes
    lea r8, multibyteText ; Set the address of the buffer for multibyte characters
    xor rdx, rdx ; Set the address of the buffer for wide characters to 0
    mov rcx, CP_UTF8 ; Set the code page to UTF-8
    call MultiByteToWideChar ; Convert multibyte characters to wide characters

    xor r9, r9 ; Set uType to 0
    lea r8, wideText ; Set lpCaption to the address of the buffer for wide characters
    lea rdx, wideText ; Set lpText to the address of the buffer for wide characters
    xor rcx, rcx ; Set hWnd to 0
    call MessageBoxW ; Display a message box

    xor rcx, rcx ; Set uExitCode to 0
    call ExitProcess ; Exit the process
Main endp
end
