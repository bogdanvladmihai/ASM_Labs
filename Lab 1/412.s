.data
    x: .asciz ""
    newLine: .asciz "\n"
.text
.globl main
main:
    mov $3, %eax
    mov $0, %ebx
    mov $x, %ecx
    mov $15, %edx
    int $0x80

    mov $4, %eax
    int $0x80

    mov $newLine, %ecx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80
