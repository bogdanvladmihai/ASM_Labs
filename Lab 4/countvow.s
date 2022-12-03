.data
    cnt: .long 0
    tmp: .long 0
    len: .space 4

    s: .space 100
    w: .asciz "aeiou"

    formatInput: .asciz "%s"
    formatOutput: .asciz "Sirul citit are %d vocale\n"
.text

.globl main
main:
    pushl $s
    pushl $formatInput
    call scanf
    popl %edx
    popl %edx

    pushl $s
    call strlen
    popl %edx

    lea s, %esi
    movl %eax, len
    mov $0, %ecx

for:
    cmp len, %ecx
    je print

    pusha
    pushl (%esi, %ecx, 1)
    pushl $w
    call strchr
    popl %edx
    popl %edx

    cmp $0, %eax
    je cont
    incl cnt
cont:
    popa

    inc %ecx
    jmp for

print:
    pushl cnt
    pushl $formatOutput
    call printf
    popl %edx
    popl %edx

exit:
    mov $1, %eax
    xorl %ebx, %ebx
    int $0x80
