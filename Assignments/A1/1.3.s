.data
n:
.long 32 # should be 32
arr:
.word 19,15,20,12,10,9,22,8,8,7,25,19,15,20,12,10,9,22,8,8,7,25,19,15,20,12,10,9,22,8,8,7

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
                      # movq $0, %rax
 cmpl $0, %r9d
 setge %al
 leaq (%rdi,%r9,2), %r11 # r11 is used for temp purpose
 movw (%r11), %dx # dx used for temp purpose,bx=arr[j]
 cmpw  %r10w, %dx
 setg %ah
 testb %ah ,%al
 je .l1

 .loop:
 leaq 2(%rdi,%r9,2), %r11 
 movw %dx , (%r11) #  arr[j + 1] = arr[j];
 decl %r9d
 jmp .condn2

.l1:
leaq 2(%rdi,%r9,2), %r11 # r11 is used for temp purpose
movw %r10w, (%r11) # arr[j + 1] = key;
incl %r8d
jmp .condn1

.OUT:
   ret

   

 

