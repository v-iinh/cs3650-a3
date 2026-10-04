# Write the assembly code for the array_max function
.text
.globl array-max

array_max:
    movq (%rdi), %rax
    movq $1, %rcx

.loop:
    cmpq %rsi, %rcx
    jge .done

    movq (%rdi,%rcx,8), %rdx
    cmpq %rax, %rdx
    jle .next
    movq %rdx, %rax

.next:
    incq %rcx
    jmp .loop

.done:
    ret