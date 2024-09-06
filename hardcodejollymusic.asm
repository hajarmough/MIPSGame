.data

.globl jollymusic

.text

jollymusic:

li $a2 7 	#load instrument 
li $a3 80	#set volume

#first pitch
li $a0 69	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 64	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#first pitch
li $a0 62	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 61	
li $a1 250	#set duraction 1000
li $v0 33	
syscall 

#first pitch
li $a0 61	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 62	
li $a1 250	#set duraction 1000
li $v0 33	
syscall 

#first pitch
li $a0 64	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 66	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#first pitch
li $a0 68	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 64	
li $a1 325	#set duraction 1000
li $v0 33	
syscall

#first pitch
li $a0 66	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 64	
li $a1 325	#set duraction 1000
li $v0 33	
syscall

#first pitch
li $a0 62	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 61	
li $a1 325	#set duraction 1000
li $v0 33	
syscall

#first pitch
li $a0 61	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 61	# MIGHT NEED TO EDIT LATER
li $a1 325	#set duraction 1000
li $v0 33	
syscall

#first pitch
li $a0 61	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 62	
li $a1 325	#set duraction 1000
li $v0 33	
syscall

#first pitch
li $a0 66	
li $a1 100	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 64	
li $a1 20	#set duraction 1000
li $v0 33	
syscall

#first pitch
li $a0 62	
li $a1 150	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 61	
li $a1 20	#set duraction 1000
li $v0 33	
syscall

li $a0, 0
li $a1, 0

j clownfishmovement
