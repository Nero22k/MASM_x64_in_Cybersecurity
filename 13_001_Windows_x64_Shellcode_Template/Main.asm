
extrn ExitProcess : proc ;debug only

.code
    Main proc

        ;-- CUT HERE --
        push rbp
        push rbx
        push rdi
        push rsi
        push rsp
        push r12
        push r13
        push r14
        push r15
        
        mov r10, gs:[60h]
        mov r10, qword ptr [r10 + 18h]
        mov r11, qword ptr [r10 + 20h] 
        mov r10, qword ptr [r11]
        mov r11, qword ptr [r10]
        mov rbx, qword ptr [r11 + 20h]
        mov r9d, dword ptr [rbx + 3Ch]
        add r9, rbx
        add r9, 18h + 70h
        mov r11d, dword ptr [r9]
        lea r8, qword ptr [rbx + r11]
        mov ecx, dword ptr [r8 + 18h]
        mov r12d, dword ptr [r8 + 20h]
        add r12, rbx
        
        _search_loop:
        lea r10, qword ptr [r12 + rcx * sizeof dword]
        mov edi, dword ptr [r10]
        add rdi, rbx
        lea rsi, qword ptr [szGetProcAddress]
        
        _compare_str:
        cmpsb
        jne _function_not_found
        mov al, byte ptr [rsi]
        test al, al
        
        jz _function_found
        jmp _compare_str
        
        _function_not_found:
        loop _search_loop
        jmp _exit
        
        _function_found:
        mov r10d, dword ptr [r8 + 24h]
        add r10, rbx
        mov cx, word ptr [r10 + rcx * sizeof word]
        mov r10d, dword ptr [r8 + 1Ch]
        add r10, rbx
        mov eax, dword ptr [r10 + rcx * sizeof dword]
        add rax, rbx
        mov r15, rax
        
        ;********* OUR CODE GOES HERE *********

        mov rcx, "Ayra"
        push rcx
        mov rcx, "rbiLdaoL"
        push rcx
        mov rdx, rsp
        mov rcx, rbx ;kernel32.dll
        sub rsp, 30h
        call rax ;GetProcAddress
        add rsp, 30h + 10h
        ;RDI = LoadLibraryA
        mov rdi, rax
        
        mov rcx, "ll"
        push rcx
        mov rcx, "d.23resu"
        push rcx
        mov rcx, rsp
        sub rsp, 30h
        call rdi ;LoadLibraryA
        add rsp, 030h + 10h
        ;R14 = user32.dll
        mov r14, rax
        
        mov rcx, "Axo"
        push rcx
        mov rcx, "BegasseM"
        push rcx
        mov rdx, rsp
        mov rcx, r14
        sub rsp, 028h
        call r15 ;GetProcAddress
        add rsp, 28h + 10h
        ;R13 = MessageBoxA
        mov r13, rax
        
        ;MessageBoxA
        mov rdx, "!dlr"
        push rdx
        mov rdx, "ow eruce"
        push rdx
        mov rdx, "s ,olleH"
        push rdx
        mov rdx, rsp
        xor r9, r9
        xor r8, r8
        sub rsp, 28h
        xor rcx, rcx
        call r13 ;MessageBoxA
        add rsp, 28h + 18h
        
        pop r15
        pop r14
        pop r13
        pop r12
        pop rsp
        pop rsi
        pop rdi
        pop rbx
        pop rbp
        
        jmp _exit
            szGetProcAddress db "GetProcAddress", 0
        _exit:
        ;ret ;uncomment if Release

        ;-- CUT HERE --

        ;debug only
        sub rsp, 28h
        xor rcx, rcx
        call ExitProcess
        
    Main endp
end