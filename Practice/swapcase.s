.data
    n: .space 4
    s: .space 100
    c: .space 1

    cnt: .long 0
    answer: .space 4

    readStr: .asciz "%s"
    writeStr: .asciz "%s\n"

.text
.globl main
main:
    pushl $s
    call gets
    popl %edx

init:
    pushl $s
    call strlen
    popl %edx
    movl %eax, n

    mov $0, %ecx
    lea s, %esi

for:
    cmp n, %ecx
    je print

    movb (%esi, %ecx, 1), %al
    cmp $65, %al
    jl cont
    cmp $90, %al
    jle changeToLower

    cmp $95, %al
    jl cont
    cmp $122, %al
    jle changeToUpper

cont:
    inc %ecx
    jmp for

changeToLower:
    addb $32, %al
    movb %al, (%esi, %ecx, 1)
    jmp cont

changeToUpper:
    subb $32, %al
    movb %al, (%esi, %ecx, 1)
    jmp cont

print:
    pushl $s
    pushl $writeStr
    call printf
    popl %edx
    popl %edx

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
