.data
    x: .long 12
    tmp: .space 4
    ms: .asciz "New divisor found!\n"
.text
.globl main

main:
    movl $1, %ecx

check:
    cmp x, %ecx
    jg exit
    movl x, %eax
    mov $0, %edx
    idiv %ecx
    cmp $0, %edx
    je newDiv
_cont:
    add $1, %ecx
    jmp check

newDiv:
    mov $4, %eax
    mov $1, %ebx
    movl %ecx, tmp
    mov $ms, %ecx
    mov $20, %edx
    int $0x80
    movl tmp, %ecx
    jmp _cont

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
