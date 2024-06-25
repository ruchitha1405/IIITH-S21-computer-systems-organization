.text
.global main

# The program calculates (x!) % n

main:                         
    mov $5, %r8                 # PUT THE VALUE OF 'x' HERE
    mov $100, %rcx              # PUT THE VALUE OF 'n' HERE
    
    mov $1, %rbx                # Initializing %rbx and %r9 with one
    mov $0, %r9                 # %r9 will increase 'i' and %rbx will calculate factorial

    fact:                       # loop to calculate factorial               
        incq %r9                # Increase the value of i by 1 (i++)
        imul %r9, %rbx          # increasing factorial by multiplying with 'i' (i * (i-1)!)

        mov %rbx, %rax          # Moving the value of factorial to %rax
        cqto                    # Assigning %rdx (Most significant 64 bits) to zerobr 
        idivq %rcx              # Performing division by %rcx to get the mod result (Quotient - %rax, Remainder - %rdx)
        mov %rdx, %rbx          # Moving back the result to %rbx

        cmp %r9, %r8            # Comparing %r8 and %r9 to check whether this is the last iteration
        jne fact                # if zero then go to fiish else continue calculating factorial
        
    finish:                     # transferring ans to %r11
        mov %rbx, %r11
exit:                           # exiting the program
    xor %rdi, %rdi
	syscall
