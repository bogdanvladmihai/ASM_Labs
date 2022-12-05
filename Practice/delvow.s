.data
    n: .space 4
    p: .space 4

    s: .space 100

    vow: .asciz "aeiou"
    readStr: .asciz "%s"
    printStr: .asciz "Sirul dupa prelucrare este %s\n"

.text
.globl main
main:
    pushl $s
    pushl $readStr
    call scanf
    popl %edx
    popl %edx

    pushl $s
    call strlen
    popl %edx
    movl %eax, n

    mov $0, %ecx
    lea s, %esi

for:
    cmp n, %ecx
    je print
    
    pusha
    pushl (%esi, %ecx, 1)
    pushl $vow
    call strchr
    popl %edx
    popl %edx

    movl %eax, p

    popa

    cmpl $0, p
    jne delPos
cont:
    inc %ecx
    jmp for

delPos:
    mov %ecx, %edx
    decl n

del:
    cmp n, %edx
    je break

    movb 1(%esi, %edx, 1), %al
    movb %al, (%esi, %edx, 1)

    inc %edx
    jmp del

break:
    dec %ecx
    jmp cont

print:
    movb $0, %al
    movb %al, (%esi, %ecx, 1)

    pushl $s
    pushl $printStr
    call printf
    popl %edx
    popl %edx


exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
