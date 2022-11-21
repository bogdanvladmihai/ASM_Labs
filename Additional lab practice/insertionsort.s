.data
    v: .long 1, 5, 6, 3, 2, 10, 1, 3, 7
    n: .long 9
    tmp: .space 4

.text
.globl main
main:
    lea v, %esi
    mov $0, %ecx
    jmp outer

swap:
    mov (%esi, %ecx, 4), %eax
    mov (%esi, %edx, 4), %ebx
    mov %ebx, (%esi, %ecx, 4)
    mov %eax, (%esi, %edx, 4)
    jmp innerCont

outer:
    cmp %ecx, n
    je verifyInit
    mov %ecx, %edx
    inc %edx
    jmp inner
ounterCont:
    inc %ecx
    jmp outer

inner:
    cmp %edx, n
    jle ounterCont
    mov (%esi, %ecx, 4), %ebx
    cmp %ebx, (%esi, %edx, 4)
    jl swap
innerCont:
    inc %edx
    jmp inner

verifyInit:
    lea v, %esi
    mov $0, %ecx
    jmp verify

verify:
    cmp %ecx, n
    je exit
    mov (%esi, %ecx, 4), %ebx
    inc %ecx
    jmp verify

exit:
    mov $1, %eax
    mov $0, %edx
    int $0x80
