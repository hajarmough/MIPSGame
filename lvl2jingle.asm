.data

.globl lvl2jingle

.text

lvl2jingle:

li $a2 0 	#load instrument 
li $a3 80	#set volume

#first pitch
li $a0 62	
li $a1 210	#set duraction 2100
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 64	
li $a1 210	#set duraction 2100
li $v0 33	
syscall 

#first pitch
li $a0 62	
li $a1 210	#set duraction 2100
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 71	
li $a1 210	#set duraction 2100
li $v0 33	
syscall

#first pitch
li $a0 67	
li $a1 210	#set duraction 2100
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 71	
li $a1 210	#set duraction 2100
li $v0 33	
syscall

#first pitch
li $a0 62	
li $a1 210	#set duraction 2100
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 64	
li $a1 210	#set duraction 2100
li $v0 33	
syscall

#second pitch
li $a0 62	
li $a1 210	#set duraction 2100
li $v0 33	
syscall

#second pitch
li $a0 71	
li $a1 250	#set duraction 2100
li $v0 33	
syscall

#second pitch
li $a0 62	
li $a1 210	#set duraction 2100
li $v0 33	
syscall

j pufferfish2movement
