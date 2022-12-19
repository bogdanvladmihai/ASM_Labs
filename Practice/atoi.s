.data
    s: .space 10

    readStr: .asciz "%s"
    writeStr: .asciz "%s\n"
    writeInt: .asciz "%d\n"
    impossibleStr: .asciz "Impossible!"

.text
    myAtoi:
        push %ebp
        mov %esp, %ebp
        push %esi
        push %ebx

        pushl 8(%ebp)
        call strlen
        popl %edx

        mov %eax, %edx
        movl 8(%ebp), %esi
        mov $0, %ecx
        mov $0, %eax

        for:
            cmp %ecx, %edx
            je getAnswer

            mov $0, %ebx
            movb (%esi, %ecx, 1), %bl
            cmp $48, %bl
            jl getAnswer
            cmp $57, %bl
            jg getAnswer

            subb $48, %bl

            push %edx
            mov $0, %edx
            imul $10, %eax
            pop %edx

            add %ebx, %eax

            inc %ecx
            jmp for

        getAnswer:
            cmp %ecx, %edx
            jne setImpossible
            jmp exitProc

        setImpossible:
            mov $-1, %eax

        exitProc:
            pop %ebx
            pop %esi
            pop %ebp
            ret


.globl main
main:
    pushl $s
    pushl $readStr
    call scanf
    popl %edx
    popl %edx

    pushl $s
    call myAtoi
    popl %edx

    cmp $-1, %eax
    je printImpossible

    pushl %eax
    pushl $writeInt
    call printf
    popl %edx
    popl %edx
    jmp exit

printImpossible:
    pushl $impossibleStr
    pushl $writeStr
    call printf
    popl %edx
    popl %edx


exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
