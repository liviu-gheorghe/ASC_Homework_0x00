.data

sir: .space 1001
readInputFormat: .asciz "%s"
writeOutputFormat: .asciz "%s"
writeInstrFormat: .asciz "%s "
writeIntFormat: .asciz "%d"
writeNewlineFormat: .asciz "\n"
sirLen: .long 0
hgIdx: .long 0
tipToken: .space 4
hexd: .space 12
num: .long 4
semn: .long 4
prod: .long 1
writeCharFormat: .asciz "%c "
printNumFormat: .asciz "%d "
printMinusNumFormat: .asciz "-%d "
instrLet: .asciz "let"
instrAdd: .asciz "add"
instrSub: .asciz "sub"
instrMul: .asciz "mul"
instrDiv: .asciz "div"


.text

.global main

main: 

    pushl $sir
    pushl $readInputFormat
    call scanf
    popl %ebx
    popl %ebx
    
    pushl $sir
    call strlen
    popl %ebx
    movl %eax, sirLen


    leal sir, %edi
    leal hexd, %esi
    xorl %ecx, %ecx

    et_forSirInput:
        pushl %ecx
        cmp sirLen, %ecx
        je et_exit
        jmp et_parseHexGroup
        et_forSirInputC1:
        popl %ecx
        add_ecx: addl $0x03, %ecx
        jmp et_forSirInput


et_parseHexGroup:

    pushl %ecx
    xorl %ebx, %ebx
    movb 0x00(%edi,%ecx,0x01), %bl

    movl $0x00, hgIdx
    movl $0x00, %edx


    cmp $0x30, %ebx
    je et_PHD00

    cmp $0x31, %ebx
    je et_PHD01

    cmp $0x32, %ebx
    je et_PHD02

    cmp $0x33, %ebx
    je et_PHD03

    cmp $0x34, %ebx
    je et_PHD04

    cmp $0x35, %ebx
    je et_PHD05

    cmp $0x36, %ebx
    je et_PHD06


    cmp $0x37, %ebx
    je et_PHD07


    cmp $0x38, %ebx
    je et_PHD08


    cmp $0x39, %ebx
    je et_PHD09


    cmp $0x41, %ebx
    je et_PHD10


    cmp $0x42, %ebx
    je et_PHD11


    cmp $0x43, %ebx
    je et_PHD12


    cmp $0x44, %ebx
    je et_PHD13


    cmp $0x45, %ebx
    je et_PHD14

    cmp $0x46, %ebx
    je et_PHD15

    et_PHGD2:

    popl %ecx

    pushl %ecx
    xorl %ebx, %ebx
    movb 0x01(%edi,%ecx,0x01), %bl
    movl $0x01, hgIdx
    movl $0x01, %edx




    cmp $0x30, %ebx
    je et_PHD00

    cmp $0x31, %ebx
    je et_PHD01

    cmp $0x32, %ebx
    je et_PHD02

    cmp $0x33, %ebx
    je et_PHD03

    cmp $0x34, %ebx
    je et_PHD04

    cmp $0x35, %ebx
    je et_PHD05

    cmp $0x36, %ebx
    je et_PHD06


    cmp $0x37, %ebx
    je et_PHD07


    cmp $0x38, %ebx
    je et_PHD08


    cmp $0x39, %ebx
    je et_PHD09


    cmp $0x41, %ebx
    je et_PHD10


    cmp $0x42, %ebx
    je et_PHD11


    cmp $0x43, %ebx
    je et_PHD12


    cmp $0x44, %ebx
    je et_PHD13


    cmp $0x45, %ebx
    je et_PHD14

    cmp $0x46, %ebx
    je et_PHD15



    et_PHGD3:
    popl %ecx

    pushl %ecx
    xorl %ebx, %ebx
    movb 0x02(%edi,%ecx,0x01), %bl
    movl $0x02, hgIdx
    movl $0x02, %edx


    cmp $0x30, %ebx
    je et_PHD00

    cmp $0x31, %ebx
    je et_PHD01

    cmp $0x32, %ebx
    je et_PHD02

    cmp $0x33, %ebx
    je et_PHD03

    cmp $0x34, %ebx
    je et_PHD04

    cmp $0x35, %ebx
    je et_PHD05

    cmp $0x36, %ebx
    je et_PHD06


    cmp $0x37, %ebx
    je et_PHD07


    cmp $0x38, %ebx
    je et_PHD08


    cmp $0x39, %ebx
    je et_PHD09


    cmp $0x41, %ebx
    je et_PHD10


    cmp $0x42, %ebx
    je et_PHD11


    cmp $0x43, %ebx
    je et_PHD12


    cmp $0x44, %ebx
    je et_PHD13


    cmp $0x45, %ebx
    je et_PHD14

    cmp $0x46, %ebx
    je et_PHD15

    et_ParseHexGroup_End:
    
   popl %ecx

   jmp et_InterpretHexGroup
   jmp et_forSirInputC1
    
et_PHD00:

    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)

    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD01:
    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD02:
    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD03:
    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD04:
    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD05:
    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD06:
    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD07:
    movl hgIdx, %ecx
    movb $0x30, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD08:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD09:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End


et_PHD10:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD11:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x30, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD12:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD13:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x30, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD14:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x30, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End

et_PHD15:
    movl hgIdx, %ecx
    movb $0x31, 0x00(%esi, %ecx, 0x04)
    movb $0x31, 0x01(%esi, %ecx, 0x04)
    movb $0x31, 0x02(%esi, %ecx, 0x04)
    movb $0x31, 0x03(%esi, %ecx, 0x04)


    cmp $0x00, %edx
    je et_PHGD2
    cmp $0x01, %edx
    je et_PHGD3
    jmp et_ParseHexGroup_End




et_InterpretHexGroup:

    xorl %eax, %eax
    movb 0x01(%esi), %al
    subb $0x30, %al
    addb 0x01(%esi), %al
    subb $0x30, %al
    addb 0x02(%esi), %al
    subb $0x30, %al


    cmp $0x00, %eax
    je et_InterpretNumber
    cmp $0x01, %eax
    je et_InterpretVar
    cmp $0x02, %eax
    je et_InterpretInstr
    et_InterpretHexGroup_End:
        jmp et_forSirInputC1 


et_InterpretNumber:

        movl $0x00, num
        movl $0x0B, %ecx
        xorl %ebx, %ebx
        movl $0x01, prod
        et_InterpretNumber_Loop:
            
            cmp $0x3, %ecx
            jle et_InterpretNumber_Cont
            xorl %eax, %eax
            movb (%esi, %ecx, 0x01), %al
            subb $0x30, %al
            imull prod
            addl %eax, %ebx
            movl %ebx, num
            subl $0x01, %ecx
            sall prod
            jmp et_InterpretNumber_Loop

        
        et_InterpretNumber_Cont:
        xorl %ebx, %ebx
        movb 0x03(%esi), %bl
        subb $0x30, %bl
        cmp $0x0, %bl
        je et_PrintNumber
        jg et_PrintMinusNumber

        et_InterpretNumber_End:
            jmp et_InterpretHexGroup_End


et_InterpretVar:

        
        movl %esi, %ebx
        addl $0x04, %ebx
        pushl $0x02
        pushl $0x00
        pushl %ebx
        call strtol
        popl %ebx
        popl %ebx
        popl %ebx
        movl %eax, num

        pushl num
        pushl $writeCharFormat
        call printf
        popl %ebx
        popl %ebx
    
         et_InterpretVar_End:
            jmp et_InterpretHexGroup_End   


et_InterpretInstr:

    
        movl %esi, %ebx
        addl $0x03, %ebx
        pushl $0x02
        pushl $0x00
        pushl %ebx
        call strtol
        popl %ebx
        popl %ebx
        popl %ebx
        movl %eax, num


        cmp $0x00, %eax
        je et_writeLet
        movl num, %eax        

        cmp $0x01, %eax
        je et_writeAdd
        movl num, %eax


        cmp $0x02, %eax
        je et_writeSub
        movl num, %eax

        cmp $0x03, %eax
        je et_writeMul
        movl num, %eax

        cmp $0x04, %eax
        je et_writeDiv
        movl num, %eax

         et_InterpretInstr_End:
            jmp et_InterpretHexGroup_End   

et_exit:

    pushl $writeNewlineFormat
    call printf
    popl %ebx 

    movl $0x01, %eax
    xorl %ebx, %ebx
    int $0x80


et_PrintNumber:

    pushl num
    pushl $printNumFormat
    call printf
    popl %ebx
    popl %ebx
    jmp et_InterpretNumber_End

et_PrintMinusNumber:

    pushl num
    pushl $printMinusNumFormat
    call printf
    popl %ebx
    popl %ebx
    jmp et_InterpretNumber_End

et_writeLet:

    pushl $instrLet
    pushl $writeInstrFormat
    call printf
    popl %ebx 
    popl %ebx 
    jmp et_InterpretInstr_End

et_writeAdd:

    pushl $instrAdd
    pushl $writeInstrFormat
    call printf
    popl %ebx 
    popl %ebx 
    jmp et_InterpretInstr_End    


et_writeSub:

    pushl $instrSub
    pushl $writeInstrFormat
    call printf
    popl %ebx 
    popl %ebx 
    jmp et_InterpretInstr_End

  

et_writeMul:

    pushl $instrMul
    pushl $writeInstrFormat
    call printf
    popl %ebx 
    popl %ebx 
    jmp et_InterpretInstr_End    


et_writeDiv:

    pushl $instrDiv
    pushl $writeInstrFormat
    call printf
    popl %ebx 
    popl %ebx 
    jmp et_InterpretInstr_End
