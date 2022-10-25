.data
.text
.globl main

main:
    movl $0, %eax
    movw $2304, %ax
    movb $14, %al

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
