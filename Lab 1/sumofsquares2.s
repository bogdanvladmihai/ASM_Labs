.data
    s: .long 0x00
    n: .long 0x04
.text
.globl main

main:
    sub $1, n
    mov n, %ecx
etloop:
    mov %ecx, %eax
    mul %ecx
    add %eax, s
    loop etloop
    jmp exit
exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
