.data
    v: .long 1, 2, 3, 4, 7, 12
    len: .long 6
    l: .long 0
    r: .long 5
    x: .long 7777
    b: .long 2
    nf: .asciz "Not found\n"
    fd: .asciz "Found\n"
.text
.globl main

main:
    lea v, %edi

bin:
    movl l, %ecx
    cmpl r, %ecx
    jg fail
    mov $0, %eax
    addl l, %eax
    addl r, %eax
    mov $0, %edx
    idivl b
    movl %eax, %ecx
    mov (%edi, %ecx, 4), %eax
    cmp %eax, x
    je pass
    cmp %eax, x
    jl rDown
    jmp lUp

lUp:
    movl %eax, l
    addl $1, l
    jmp bin

rDown:
    movl %eax, r
    subl $1, r
    jmp bin

fail:
    mov $4, %eax
    mov $1, %ebx
    mov $nf, %ecx
    mov $15, %edx
    int $0x80
    jmp exit

pass:
    mov $4, %eax
    mov $1, %ebx
    mov $fd, %ecx
    mov $15, %edx
    int $0x80

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
