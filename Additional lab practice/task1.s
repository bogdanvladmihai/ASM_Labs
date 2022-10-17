.data
    x: .long 17
    y: .long 21
    a: .space 4
    b: .space 4
.text
.globl main

main:
    movl x, %eax
    movl y, %ebx
    jmp _a

_a:
    and $1, %eax
    jmp exit

_b:
    xor %eax, %eax
    jmp exit

_c:
    movl %ebx, %eax
    movl %ebx, %eax

_d:
    movl %edx, %eax
    sub $1, %edx
    and %eax, %edx

_e:
    movl %eax, a
    movl %ebx, b
    not b
    movl %ecx, a
    and b, %ecx

    movl %ebx, b
    not a
    movl %eax, a
    and b, %eax

    and %ecx, %eax

_f:
    movl a, %eax
    not a
    and a, %eax
    movl b, %ebx
    not b
    and b, %ebx
    or %ebx, %eax

_g:
    

exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
