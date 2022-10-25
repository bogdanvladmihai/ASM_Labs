.data
    x: .long 8
.text
.globl main

main:
    mov $2, %ecx
    mov $1, %ebx
    mov $0, %edx
    mov $1, %eax
    cmp $1, x
    jle exit

fibo:
    cmp x, %ecx
    je exit
    movl %ebx, %edi
    add %eax, %edi
    movl %ebx, %edx
    movl %eax, %ebx
    movl %edi, %eax
    add $1, %ecx
    jmp fibo

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
