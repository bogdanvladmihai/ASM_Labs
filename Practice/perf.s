.data
    readInt: .asciz "%d"
    writeInt: .asciz "%d\n"

    n: .space 4
    answer: .space 4
    x: .space 4

.text
perfect:
    pushl %ebp
    mov %esp, %ebp
    subl $4, %esp

    movl $0, -4(%ebp)
    mov $1, %ecx

    for:
        cmp 8(%ebp), %ecx
        je exitFor

        mov 8(%ebp), %eax
        mov $0, %edx

        idiv %ecx
        cmp $0, %edx
        je addEcx

    cont:
        inc %ecx
        jmp for

    addEcx:
        addl %ecx, -4(%ebp)
        jmp cont

    exitFor:
        mov $0, %eax
        cmp -4(%ebp), %ecx
        je set1
        jmp endProc

    set1:
        mov $1, %eax

    endProc:
        addl $4, %esp
        popl %ebp
    ret

.globl main
main:
    pushl $n
    pushl $readInt
    call scanf
    popl %edx
    popl %edx

    mov $0, %ecx
    movl %ecx, answer

for1:
    cmp n, %ecx
    je print

    pushl %ecx

    pushl $x
    pushl $readInt
    call scanf
    popl %edx
    popl %edx

    pushl x
    call perfect
    popl %edx

    addl %eax, answer
    popl %ecx

    inc %ecx
    jmp for1

print:
    pushl answer
    pushl $writeInt
    call printf
    popl %edx
    popl %edx

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
