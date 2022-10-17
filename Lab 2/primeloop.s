.data
    x: .long 666013
    fl: .asciz "Not a prime number!\n"
    ps: .asciz "Prime number!\n"
.text
.globl main

main:
    movl x, %ecx
    cmp $2, %ecx
    jl fail
    sub $1, %ecx

etloop:
    movl $0, %edx
    movl x, %eax
    idiv %ecx
    cmp $0, %edx
    je check
    loop etloop

check:
    cmp $1, %ecx
    je pass
    jmp fail

pass:
    movl $4, %eax
    movl $1, %ebx
    movl $ps, %ecx
    movl $20, %edx
    int $0x80
    jmp exit

fail:
    movl $4, %eax
    movl $1, %ebx
    movl $fl, %ecx
    movl $20, %edx
    int $0x80
    jmp exit

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
