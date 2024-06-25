.data
n:
.long 32 # should be 32
arr:
.word -6, 10, 14, -1, 8, -3, -2, 12, -20, -12, -10, -15, 10, -9, 14, -12, 8, -5, 6, 16, 10, -4, -10, -13, -4, 0, -11, -5, -20, -10, -19, 9
# 19,15,20,12,10,9,22,8,8,7,25,19,15,20,12,10,9,22,8,8,7,25,19,15,20,12,10,9,22,8,8,7
# use command  x/32hd &arr in gdb to view the sorted array 
.text
.global main

main:
  movq n@GOTPCREL(%rip), %rsi 
  movq $0, %rcx
  movl  (%rsi), %ecx # n is stored in ecx
  movq arr@GOTPCREL(%rip), %rdi # arr value is stored in rdi
  movq $1, %r8 # r8d is taken as i
  movq $0 , %r9 # r9d is taken as j
movq $0, %r10 # r10w is key
movq $0, %r11
# movq $0, %r12 
 
movq $0, %rbx
.condn1:
 cmpl %r8d, %ecx
jle .OUT

leaq (%rdi,%r8,2), %r11 # r11 is used for temp purpose
movw (%r11), %r10w
movl %r8d,%r9d  # j=i
decl %r9d # j=i-1

.condn2:

cmp $0, %r9
jl end1
leaq (%rdi,%r9,2), %r11
movw (%r11), %r11w
cmpw %r10w,%r11w
jle end1   
leaq 2(%rdi,%r9,2), %r12
movw %r11w, (%r12) 
decq %r9
jmp .condn2

end1:

leaq 2(%rdi,%r9,2),%r11
movw %r10w, (%r11)
inc %r8
jmp .condn1
.OUT:
   ret
   