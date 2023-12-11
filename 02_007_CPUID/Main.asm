
extrn MessageBoxA : proc
extrn ExitProcess : proc

.data
szCaption db "Information", 0
szBrand db 13 dup(0)

.code
Main proc
    xor rax, rax ;RAX = 00h function
    cpuid ; CPUID is a special instruction that returns processor identification and feature information in the EAX, EBX, ECX, and EDX registers.

    mov dword ptr [szBrand], ebx
    mov dword ptr [szBrand+4], edx
    mov dword ptr [szBrand+8], ecx

    sub rsp, 28h
    xor r9, r9
    lea r8, szCaption
    lea rdx, szBrand
    xor rcx, rcx
    call MessageBoxA

    xor rcx, rcx
    call ExitProcess
Main endp
end