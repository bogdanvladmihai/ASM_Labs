.data
    x: .long 0
    z: .asciz "X = 0\n"
    p: .asciz "X > 0\n"
    n: .asciz "X < 0\n"
    l: .long 6
.text
.globl main

main:
    movl x, %eax
    cmp $0, %eax
    je zero
    jl neg
    jmp pos

neg:
    movl $4, %eax
    movl $1, %ebx
    movl $n, %ecx
    movl l, %edx
    int $0x80
    jmp exit

pos:
    movl $4, %eax
    movl $1, %ebx
    movl $p, %ecx
    movl l, %edx
    int $0x80
    jmp exit

zero:
    movl $4, %eax
    movl $1, %ebx
    movl $z, %ecx
    movl l, %edx
    int $0x80
    jmp exit

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
