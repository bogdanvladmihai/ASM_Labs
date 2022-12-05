.data
    n: .space 4
    v: .space 400
    val: .space 4

    readInt: .asciz "%d"
    readStr: .asciz "%s"

    writeInt: .asciz "%d\n"
    writeStr: .asciz "%s\n"

.text
.globl main
main:

readN:
    pushl $n
    pushl $readInt
    call scanf
    popl %edx
    popl %edx

init:
    mov $0, %ecx
    lea v, %edi

readFor:
    cmp n, %ecx
    je writeInit

    pusha
    pushl $val
    pushl $readInt
    call scanf
    popl %edx
    popl %edx
    popa

    movl val, %eax
    movl %eax, (%edi, %ecx, 4)

    inc %ecx
    jmp readFor


writeInit:
    mov $0, %ecx

writeFor:
    cmp n, %ecx
    je exit

    pusha
    movl (%edi, %ecx, 4), %eax
    movl %eax, val
    pushl val
    pushl $writeInt
    call printf
    popl %edx
    popl %edx
    popa
    
    inc %ecx
    jmp writeFor


exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
