.data
    y: .byte 3
    x: .byte 1
.text
.globl main
main:
    mov y, %eax
    mov x, %ebx
exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
