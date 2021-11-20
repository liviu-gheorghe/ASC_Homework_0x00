.data


n: .long 0
m: .long 0
sirInput: .space 1001
sep: .asciz " "
writeFormat: .asciz "%s\n"
writeNewlineFormat: .asciz "\n"
writeMDimFormat: .asciz "%d %d "
readInputFormat: .asciz "%[^\n]"
tokenCurentPtr: .space 4
intWriteFormat: .asciz "%d "
diWF: .asciz "Numarul este %d,nr_ap_var = %d, counterNr=%d\n"
lenToken: .long 0
matrix: .space 4000
rotMatrix: .space 4000
nxm: .long 0
nrCurent: .long 0
counterNr: .long 0
counterNrMatrix: .long 0
nr_ap_var: .long 0
operand: .long 0
elCurent: .long 0
loopAddCtr: .long 0
loopSubCrt: .long 0
loopMulCrt: .long 0
loopDivCrt: .long 0
loopRotCrt: .long 0
loopSM: .long 0
writeNFormat: .asciz "\nUpdate n la valorea %d\n"
writeMFormat: .asciz "\nUpdate m la valorea %d\n"
addInstr: .asciz "Instr add\n"
iter_i: .long 0
iter_j: .long 0
eaxDEBUG: .long 0


dbBf: .asciz "Pentru elem de pe poz %d avem indecsii i = %d ,  j = %d\n"
dbBf1: .asciz "Pentru elem curent luam elementul matrix[%d]\n"


writeAdddElemFormat: .asciz "Se adauga in matrice elementul %d pe pozitia %d\n"

instrLet: .asciz "let"
instrAdd: .asciz "add"
instrSub: .asciz "sub"
instrMul: .asciz "mul"
instrDiv: .asciz "div"
instrRot90d: .asciz "rot90d"

.text

.global main

main:

pushl $sirInput
pushl $readInputFormat
call scanf
popl %ebx
popl %ebx


pushl $sep
pushl $sirInput
call strtok
popl %ebx
popl %ebx
movl %eax, tokenCurentPtr

leal sirInput, %edi
movl $matrix, %esi


    et_loop:
        movl tokenCurentPtr, %eax
        cmp $0x00, %eax
        je et_exit

        pushl tokenCurentPtr
        call strlen
        popl %ebx
        movl %eax, lenToken

       et_loopC0:
          jmp et_numar

        et_loopC1:
          jmp et_op

        et_loopC2:

        pushl $sep
        pushl $0x0
        call strtok
        popl %ebx
        popl %ebx
        movl %eax, tokenCurentPtr
        jmp et_loop

et_op:
        pushl tokenCurentPtr
        pushl $instrLet
        call strcmp
        popl %ebx
        popl %ebx
        cmp_let:cmp $0x00, %eax
        je et_InstrLet


        pushl tokenCurentPtr
        pushl $instrAdd
        call strcmp
        popl %ebx
        popl %ebx
        cmp $0x00, %eax  
        je et_InstrAdd


        pushl tokenCurentPtr
        pushl $instrSub
        call strcmp
        popl %ebx
        popl %ebx
        cmp $0x00, %eax  
        je et_InstrSub

        pushl tokenCurentPtr
        pushl $instrMul
        call strcmp
        popl %ebx
        popl %ebx
        cmp_mul:cmp $0x00, %eax  
        je et_InstrMul


        pushl tokenCurentPtr
        pushl $instrDiv
        call strcmp
        popl %ebx
        popl %ebx
        cmp $0x00, %eax  
        je et_InstrDiv

        pushl tokenCurentPtr
        pushl $instrRot90d
        call strcmp
        popl %ebx
        popl %ebx
        cmp $0x00, %eax  
        je et_InstrRot


    et_opEnd:
    jmp et_loopC2


et_InstrLet:

jmp et_opEnd

et_InstrAdd:

    pushl m
    pushl n 
    pushl $writeMDimFormat
    call printf
    popl %ebx
    popl %ebx
    popl %ebx 


    movl $0x00, nxm
    xorl %eax, %eax
    movl n, %eax
    movl m, %ebx
    imul %ebx
    movl %eax, nxm

    popl %edx
    movl %edx, operand

    movl nxm, %ebx
    movl $0x00, loopAddCtr

    et_loopAdd:
  
        movl loopAddCtr, %ecx
        cmp nxm, %ecx
        je et_opEnd
        movl %ebx, %ecx
        movl nxm, %edx
        movl loopAddCtr, %ebx        
        xorl %eax, %eax
        movl (%esi, %ebx, 0x04), %eax
        addl operand, %eax
        movl %eax, elCurent

        pushl elCurent
        pushl $intWriteFormat 
        call printf
        popl %eax
        popl %eax
        incl loopAddCtr
        jmp et_loopAdd


    jmp et_opEnd

et_InstrSub:

     pushl m
     pushl n 
     pushl $writeMDimFormat
     call printf
     popl %ebx
     popl %ebx
     popl %ebx 

    movl $0x00, nxm
    xorl %eax, %eax
    movl n, %eax
    movl m, %ebx
    imul %ebx
    movl %eax, nxm

    popl %edx 
    movl %edx, operand

    movl nxm, %ebx
    movl $0x00, loopSubCrt

    et_loopSub:
  
        movl loopSubCrt, %ecx
        cmp nxm, %ecx
        je et_opEnd
        movl %ebx, %ecx
        movl nxm, %edx
        movl loopSubCrt, %ebx        
        xorl %eax, %eax
        movl (%esi, %ebx, 0x04), %eax
        subl operand, %eax
        movl %eax, elCurent

        pushl elCurent
        pushl $intWriteFormat 
        call printf
        popl %eax
        popl %eax
        incl loopSubCrt
        jmp et_loopSub

    jmp et_opEnd

et_InstrMul:
     
    pushl m
    pushl n 
    pushl $writeMDimFormat
    call printf
    popl %ebx
    popl %ebx
    popl %ebx 

    movl $0x00, nxm
    xorl %eax, %eax
    movl n, %eax
    movl m, %ebx
    imul %ebx
    movl %eax, nxm

    popl %edx 
    movl %edx, operand

    movl nxm, %ebx
    movl $0x00, loopMulCrt

    et_loopMul:
  
        movl loopMulCrt, %ecx
        cmp nxm, %ecx
        je et_opEnd
        movl %ebx, %ecx
        movl nxm, %edx
        movl loopMulCrt, %ebx        
        xorl %eax, %eax
        movl (%esi, %ebx, 0x04), %eax
        movl operand, %ebx
        imull %ebx
        movl %eax, elCurent

        pushl elCurent
        pushl $intWriteFormat 
        call printf
        popl %eax
        popl %eax
        incl loopMulCrt
        jmp et_loopMul

    jmp et_opEnd


et_InstrDiv:

    pushl m
    pushl n 
    pushl $writeMDimFormat
    call printf
    popl %ebx
    popl %ebx
    popl %ebx 

    movl $0x00, nxm
    xorl %eax, %eax
    movl n, %eax
    movl m, %ebx
    imul %ebx
    movl %eax, nxm

    popl %edx
    movl %edx, operand

    movl nxm, %ebx
    movl $0x00, loopDivCrt

    et_loopDiv:
  
        movl loopDivCrt, %ecx
        cmp nxm, %ecx
        je et_opEnd
        movl %ebx, %ecx
        movl nxm, %edx
        movl loopDivCrt, %ebx
        xorl %eax, %eax
        movl (%esi, %ebx, 0x04), %eax
        movl operand, %ebx
        cmp $0x00, %eax
        jl flipFrSigns
        et_loopDiv_Cont:
        xorl %edx, %edx
        idivl %ebx
        movl %eax, elCurent

        pushl elCurent
        pushl $intWriteFormat 
        call printf
        popl %eax
        popl %eax
        incl loopDivCrt
        jmp et_loopDiv

    jmp et_opEnd



et_InstrRot:


    pushl n
    pushl m 
    pushl $writeMDimFormat
    call printf
    popl %ebx
    popl %ebx
    popl %ebx 

    movl $0x00, nxm
    xorl %eax, %eax
    movl n, %eax
    movl m, %ebx
    imul %ebx
    movl %eax, nxm

    movl nxm, %ebx
    movl $0x00, loopRotCrt


    et_loopRot:
  
        movl loopRotCrt, %ecx
        cmp nxm, %ecx
        je et_opEnd

        xorl %edx, %edx
        movl loopRotCrt, %eax
        idivl n
        movl %eax, iter_i
        movl %edx, iter_j

        notl iter_j
        movl iter_j, %eax
        addl n, %eax
        imull m
        addl iter_i, %eax
        addl %eax, %eax
        addl %eax, %eax

        addl %esi, %eax
        mov (%eax), %ebx
        movl %ebx, elCurent

        pushl elCurent
        pushl $intWriteFormat 
        call printf
        popl %eax
        popl %eax
        incl loopRotCrt
        jmp et_loopRot


    jmp et_opEnd


et_var:

    incl nr_ap_var
    et_varEnd:
        jmp et_loopC2


et_numar:

    movl tokenCurentPtr, %eax
    xorl %ebx, %ebx
    movb (%eax), %bl
    movl %ebx, nrCurent
    subl $0x30, nrCurent
    cmp $0x30, %bl
    je et_ProcNr

    pushl %eax
    call atoi
    popl %ebx
    movl %eax, nrCurent
    cmp $0x00, %eax
    jne et_ProcNr

    mov lenToken, %eax
    cmp $0x01, %eax
    je et_var

    jmp et_loopC1


et_addOpToStack:
    pushl nrCurent
    jmp et_ProcNr_RealEnd

et_BPutMatrixElem:
    movl nr_ap_var, %eax
    cmp $0x01, %eax
    je et_putMatrixElem

    et_BPutMatrixElem_End:
        jmp et_ProcNr_End


et_exit:

    pushl $writeNewlineFormat
    call printf
    popl %ebx

    movl $0x01, %eax
    xorl %ebx, %ebx
    int $0x80


et_updateN:

    movl nrCurent, %eax
    movl %eax, n

    jmp et_ProcNr_Cont

et_updateM:

    movl nrCurent, %eax
    movl %eax, m
    jmp et_ProcNr_Cont


et_write_matrix:

    movl $0x00, nxm
    xorl %eax, %eax
    movl n, %eax
    movl m, %ebx
    imul %ebx
    movl %eax, nxm

    movl nxm, %ebx
    movl $0x00, loopSM

    et_loopSM:
  
        movl loopSM, %ecx
        cmp nxm, %ecx
        je et_write_matrix_End
        movl %ebx, %ecx
        movl nxm, %edx
        movl loopSM, %ebx        
        et_369:xorl %eax, %eax
        movl (%esi, %ebx, 0x04), %eax
        movl %eax, elCurent

        pushl elCurent
        pushl $intWriteFormat 
        call printf
        popl %eax
        popl %eax
        incl loopSM
        jmp et_loopSM


    et_write_matrix_End:
        
        pushl $0x00
        call fflush
        popl %ebx

    jmp et_exit


et_ProcNr:

    et_367: addl $1, counterNr
    et_247:movl counterNr, %eax
    cmp $0x01, %eax
    je et_updateN
    cmp $0x02, %eax
    je et_updateM
    et_ProcNr_Cont:
        movl counterNr, %eax
        cmp $0x03, %eax
        jge et_BPutMatrixElem
    

    et_ProcNr_End:
    mov nr_ap_var, %eax
    cmp $0x01, %eax
    jg et_addOpToStack
    
    et_ProcNr_RealEnd:
        jmp et_loopC2


et_putMatrixElem:


    movl $0x00, nxm
    xorl %eax, %eax
    movl n, %eax
    movl m, %ebx
    imul %ebx
    movl %eax, nxm

    movl counterNr, %eax
    subl $0x03, %eax
    movl nrCurent, %ebx

    movl %ebx, (%esi, %eax, 4)
    
    jmp et_BPutMatrixElem_End

flipFrSigns:
    notl %eax
    addl $0x01, %eax
    notl %ebx
    addl $0x01, %ebx
    jmp et_loopDiv_Cont
