.data
    s: .asciz "abcde"
    t: .asciz "xxxxx"
    n: .long 5
    m: .space 4
.text
.globl main

main:
    lea s, %edx
    lea t, %ebx
    movl $0, %ecx
    movl n, %eax
    sub $1, %eax
    movl %eax, m

for:
    cmp n, %ecx
    je print
    movl m, %edi
    sub %ecx, %edi
    movl $0, %eax
    movb (%edx, %ecx, 1), %ah
    movb %ah, (%ebx, %edi, 1)
    add $1, %ecx
    jmp for

print:
    movl $4, %eax
    movl $1, %ebx
    movl $t, %ecx
    movl n, %edx
    int $0x80

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
