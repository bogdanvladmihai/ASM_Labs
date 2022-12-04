.data
    n: .space 4
    prod: .space 4

    tmp: .space 4
    digit: .space 4
    found: .space 4

    writeInt: .asciz "%d\n"
    readInt: .asciz "%d"

.text
.globl main
main:
    pushl $n
    pushl $readInt
    call scanf
    popl %edx
    popl %edx

    movl $0, found
    mov $1, %eax
    movl %eax, prod
    movl n, %eax

while:
    cmp $0, %eax
    je printCheck

    mov $0, %edx
    mov $10, %ebx
    idiv %ebx

    movl %edx, digit
    movl %eax, tmp

    mov %edx, %eax
    mov $2, %ebx
    mov $0, %edx

    idiv %ebx
    cmp $1, %edx
    je addProd

cont:
    movl tmp, %eax
    jmp while

addProd:
    movl $1, found

    movl digit, %eax
    movl prod, %ebx
    mov $0, %edx

    mull %ebx
    movl %eax, prod
    jmp cont

printCheck:
    mov $1, %eax
    cmp found, %eax
    jne modifyProd
    jmp print

modifyProd:
    movl $-1, prod

print:
    pushl prod
    pushl $writeInt
    call printf
    popl %edx
    popl %edx

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
