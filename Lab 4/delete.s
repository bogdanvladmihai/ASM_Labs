.data
    v: .space 6000
    n: .space 4
    pos: .space 4
    val: .space 4

    readNandPos: .asciz "%d %d"
    readVal: .asciz "%d"
    printVal: .asciz "%d\n"

.text

.globl main
main:
    pushl $pos
    pushl $n
    pushl $readNandPos
    call scanf
    popl %edx
    popl %edx
    popl %edx

    mov $0, %ecx
    lea v, %esi

for:
    cmp n, %ecx
    je deleteInit

    pusha
    pushl $val
    pushl $readVal
    call scanf
    popl %edx
    popl %edx
    popa

    movl val, %eax
    movl %eax, (%esi, %ecx, 4)

    inc %ecx
    jmp for

deleteInit:
    decl pos
    decl n
    mov pos, %ecx
    lea v, %edi

for2:
    cmp %ecx, n
    je printInit

    movl 4(%edi, %ecx, 4), %eax
    movl %eax, (%edi, %ecx, 4)

    inc %ecx
    jmp for2


printInit:
    mov $0, %ecx

for3:
    cmp n, %ecx
    je exit

    pusha 
    movl (%esi, %ecx, 4), %eax

    pushl %eax
    pushl $printVal
    call printf
    popl %edx
    popl %edx
    popa

    inc %ecx
    jmp for3

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
