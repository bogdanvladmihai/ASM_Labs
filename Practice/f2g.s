.data
    n: .space 4

    readInt: .asciz "%d"
    writeInt: .asciz "%d\n"

.text
    f:
        push %ebp
        mov %esp, %ebp

        push 8(%ebp)
        call g
        pop %edx

        mov $0, %edx
        mov $2, %ecx
        imul %ecx

        pop %ebp
        ret

    g:
        push %ebp
        mov %esp, %ebp

        mov 8(%ebp), %eax
        inc %eax

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
    call f
    pop %edx

    push %eax
    pushl $writeInt
    call printf
    pop %edx
    pop %edx

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
