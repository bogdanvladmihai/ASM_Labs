.data
    n: .space 4
    m: .space 4
    val: .space 4
    index: .space 4
    sum: .space 4
    mat: .space 40000

    formatInput: .asciz "%d %d"
    formatRead: .asciz "%d"
    formatOutput: .asciz "Suma liniei %d este egala cu %d.\n"

.text

.globl main
main:
    pushl $m
    pushl $n
    pushl $formatInput
    
    call scanf

    popl %edx
    popl %edx

    mov $0, %ecx
    lea mat, %esi

outLoop:
    cmp n, %ecx
    je calcEachLine

    mov $0, %ebx
    jmp inLoop
cont:
    inc %ecx
    jmp outLoop

inLoop:
    cmp m, %ebx
    je cont

    mov %ecx, %eax
    mov $0, %edx

    mull m

    add %ebx, %eax
    movl %eax, index

    pusha

    pushl $val
    pushl $formatRead
    call scanf
    popl %edx
    popl %edx

    popa

    movl index, %edx
    movl val, %eax
    movl %eax, (%esi, %edx, 4)

    inc %ebx
    jmp inLoop

calcEachLine:
    mov $0, %ecx
    
outFor:
    cmp n, %ecx
    je exit

    xorl %eax, %eax
    movl %eax, sum

    mov $0, %ebx
    jmp inFor
cont2:
    pusha

    pushl sum
    pushl %ecx
    pushl $formatOutput
    call printf
    popl %edx
    popl %edx
    popl %edx

    popa
    
    inc %ecx
    jmp outFor

inFor:
    cmp m, %ebx
    je cont2

    mov %ecx, %eax
    mov $0, %edx

    mull m

    add %ebx, %eax
    movl $0, %edx
    add (%esi, %eax, 4), %edx

    add %edx, sum

    inc %ebx
    jmp inFor

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
