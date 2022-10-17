.data
    v: .long 10, 15, 13, 17, 8, 19, 2, 19
    n: .long 8
    maxVal: .space 4
    countMax: .space 4
.text
.globl main

main:
    lea v, %ebx
    movl $0, %ecx
    movl (%ebx, %ecx, 4), %edi
    movl %edi, maxVal
    movl $1, countMax
    add $1, %ecx

for:
    cmp %ecx, n
    je exit
    movl (%ebx, %ecx, 4), %edi
    cmp maxVal, %edi
    jg changeMax
    cmp maxVal, %edi
    je countAdd
nxt:
    add $1, %ecx
    jmp for

countAdd:
    add $1, countMax
    jmp nxt

changeMax:
    movl %edi, maxVal
    movl $1, countMax
    jmp nxt

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
