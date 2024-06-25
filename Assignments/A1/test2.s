.data
k:
.word  15 #
arr:
.word 19,15,20,12,10,9,22,8,8,7,25,19,15,20,12,10,9,22,8,8,7,25,19,15,20,12,10,9,22,8,8,7
.text
.global main

main:
  mov k@GOTPCREL(%rip), %rcx
 
  mov  (%rcx), %rcx # key is 4th arg
  mov arr@GOTPCREL(%rip), %rdi # arr value is stored in rdi
  mov $0, %rsi # l as 2nd arg
  mov $31 , %rdx # r as 3rd arg
  mov $0 ,%r12 # no.of iterations
  mov $-1, %r11 # index
  jmp .call


bsearch:
  # pushq %rbx
   mov %rsi , %r8 # r8 has l
  mov %rdx , %r9 # r9 has r
  cmp %r8 ,%r9
  jl  .notfound
  mov %r8 , %rax 
  addq %r9 , %rax
  idivq 2,%rax # rax is mid
  movw (%rdi,%rax,2), %r14w # doubt, r14w == arr[mid]
  cmpw %cx ,  %r14w 
  je .found
  jg .adj1
  jl .adj2


.adj1:
  mov %rax ,%rdx
  decq %rdx
  jmp .call

.adj2:
  mov %rax ,%rsi
  incq %rsi
  jmp .call


.found:
  mov %rax , %r11
 # popq %rbx
  jmp .exit

.notfound:
   mov $1 , %r11
   notq %r11
   jmp .exit
.call:
 incq %r12
 call bsearch

 .exit:
   ret

 
