.data
    x: .long 31
    y: .long 7
    a: .space 4
    xr: .space 4
    o: .space 4
    ntX: .space 4
    tst: .space 4
    sl: .space 4
    sr: .space 4
.text
.globl main
main:
    movl x, %eax
    movl y, %ebx

    not %eax
    movl %eax, ntX

    movl x, %eax
    and %ebx, %eax
    movl %eax, a

    movl x, %eax
    or %ebx, %eax
    movl %eax, o

    movl x, %eax
    xor %ebx, %eax
    movl %eax, xr

    movl x, %eax
    test %ebx, %eax
    movl %eax, tst

    movl x, %eax
    sal $1, %eax
    movl %eax, sl

    shr $2, %ebx
    movl %ebx, sr

    mov $1, %eax
    mov $0, %ebx
    int $0x80
