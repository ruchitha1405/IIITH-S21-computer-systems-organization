.text
.global freq

freq:
movq $0, %rbx # i=0
movq $0, %rdx
.condn:
movb $0, %al
movb $0, %ah
cmpl $0, %ebx 
setge %al
cmp $32, %ebx
setl %ah
testb %ah, %al
jne  .body
jmp .OUT


# &a[i]== %rdi+1*i

.body:
# movb $0, %al
# movb $0, %ah
movb (%rdi,%rbx,1), %dl
cmpb $97, %dl 
# setge %al
jge .L1
# cmpb $122 , %dl
# setle %ah
# testb %al,%ah
# jne .inc
 incl  %ebx
jmp .condn

.L1:
cmpb $122 , %dl
jle .inc
incl  %ebx
jmp .condn

.inc:
leaq  (%rdi,%rbx,1),%rcx
movb  (%rcx), %dl
subb  $97, %dl
leaq (%rsi,%rdx,4), %rcx
incl  (%rcx)
incl  %ebx
jmp .condn
                # abjhdeyruiokevutjan45673ncu89+e4
.OUT:
   ret



