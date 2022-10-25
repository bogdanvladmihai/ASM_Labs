.data
    v: .long 1245, 342, 543523, 342, 4234, 1245, 543523
    len: .long 7
.text
.globl main

main:
    lea v, %edi
    mov $0, %ecx
    mov $0, %eax

_for:
    cmp len, %ecx
    je exit
    xor (%edi, %ecx, 4), %eax
    add $1, %ecx
    jmp _for

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
