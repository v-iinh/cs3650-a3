# Write the assembly code for the main function of the mystery program
.text
.globl main
.extern atol
.extern crunch
.extern puts
main:
  enter $0, $0
  subq $16, %rsp

  cmpq $3, %rdi
  jne .wrong_arg_count

  movq 8(%rsi), %rdi
  call atol
  movq %rax, -8(%rbp)

  movq 16(%rsi), %rdi
  call atol
  movq %rax, -16(%rbp)

  movq -8(%rbp), %rdi
  movq -16(%rbp), %rsi
  call crunch

  cmpq $0, %rax
  jl .print_hat
  je .print_tea

  leaq beer_msg(%rip), %rdi
  jmp .print_result

.print_hat:
  leaq hat_msg(%rip), %rdi
  jmp .print_result

.print_tea:
  leaq tea_msg(%rip), %rdi

.print_result:
  call puts
  xorl %eax, %eax
  leave
  ret

.wrong_arg_count:
  leaq error_msg(%rip), %rdi
  call puts
  movl $1, %eax
  leave
  ret

.data
error_msg:
  .asciz "Two arguments required."
hat_msg:
  .asciz "hat"
tea_msg:
  .asciz "tea"
beer_msg:
  .asciz "beer"
