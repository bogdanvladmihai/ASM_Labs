.data
    n: .space 4
.text
.globl main

main:
    mov $5, %eax
    movl %eax, n
    movl $1, %eax
    mov $2, %ecx
    cmp $1, n
    jle exit

_for:
    cmp n, %ecx
    jg _exit
    mov $0, %edx
    imul %ecx
    add $1, %ecx
    jmp _for

_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
