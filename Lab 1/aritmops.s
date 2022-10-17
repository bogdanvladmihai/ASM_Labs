.data
    x: .long 0x09
    y: .long 0x03
    sum: .space 4
    dif: .space 4
    prod: .space 4
    divi: .space 4
    rem: .space 4
.text
.globl main
main:
    movl x, %eax
    movl y, %ebx
    add %ebx, %eax
    movl %eax, sum

    movl x, %eax
    sub %ebx, %eax
    movl %eax, dif

    movl x, %eax
    mul %ebx
    movl %eax, prod

    movl x, %eax
    div %ebx
    movl %eax, divi
    movl %ebx, rem

    mov $1, %eax
    mov $0, %ebx
    int $0x80
