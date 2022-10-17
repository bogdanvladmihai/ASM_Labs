.data
    x: .long 0x09
    y: .long 0xf
.text
.globl main

main:
    movl x, %eax
    movl y, %ebx
    xor %ebx, %eax
    xor %eax, %ebx
    xor %ebx, %eax

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
