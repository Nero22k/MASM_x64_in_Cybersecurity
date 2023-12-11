
; © ethical.blue Magazine // Cybersecurity clarified.

extrn AllocConsole : proc
extrn GetStdHandle : proc
extrn WriteConsoleA : proc
extrn lstrlenA : proc
extrn ReadConsoleA : proc
extrn wsprintfA : proc
extrn FreeConsole : proc
extrn ExitProcess : proc

.const
STD_OUTPUT_HANDLE equ -11
STD_INPUT_HANDLE equ -10

.data
formatHex db "%#016x", 0
buffer db 1024 dup(0)
newLine db 13, 10, 0
szChar db 0

.data?
readWritten dword ?

invoke_ConsoleWrite macro text
    lea rcx, text
    call lstrlenA
    mov r13, rax

    mov rcx, STD_OUTPUT_HANDLE
    call GetStdHandle

    mov qword ptr [rsp+20h], 0
    lea r9, readWritten
    mov r8, r13
    lea rdx, text
    mov rcx, rax
    call WriteConsoleA
endm

invoke_ConsoleNewLine macro
    mov rcx, STD_OUTPUT_HANDLE
    call GetStdHandle

    mov qword ptr [rsp+20h], 0
    lea r9, readWritten
    mov r8, sizeof newLine
    lea rdx, newLine
    mov rcx, rax
    call WriteConsoleA
endm

invoke_ConsoleRead macro text
    mov rcx, STD_INPUT_HANDLE
    call GetStdHandle

    mov qword ptr [rsp+20h], 0
    lea r9, readWritten
    mov r8, sizeof text
    lea rdx, text
    mov rcx, rax
    call ReadConsoleA
endm

invoke_ConsoleReadKey macro
    mov rcx, STD_INPUT_HANDLE
    call GetStdHandle

    mov qword ptr [rsp+20h], 0
    lea r9, readWritten
    mov r8, sizeof szChar
    lea rdx, szChar
    mov rcx, rax
    call ReadConsoleA
endm

invoke_ConsoleWriteHex macro value
    mov r8, value
    lea rdx, formatHex
    lea rcx, buffer
    call wsprintfA

    lea rcx, buffer
    call lstrlenA
    mov r13, rax

    mov rcx, STD_OUTPUT_HANDLE
    call GetStdHandle

    mov qword ptr [rsp+20h], 0
    lea r9, readWritten
    mov r8, r13
    lea rdx, buffer
    mov rcx, rax
    call WriteConsoleA
endm

invoke_Quit macro
    xor rcx, rcx
    call ExitProcess
endm