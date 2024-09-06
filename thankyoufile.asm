.data
    
file_name:  .asciiz "thankyoumessage.txt"   # File name
buffer:     .word 1024         # Buffer to store file contents

#######################
.text  
.globl main

.eqv	OPENFILE	13
.eqv	READFILE	14
.eqv	CLOSEFILE	15
.eqv	MESSAGEDIALOG	55

main:
    # Open file
    li $v0, OPENFILE            # syscall 13 for open file
    la $a0, file_name           # load file name address
    li $a1, 0                   # open for reading
    li $a2, 0                   # mode not used for reading
    syscall                     # open file syscall

    move $s0, $v0               # store file descriptor in $s0

    # Read file
    li $v0, READFILE            # syscall 14 for read file
    move $a0, $s0               # file descriptor
    la $a1, buffer              # load buffer address
    li $a2, 1024                 # number of bytes to read
    syscall                     # read file syscall

    # Close file
    li $v0, CLOSEFILE           # syscall 16 for close file
    move $a0, $s0               # file descriptor
    syscall                     # close file syscall

 # Print content 
    li $v0, MESSAGEDIALOG                   # syscall 4 for print string
    la $a0, buffer              # load buffer address
    la $a1, 1
    syscall    

j exit
