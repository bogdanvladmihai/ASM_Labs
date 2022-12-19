.data
    source: .long 19, 17, 15, 44
    dest: .space 100

    n: .long 4
    writeInt: .asciz "%d\n"
    val: .space 4

.text
    memcpy:
        pushl %ebp
        mov %esp, %ebp
        pushl %edi
        pushl %esi

        mov $0, %ecx
        movl 8(%ebp), %esi
        movl 12(%ebp), %edi

        for:
            cmpl 16(%ebp), %ecx
            je exitProc

            movl (%esi, %ecx, 4), %edx
            movl %edx, (%edi, %ecx, 4)

            inc %ecx
            jmp for
            
        exitProc:
            popl %esi
            popl %edi
            popl %ebp
            ret


.globl main
main:
    pushl n
    pushl $dest
    pushl $source
    call memcpy
    popl %edx
    popl %edx
    popl %edx

    mov $0, %ecx
    lea dest, %esi

for1:
    cmp n, %ecx
    je exit

    movl (%esi, %ecx, 4), %edx
    movl %edx, val

    pushl %ecx

    pushl val
    pushl $writeInt
    call printf
    popl %edx
    popl %edx

    popl %ecx

    inc %ecx
    jmp for1

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
