.data
    v: .long 2, 3, 4, 5, 20, 32, 3
    s: .space 4
    med: .space 4
    r: .space 4
    len: .long 7
.text
.globl main

main:
    lea v, %edi
    mov $0, %ecx
    movl $0, s

for:
    cmp %ecx, len
    je compute
    movl (%edi, %ecx, 4), %eax
    add %eax, s
    add $1, %ecx
    jmp for

compute:
    movl s, %eax
    mov $0, %edx
    movl len, %ecx
    idiv %ecx
    movl med, %eax
    movl r, %edx

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
