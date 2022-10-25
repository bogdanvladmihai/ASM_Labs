.data
    v: .long 45, 19, 21, 12, 17, 25, 7, 7
    min1: .space 4
    min2: .space 4
    len: .long 8
.text
.globl main

main:
    lea v, %edi
    movl $0, %ecx
    movl (%edi, %ecx, 4), %eax
    movl %eax, min1
    add $1, %ecx
    movl (%edi, %ecx, 4), %eax
    movl %eax, min2
    movl min1, %eax
    cmp %eax, min2
    jl swap
_ret:
    add $1, %ecx

for:
    cmp %ecx, len
    je exit
    movl (%edi, %ecx, 4), %eax
    cmp min1, %eax
    jl newMin
    cmp min2, %eax
    jl newSecondMin
_cont:
    add $1, %ecx
    jmp for

newMin:
    movl min1, %eax
    movl %eax, min2
    movl (%edi, %ecx, 4), %eax
    movl %eax, min1
    jmp _cont

newSecondMin:
    movl (%edi, %ecx, 4), %eax
    movl %eax, min2
    jmp _cont

swap:
    movl min1, %ebx
    movl min2, %eax
    xor %ebx, %eax
    xor %eax, %ebx
    xor %ebx, %eax
    movl %eax, min2
    movl %ebx, min1
    jmp _ret

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
