.data
k:
.word -20
# -2 # key
arr:
.word -20, -20, -19, -15, -13, -12, -12, -11, -10, -10, -10, -9, -6, -5, -5, -4, -4, -3, -2, -1, 0, 6, 8, 8, 9, 10, 10, 10, 12, 14, 14, 16
# -1,-2,1 ,4 ,5,7,15,23,25,27,35,42,47,47,50,51,52,55,56,57,58,59,60,61,61,61,61,62,62,63,64,65
 
.text
.global main

main:
  mov k@GOTPCREL(%rip), %rdx
 
  movw  (%rdx), %dx # key is in %dx
  mov arr@GOTPCREL(%rip), %rdi # arr value is stored in rdi
  mov $32, %rsi # size 
 
  mov $0 ,%r12 # no.of iterations
 # r11 has index
 


binarySearch:  # rdi:array, rsi:N, rdx:key
   mov $0, %rbx               # %rbx : l
   mov %rsi,%rcx              
   decq %rcx                   # %rcx : r
   jmp .condCheck

.LOOP:

   mov %rcx, %rax
   subq %rbx, %rax
   shrq $1, %rax  
   addq %rbx, %rax             # %rax : m 
   movw (%rdi,%rax,2),%r10w  # %r10w : a[m] 
   cmpw %r10w, %dx
   je .found                    # this is working a[m]==el
   jl .ml  
   movq %rax,%rbx              # greater than f=m+1
   incq %rbx
   jmp .condCheck 
.ml:   
   movq %rax,%rcx              # l ess than l=m-1
   decq %rcx
.condCheck:
   incq %r12
   cmpq %rcx, %rbx             # first<last
   jle .LOOP
   jg .notfound
.notfound:
   mov $-1, %r11
   jmp .done
.found:
 mov %rax,%r11
 jmp .done

.done:
   ret

 
