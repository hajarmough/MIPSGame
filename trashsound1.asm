.data

.globl trash_sound1

.text

trash_sound1:
jal trashsoundfunction
j printmessage_waterbottle

trash_sound2:
jal trashsoundfunction
j printmessage_soda

trash_sound3:
jal trashsoundfunction
j printmessage_oilbarrel

trashsoundfunction:
li $a2 63 	#load instrument 
li $a3 80	#set volume

#first pitch
li $a0 41	
li $a1 1000	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
    
#second pitch
li $a0 34	
li $a1 1000	#set duraction 1000
li $v0 33	
syscall 

jr $ra

