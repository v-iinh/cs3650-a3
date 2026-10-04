# Write the assembly code for the array_max function
.text
.globl array_max

array_max:
    movq (%rsi), %rax
    movq $1, %rcx

.loop:
    cmpq %rdi, %rcx
    jge .done

    movq (%rsi,%rcx,8), %rdx
    cmpq %rax, %rdx
    jbe .next
    movq %rdx, %rax

.next:
    incq %rcx
    jmp .loop

.done:
    ret