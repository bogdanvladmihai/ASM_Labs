.data
    v: .space 2000
    n: .space 4
    val: .space 4
    good: .space 4

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

    lea v, %edi
    mov $0, %ecx

for:
    cmp n, %ecx
    je initIn

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
    jmp for

initIn:
    movl $1, good
    mov $0, %ecx
    lea v, %esi

inFor:
    cmp n, %ecx
    je print

    mov %ecx, %ebx
    inc %ebx
    jmp outFor
cont:
    inc %ecx
    jmp inFor

outFor:
    cmp n, %ebx
    jge cont

    movl (%esi, %ecx, 4), %eax
    cmp (%esi, %ebx, 4), %eax
    je setBad

    inc %ebx
    jmp outFor

setBad:
    movl $0, good
    jmp print

print:
    mov $1, %eax
    cmp good, %eax
    je printYes

    pushl $noStr
    call printf
    popl %edx

    jmp exit

printYes:
    pushl $yesStr
    call printf
    popl %edx

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
