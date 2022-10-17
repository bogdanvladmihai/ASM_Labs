.data
    a: .long 0x08
    b: .long 0x09
    c: .long 0x04
    min: .space 4
.text
.globl main

main:
    movl a, %eax
    movl %eax, min
    movl b, %ecx
    cmp min, %ecx
    jl chb
    jmp tryc
chb:
    movl b, %eax
    movl %eax, min
tryc:
    movl c, %ecx
    cmp min, %ecx
    jl chc
    jmp exit
chc:
    movl c, %eax
    movl %eax, min
exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
