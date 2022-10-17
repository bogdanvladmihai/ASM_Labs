.data
    x: .long 16
.text
.globl main

main:
    movl x, %eax
    movl $0, %ecx

popcount:
    cmp $0, %eax
    je exit
    movl $2, %ebx
    movl $0, %edx
    idiv %ebx
    add %edx, %ecx
    jmp popcount

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
