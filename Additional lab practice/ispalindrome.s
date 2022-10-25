.data
    x: .long 16
    len: .space 4
    n: .space 4
    ps: .asciz "Palindrome!\n"
    fl: .asciz "Not a palindrome!\n"
.text
.globl main

main:
    movl x, %eax
    movl %eax, %ebx
    movl $0, %ecx
    cmp $1, %eax
    jle pass

log:
    add $1, %ecx
    movl $1, %edx
    shl %ecx, %edx
    cmp x, %edx
    jge init
    jmp log

init:
    movl %ecx, len
    movl $0, %ecx
    movl $0, %edx
    jmp check

check:
    movl len, %ebx
    sub %ecx, %ebx
    cmp %ebx, %ecx
    jge if
    movl %eax, n
    shrl %ecx, n
    andl $1, n
    cmpl $1, n
    je addBits
_cont:
    add $1, %ecx
    jmp check

addBits:
    movl $1, n
    shll %ecx, n
    add n, %ebx
    movl $1, n
    shll %ebx, n
    add n, %edx
    jmp _cont

if:
    cmp %edx, %eax
    je pass
    jmp fail

pass:
    movl $4, %eax
    movl $1, %ebx
    mov $ps, %ecx
    movl $13, %edx
    int $0x80
    jmp exit

fail:
    movl $4, %eax
    movl $1, %ebx
    mov $fl, %ecx
    movl $20, %edx
    int $0x80
    jmp exit

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80 
