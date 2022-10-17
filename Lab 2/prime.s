.data
    x: .long 666014
    fl: .asciz "Not a prime number!\n"
    ps: .asciz "Prime number\n"
.text
.globl main

main:
    movl x, %eax
    cmp $2, %eax
    jl fail
    movl $2, %ecx
check:
    cmp %ecx, x
    je pass
    movl x, %eax
    movl $0, %edx
    idiv %ecx
    cmp $0, %edx
    je fail
    add $1, %ecx
    jmp check
pass:
    mov $4, %eax
    mov $1, %ebx
    mov $ps, %ecx
    mov $20, %edx
    int $0x80
    jmp exit
fail:
    mov $4, %eax
    mov $1, %ebx
    mov $fl, %ecx
    mov $20, %edx
    int $0x80
exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
