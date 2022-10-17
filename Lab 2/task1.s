.data
    x: .long 32
    y: .long 2
    s1: .space 4
    s2: .space 4
    tr: .asciz "PASS\n"
    fl: .asciz "FAIL\n"
.text
.globl main

main:
    movl $0, %edx
    movl x, %eax
    movl $16, %ecx
    idiv %ecx
    add %eax, s1
    movl y, %eax
    imul %ecx
    add %eax, s1
bitops:
    movl x, %eax
    movl y, %ebx
    shl $4, %ebx
    shr $4, %eax
    add %eax, s2
    add %ebx, s2
verif:
    movl s1, %ebx
    cmp s2, %ebx
    je passloop
    mov $4, %eax
    mov $1, %ebx
    mov $fl, %ecx
    mov $5, %edx
    int $0x80
    jmp exit
passloop:
    mov $4, %eax
    mov $1, %ebx
    mov $tr, %ecx
    mov $5, %edx
    int $0x80
    jmp exit
exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
