.data
    x: .long 0x00
    y: .long 0x01
.text
.globl main
main:
    movl x, %eax
    movl y, %ebx
    mov %eax, %ecx
    mov %ebx, %eax
    mov %ecx, %ebx
    int $0x80
