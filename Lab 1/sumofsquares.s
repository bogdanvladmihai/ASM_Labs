.data
    s: .long 0x00
    n: .long 0x04
.text
.globl main

main:
    mov $0, %ecx
etloop:
    cmp n, %ecx
    je exit

    mov %ecx, %eax
    mul %ecx
    add %eax, s

    add $1, %ecx
    jmp etloop
exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
