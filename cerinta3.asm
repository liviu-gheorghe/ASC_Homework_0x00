.data

sirInput: .space 1001
sep: .asciz " "
writeFormat: .asciz "%s\n"
readInputFormat: .asciz "%[^\n]"
tokenCurentPtr: .space 4
lenToken: .long 0
isNr: .space 1
nrCurent: .space 4
et_loop_Ctr: .long 0
rez: .long 4
valori_vars: .space 104
val_varCurent: .space 1
writeNrFormat: .asciz "Numarul este %d\n"
writeNewlineFormat: .asciz "\n"
rezFormat: .asciz "%d"
debugFormat: .asciz "Tokenul este {%s}\n"
vfsFormat: .asciz "Nr din vf stivei este %d\n"

instrLet: .asciz "let"
instrAdd: .asciz "add"
instrSub: .asciz "sub"
instrMul: .asciz "mul"
instrDiv: .asciz "div"

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


leal valori_vars, %esi
leal sirInput, %edi


    mov $0x19, %ecx
    et_initValoriVals:
        movl $0x00, (%esi,%ecx,0x04)
        loop et_initValoriVals

    et_loop:
        movl tokenCurentPtr, %eax
        cmp $0x0 ,%eax
        je et_exit

        #pushl %eax
        #pushl $writeFormat
        #call printf 
        #popl %ebx
        #popl %ebx


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


et_exit:
    popl rez

    pushl rez 
    pushl $rezFormat
    call printf
    popl %ebx
    popl %ebx


    pushl $writeNewlineFormat
    call printf
    popl %ebx

    movl $0x1, %eax
    xorl %ebx, %ebx
    int $0x80


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


    et_opEnd:
    jmp et_loopC2


et_InstrLet:

popl %eax #t2 
popl %ebx #t1
movl %eax, (%esi, %ebx, 0x04)
jmp et_opEnd

et_InstrAdd:

    popl %eax
    popl %ebx
    addl %ebx, %eax
    pushl %eax

    jmp et_opEnd

et_InstrSub:

    popl %eax
    popl %ebx
    subl %eax, %ebx
    pushl %ebx

    jmp et_opEnd

et_InstrMul:

    popl %eax
    popl %ebx
    imull %ebx
    pushl %eax

    jmp et_opEnd

et_InstrDiv:
    xorl %edx, %edx
    popl %ebx
    popl %eax 
    idivl %ebx 
    pushl %eax
    
    jmp et_opEnd



et_var:

    movl tokenCurentPtr, %eax
    xorl %ebx, %ebx
    xorl %ecx, %ecx
    movb (%eax), %bl
    subl $0x61, %ebx
    et_210:movl (%esi, %ebx, 0x04), %ecx
    cmp $0x0, %ecx
    je et_ProcVarCV
    jne et_ProcVarUV

    et_varEnd:
        jmp et_loopC2


et_ProcVarUV:
    pushl %ecx
    jmp et_varEnd

et_ProcVarCV:
    pushl %ebx
    jmp et_varEnd

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


et_ProcNr:

    pushl nrCurent
    jmp et_loopC2



