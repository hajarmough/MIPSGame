.data

.globl goodsound_clownfish

.text

## Level 1 ##
goodsound_clownfish:
jal goodsoundfunction
j printmessage_clownfish

goodsound_pufferfish1:
jal goodsoundfunction
j printmessage_pufferfish

## Level 2 ##
goodsound_pufferfish2:
jal goodsoundfunction
j printmessage_pufferfish2

goodsound_starfish:
jal goodsoundfunction
j printmessage_starfish

## Level 3 ##
goodsound_pufferfish3:
jal goodsoundfunction
j printmessage_pufferfish3

goodsound_coral:
jal goodsoundfunction
j printmessage_coral

goodsoundfunction:
li $a2 24 	#load instrument 
li $a3 80	#set volume

#first pitch
li $a0 70	
li $a1 50	#set duraction 1000
li $v0 33	
syscall 

#pauses for 15 milliseconds
li $v0, 32
li $a0, 1
syscall
 
#second pitch
li $a0 75	
li $a1 800	#set duraction 1000
li $v0 33	
syscall 

jr $ra
