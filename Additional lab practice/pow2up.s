.data
    x: .long 16
.text
.globl main

main:
    movl $0, %ecx
    movl x, %eax

find:
    movl $1, %ebx
    shl %ecx, %ebx
    cmp %eax, %ebx
    jge exit
    add $1, %ecx
    jmp find

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
