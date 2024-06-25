.text
.global hammingDist

hammingDist:


movl $0, %ebx
movl $0, %ecx
movl %edi, %ebx # get a
movl %esi, %ecx # get b
xorl %ebx ,%ecx      
movl $0, %eax
cmpl $0 ,%ecx
jle .OUT

.loop:
movl %ecx, %edx
andl $1 ,%edx
addl %edx ,%eax
shrl $1 ,%ecx
cmpl $0 ,%ecx
jg .loop

.OUT:
   ret


