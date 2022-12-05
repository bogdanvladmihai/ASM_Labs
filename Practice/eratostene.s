.data
    n: .space 4
    nonPrime: .space 1000000

    readInt: .asciz "%d"
    writeInt: .asciz "%d\n"

.text
.globl main
main:
    pushl $n
    pushl $readInt
    call scanf
    popl %edx
    popl %edx

    lea nonPrime, %edi
    mov $2, %ecx

for1:
    cmp n, %ecx
    jge printInit
    
    mov %ecx, %ebx
    add %ebx, %ebx

    jmp for2
cont:
    inc %ecx
    jmp for1


for2:
    cmp n, %ebx
    jge cont

    movb $1, %al
    movb %al, (%edi, %ebx, 1)

    add %ecx, %ebx
    jmp for2
    

printInit:
    mov $2, %ecx
    
for3:
    cmp n, %ecx
    jge exit

    movb (%edi, %ecx, 1), %al
    cmp $0, %al
    je printVal
cont3:
    inc %ecx
    jmp for3

printVal:
    pusha
    pushl %ecx
    pushl $writeInt
    call printf
    popl %edx
    popl %edx
    popa
    jmp cont3


exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
