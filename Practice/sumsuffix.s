.data
    n: .space 4
    v: .space 400
    val: .space 4
    index: .space 4

    sum: .space 4

    readInt: .asciz "%d"
    writeStr: .asciz "Suma primlor %d numere din sir este %d.\n"

.text
.globl main
main:
    pushl $n
    pushl $readInt
    call scanf
    popl %edx
    popl %edx

readInit:
    mov $0, %ecx
    lea v, %edi

readFor:
    cmp n, %ecx
    je sumInit

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

sumInit:
    movl $0, sum
    mov $0, %ecx

for:
    cmp n, %ecx
    je initWrite

    movl (%edi, %ecx, 4), %eax
    addl %eax, sum

    inc %ecx
    jmp for

initWrite:
    mov n, %ecx
    dec %ecx

for2:
    cmp $-1, %ecx
    je exit

    pusha
    movl %ecx, index
    incl index

    pushl sum
    pushl index
    pushl $writeStr
    call printf
    popl %edx
    popl %edx
    popl %edx
    
    popa

    movl (%edi, %ecx, 4), %eax
    subl %eax, sum

    dec %ecx
    jmp for2


exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
