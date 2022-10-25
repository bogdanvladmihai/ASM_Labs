.data
    x: .long 16
.text
.globl main

main:
    movl x, %eax
    movl $0, %ecx
    cmp $1, %eax
    jle exit

log:
    movl $1, %ebx
    add $1, %ecx
    shl %ecx, %ebx
    cmp %eax, %ebx
    jge exit
    jmp log

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
