.text
.global hammingDist

hammingDist:


movw $0, %bx
movw $0, %cx
movw %di, %bx # get a
movw %si, %cx # get b
xorw %bx ,%cx  # cx= x    
movw $0, %ax # setbits
movw $0, %dx # y=0
cmpw $16 ,%dx
jge .OUT

.loop:
movw %cx, %bx
andw $1 ,%bx
addw %bx ,%ax
sarw $1 ,%cx
incw %dx
cmpw $16 ,%dx
jl .loop

.OUT:
   ret


