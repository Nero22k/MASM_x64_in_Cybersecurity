
.data
pResult qword 0

.code
AddProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vaddps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
AddProc endp

SubProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vsubps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
SubProc endp

MulProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vmulps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
MulProc endp

DivProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vdivps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
DivProc endp

AndProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vandps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
AndProc endp

AndNProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vandnps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
AndNProc endp

OrProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vorps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
OrProc endp

XorProc proc
    push rbp
    mov rbp, rsp

    mov pResult, r8

    vmovups ymm3, [rdx]
    vmovups ymm2, [rcx]
    vxorps ymm1, ymm2, ymm3

    mov r8, pResult
    vmovups [r8], ymm1

    leave
    ret
XorProc endp

end
