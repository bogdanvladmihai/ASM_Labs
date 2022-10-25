.data
    x: .long 30
.text
.globl main

main:
    movl x, %eax
    movl $0, %ecx

count:
    cmp $0, %eax
    je exit
    movl %eax, %ebx
    shl $1, %ebx
    and %ebx, %eax
    add $1, %ecx
    jmp count

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
