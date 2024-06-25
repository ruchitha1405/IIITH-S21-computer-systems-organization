.text

.global rotate

rotate:  # rdi
movq $0 ,%rax # x
movq $0 ,%rbx # y
movq $0 ,%rcx 
movq $0 ,%rdx
movq $0 ,%r8 
.cond1:
cmpl $4 ,%eax 
jge .OUT
movl %eax, %ebx # y=x
.cond2:
movl $7 ,%ecx
subl %eax, %ecx # ecx=7-x
cmpl %ebx ,%ecx
jle .L1
movl $7 , %edx
subl %ebx, %edx # edx = 7-y
 
 leaq (%rdi,%rax,8), %r8
 leaq (%r8,%rax,8), %r8
 leaq (%r8,%rbx,2), %r9 # r9 has address x,y
 movw (%r9), %r10w # temp==%r10w
 
 leaq (%rdi,%rbx,8), %r8
 leaq (%r8,%rbx,8), %r8
 leaq (%r8,%rcx,2), %r13 # r13 has address y,7-x
 movw (%r13), %r8w 
 movw %r8w, (%r9) 

 leaq (%rdi,%rcx,8), %r8
 leaq (%r8,%rcx,8), %r8
 leaq (%r8,%rdx,2), %rsi # rsi has address 7-x,7-y
 movw (%rsi), %r8w 
 movw %r8w,(%r13) 

 leaq (%rdi,%rdx,8), %r8
 leaq (%r8,%rdx,8), %r8
 leaq (%r8,%rax,2), %r8 # r8 has address 7-y,x
 movw (%r8), %r9w
 movw %r9w , (%rsi)

 movw %r10w,(%r8)

 incl %ebx
jmp .cond2

.L1:
incl %eax
jmp .cond1

.OUT:
   ret
