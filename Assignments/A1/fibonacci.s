.data # DATA SECTION 
n:
.quad 5

# The program calculates the n-th fibonacci number

.text
.global main

main:
    mov n@GOTPCREL(%rip) , %r9      # Retrieving the address of variable 'n' defined in data section
    mov (%r9), %r9                   # Move the value of n from the memory

    mov $0,  %rdx                   # This is zeroth fibonacci no.
    mov $1,  %rcx                   # This is first fibonacci no.
    mov %r9, %rdi                   # %rdi is first argument, so moving the value of n to it    

    fib:
        cmpq $1, %rdi               # This checks for the last iteration
        je finish                   # Exit if the condition holds
        
        add %rcx, %rdx              # fib[i-1] is in rcx, fib[i-2] in %rdx
        mov %rdx, %rax              # Moving value fib[i] = fib[i-1] + fib[i-2] to %rax
        mov %rcx, %rdx              # Moving the value of %rcx -> %rdx and %rax -> %rcx
        mov %rax, %rcx              # Now fib[i] is in %rcx, fib[i-1] is in %rdx

        dec %rdi                    # Decreasing the iteration number by 1 (n--)
        call fib                    # Directly calling fib again

    finish:
        ret
        


# https://stackoverflow.com/questions/66713460/what-does-vargotpcrelrip-mean
