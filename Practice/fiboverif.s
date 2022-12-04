.data
    n: .space 4
    val: .space 4
    fibs: .space 400

    readInt: .asciz "%d"
    yesStr: .asciz "YES\n"
    noStr: .asciz "NO\n"

.text
.globl main
main:
    pushl $n
    pushl $readInt
    call scanf
    popl %edx
    popl %edx

    mov $0, %edx
    lea fibs, %esi

for1:
    cmp n, %edx
    je exit

    pusha
    pushl $val
    pushl $readInt
    call scanf
    popl %edx
    popl %edx
    popa

    jmp checkInit
cont:
    inc %edx
    jmp for1

checkInit:
    mov $0, %ecx
    movl $1, %eax
    cmp val, %eax
    je printYes

    movl %eax, 4(%esi, %ecx, 4)
    movl %eax, (%esi, %ecx, 4)

    inc %ecx
    inc %ecx

for:
    movl -4(%esi, %ecx, 4), %eax
    addl -8(%esi, %ecx, 4), %eax
    cmp val, %eax
    jge check

    movl %eax, (%esi, %ecx, 4)
    inc %ecx
    jmp for

check:
    cmp val, %eax
    je printYes

    pusha
    pushl $noStr
    call printf
    popl %edx
    popa
    jmp cont

printYes:
    pusha
    pushl $yesStr
    call printf
    popl %edx
    popa
    jmp cont

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
