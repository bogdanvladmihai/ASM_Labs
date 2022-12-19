.data
    n: .space 4

    readInt: .asciz "%d"
    writeInt: .asciz "%d "
    writeNewLine: .asciz "\n"

.text
    print:
        push %ebp
        mov %esp, %ebp

        mov $0, %ebx
        cmp 8(%ebp), %ebx
        je exitProc

        push %edx

        push 8(%ebp)
        push $writeInt
        call printf
        pop %edx
        pop %edx

        pop %edx

        mov 8(%ebp), %edx
        dec %edx

        push %edx
        call print
        pop %edx

        exitProc:
            pop %ebp
            ret


.globl main
main:
    pushl $n
    pushl $readInt
    call scanf
    pop %edx
    pop %edx

    pushl n
    call print
    pop %edx

    pushl $writeNewLine
    call printf
    pop %edx

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
