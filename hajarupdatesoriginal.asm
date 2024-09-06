.data

##### Welcome Prompt #####						
welcome: .asciiz "Welcome to AquaVenture!\nThis game is designed to educate you about Marine Life.\nYour task is to collect everything on the screen, and be friendly."

##### Ask useres whether they want to run the program #####
asktorun: .asciiz "Would you like to continue with the program? (You can quit anytime with 'x')"

clownfishmessage1: .asciiz "You found a clownfish! Did you know? Clownfish communicate by making popping and clicking noises!\n (No, not popping like a stack in Assembly.)"
waterbottlemessage1: .asciiz "You've just collected a water bottle!\nThese microplastics are incredibly challenging to clean up and can be ingested by marine creatures at the base of the food chain,\neventually making their way up to larger animals and humans."
pufferfishmessage1: .asciiz "OH NO! THE PUFFERFISH IS GOING TO GET THE WATER BOTTLE! THAT'S HARMFUL, PLEASE STOP IT!!!\nPufferfish are infamous for their ability to inflate their bodies to deter predators.\nSome species also have potent toxins in their organs, particularly in their skin, liver, and ovaries, making them one of the most poisonous animals in the world."
pufferfishmessage2: .asciiz "You’ve run into the sassy pufferfish!!\nSome species of pufferfish are known for their impressive ability to create intricate geometric patterns in the sand on the seafloor.\nMales construct these 'crop circles' to attract mates, using their fins to create the designs."
starfishmessage2: .asciiz "You’ve run into a starfish!\nStarfish have an incredible ability to regenerate lost limbs.\nIf a starfish loses an arm due to predation or injury, it can regrow that arm over time,\ngiven the central part of the body, containing vital organs, remains intact."
sodamessage2: .asciiz "You just collected a can!\nCans in the ocean cause physical harm to marine life,\nas they can be mistaken for food or get tangled in them.\nAnimals might ingest or become entangled in cans, causing injury or even death."
pufferfishmessage3: .asciiz "Why is this fish still here!\nWell, pufferfish are surprisingly intelligent and can learn to associate certain actions with rewards.\nIn captivity, they have demonstrated problem-solving abilities and can recognize their environment and even their keepers.\nExplains why its following us..."
oilbarrelmessage3: .asciiz "You've run into a oil barrel!\nWhen it gets into the water, it can be ingested by marine animals,\ncausing health problems or death.\nIt also affects the reproductive abilities of various species, leading to long-term ecological damage."
coralmessage3: .asciiz "You’ve run into a coral!\nCoral reefs are among the most diverse ecosystems on the planet.\nEven though they cover less than 1% of the ocean floor, they support around 25% of all marine species."
level1done: .asciiz "Congratulations, you finished level 1!"
level2done: .asciiz "Congratulations, you finished level 2!"
level3done: .asciiz "Congratulations, you finished level 3!"
level1todo: .asciiz "You have to touch the items in this order!\n1-Clownfish\n2-Water Bottle\n3-Sassy Pufferfish\n4-Reach for the end under the arrow!\nGood Luck!"
level2todo: .asciiz "You have to touch the items in this order!\n1-Pufferfish\n2-Starfish\n3-Soda\n4-Reach for the end under the arrow!\nGood Luck!"
level3todo: .asciiz "You have to touch the items in this order!\n1-Pufferfish\n2-Coral\n3-Oil Barrel\n4-Reach for the end under the arrow!\nGood Luck!"

thankyou: .asciiz "Well then...Goodbye. "	

# Set color codes
.eqv 	LIGHTBLUE 	0x005DBEE8
.eqv	ORANGE		0x00FFA024
.eqv	DARK_ORANGE	0x00FF6803
.eqv	YELLOW		0x00FFFC7C
.eqv	DARK_RED	0x00CD3000
.eqv	LIGHT_YELLOW	0x00E4E2B0
.eqv	BLUE		0x003FCCFF
.eqv	DARK_BLUE	0x000066CC
.eqv	LIGHT_BLUE	0x0064F0FF
.eqv 	BLUE2 		0x003FA2D3
.eqv 	DARKBLUE 	0x00286182
.eqv	SKYBLUE		0x0087CEEB

# Bitmap details
.eqv PIXEL_SIZE 4
.eqv WIDTH 128
.eqv HEIGHT 128
.eqv BASE 0x10040000


# Syscalls used
.eqv 	EXIT 		10
.eqv	OPENFILE	13
.eqv	READFILE	14
.eqv	CLOSEFILE	15
.eqv	TIME		30
.eqv	SLEEP		32
.eqv	MESSAGEDIALOG	55
.eqv 	CONFIRMDIALOG	50

.globl welcomeprompt

.text

################# Welcome Prompt #################

welcomeprompt:
	li $v0, MESSAGEDIALOG
	la $a0, welcome
	li $a1, 1
	syscall

################# Asking User To Run Prompt #################
    	
asktorunfunction:

#output asking users to run the code or not
	li $v0, CONFIRMDIALOG	#load print string service
	la $a0, asktorun	#load address of prompt
	syscall
	
	
#Take input of question to run
	addi $t2, $zero, 1	#if user chooses no, $a0 = 1
	addi $t3, $zero, 2	#if user chooses cancel, $a0 = 2
	
	beq $a0,$zero, start	#if user selects yes
	beq $a0, $t2, beginexit	#if user selects no
	beq $a0, $t3, beginexit	#if user selects no
	
####################################################################
# a0 - row
# a1 - col
# a2 - level

start:
    li $a0, 0		# Row offset from center of display
    li $a1, 0		# Col offset from center of display
    li $a2, 1
    
########## Background Drawing ##########    
start_loop:
    # draw background based on which level we are on
    
    beq $a2, 1, level1
    beq $a2, 2, level2
    beq $a2, 3, level3
    j level4

level1: 
    jal draw_background_1
    jal drawing1
    jal todo1
    .include "hardcodejollymusic.asm"
    j clownfishmovement
    
level2:
    jal draw_background_2
    jal drawing2
    jal todo2
    .include "lvl2jingle.asm"
    j pufferfish2movement
    
level3:
    jal draw_background_3
    jal drawing3
    jal todo3
    .include "lvl3jingle.asm"
    j pufferfish3movement
    
level4:
    jal draw_background_4
    j finalmessage
    
#################### Movement for Clownfish ####################
clownfishmovement: 
 
    jal draw_background_1
    jal drawing1
    
post_level_clownfish: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_clownfish

    # Move up with 'w'
    beq $v0, 119, move_up_clownfish

    # Move down with 's'
    beq $v0, 115, move_down_clownfish
    
    # Move right with 'd'
    beq $v0, 100, move_right_clownfish
    
    beq $v0, 120, beginexit
    j start_loop
    
## Movement Functions ##
    
    move_left_clownfish:
    add $a1, $a1, -3
    j check_clownfish

    move_up_clownfish:
    add $a0, $a0, -3
    j check_clownfish

    move_down_clownfish:
    add $a0, $a0, 3
    j check_clownfish

    move_right_clownfish:
    add $a1, $a1, 3
    j check_clownfish

####################  

#################### Movement for Water Bottle ####################
waterbottlemovement:  

    jal draw_background_1
    jal drawing1
    
post_level_waterbottle: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_waterbottle

    # Move up with 'w'
    beq $v0, 119, move_up_waterbottle

    # Move down with 's'
    beq $v0, 115, move_down_waterbottle
    
    # Move right with 'd'
    beq $v0, 100, move_right_waterbottle
    
    beq $v0, 120, beginexit
    j waterbottlemovement
    
## Movement Functions ##
    
    move_left_waterbottle:
    add $a1, $a1, -3
    j check_waterbottle

    move_up_waterbottle:
    add $a0, $a0, -3
    j check_waterbottle

    move_down_waterbottle:
    add $a0, $a0, 3
    j check_waterbottle

    move_right_waterbottle:
    add $a1, $a1, 3
    j check_waterbottle

####################    

#################### Movement for Pufferfish ####################
pufferfishmovement:  

    jal draw_background_1
    jal drawing1
    
post_level_pufferfish: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_pufferfish

    # Move up with 'w'
    beq $v0, 119, move_up_pufferfish

    # Move down with 's'
    beq $v0, 115, move_down_pufferfish
    
    # Move right with 'd'
    beq $v0, 100, move_right_pufferfish
    
    beq $v0, 120, beginexit
    j pufferfishmovement
    
## Movement Functions ##
    
    move_left_pufferfish:
    add $a1, $a1, -3
    j check_pufferfish

    move_up_pufferfish:
    add $a0, $a0, -3
    j check_pufferfish

    move_down_pufferfish:
    add $a0, $a0, 3
    j check_pufferfish

    move_right_pufferfish:
    add $a1, $a1, 3
    j check_pufferfish

####################    

#################### Movement Input For Level 1 ####################
movement1:

    jal draw_background_1
    jal drawing1
    
post_level1: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left1

    # Move up with 'w'
    beq $v0, 119, move_up1

    # Move down with 's'
    beq $v0, 115, move_down1
    
    # Move right with 'd'
    beq $v0, 100, move_right1
    
    beq $v0, 120, beginexit
    j start_loop
    
 
## Movement Functions ##
    
    move_left1:
    add $a1, $a1, -3
    j check_level1

    move_up1:
    add $a0, $a0, -3
    j check_level1

    move_down1:
    add $a0, $a0, 3
    j check_level1

    move_right1:
    add $a1, $a1, 3
    j check_level1
####################    
 
#################### Movement for Pufferfish Level 2 ####################
pufferfish2movement:  

    jal draw_background_2
    jal drawing2
    
post_level_pufferfish2: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_pufferfish2

    # Move up with 'w'
    beq $v0, 119, move_up_pufferfish2

    # Move down with 's'
    beq $v0, 115, move_down_pufferfish2
    
    # Move right with 'd'
    beq $v0, 100, move_right_pufferfish2
    
    beq $v0, 120, beginexit
    j pufferfish2movement
    
## Movement Functions ##
    
    move_left_pufferfish2:
    add $a1, $a1, -3
    j check_pufferfish2

    move_up_pufferfish2:
    add $a0, $a0, -3
    j check_pufferfish2

    move_down_pufferfish2:
    add $a0, $a0, 3
    j check_pufferfish2

    move_right_pufferfish2:
    add $a1, $a1, 3
    j check_pufferfish2

####################    

#################### Movement for Starfish ####################
starfishmovement:  

    jal draw_background_2
    jal drawing2
    
post_level_starfish: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_starfish

    # Move up with 'w'
    beq $v0, 119, move_up_starfish

    # Move down with 's'
    beq $v0, 115, move_down_starfish
    
    # Move right with 'd'
    beq $v0, 100, move_right_starfish
    
    beq $v0, 120, beginexit
    j starfishmovement
    
## Movement Functions ##
    
    move_left_starfish:
    add $a1, $a1, -3
    j check_starfish

    move_up_starfish:
    add $a0, $a0, -3
    j check_starfish

    move_down_starfish:
    add $a0, $a0, 3
    j check_starfish

    move_right_starfish:
    add $a1, $a1, 3
    j check_starfish

####################    

#################### Movement for Pufferfish ####################
sodamovement:  

    jal draw_background_2
    jal drawing2
    
post_level_soda: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_soda

    # Move up with 'w'
    beq $v0, 119, move_up_soda

    # Move down with 's'
    beq $v0, 115, move_down_soda
    
    # Move right with 'd'
    beq $v0, 100, move_right_soda
    
    beq $v0, 120, beginexit
    j sodamovement
    
## Movement Functions ##
    
    move_left_soda:
    add $a1, $a1, -3
    j check_soda

    move_up_soda:
    add $a0, $a0, -3
    j check_soda

    move_down_soda:
    add $a0, $a0, 3
    j check_soda

    move_right_soda:
    add $a1, $a1, 3
    j check_soda

####################  

#################### Movement Input For Level 2 ####################
movement2:

    jal draw_background_2
    jal drawing2
    
post_level2: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left2

    # Move up with 'w'
    beq $v0, 119, move_up2

    # Move down with 's'
    beq $v0, 115, move_down2
    
    # Move right with 'd'
    beq $v0, 100, move_right2
    
    beq $v0, 120, beginexit
    j start_loop
    
## Movement Functions ##
    
    move_left2:
    add $a1, $a1, -3
    j check_level2

    move_up2:
    add $a0, $a0, -3
    j check_level2

    move_down2:
    add $a0, $a0, 3
    j check_level2

    move_right2:
    add $a1, $a1, 3
    j check_level2
####################  

#################### Movement for Pufferfish Level 3 ####################
pufferfish3movement:  

    jal draw_background_3
    jal drawing3
    
post_level_pufferfish3: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_pufferfish3

    # Move up with 'w'
    beq $v0, 119, move_up_pufferfish3

    # Move down with 's'
    beq $v0, 115, move_down_pufferfish3
    
    # Move right with 'd'
    beq $v0, 100, move_right_pufferfish3
    
    beq $v0, 120, beginexit
    j pufferfish3movement
    
## Movement Functions ##
    
    move_left_pufferfish3:
    add $a1, $a1, -3
    j check_pufferfish3

    move_up_pufferfish3:
    add $a0, $a0, -3
    j check_pufferfish3

    move_down_pufferfish3:
    add $a0, $a0, 3
    j check_pufferfish3

    move_right_pufferfish3:
    add $a1, $a1, 3
    j check_pufferfish3

####################    

#################### Movement for Coral ####################
coralmovement:  

    jal draw_background_3
    jal drawing3
    
post_level_coral: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_coral

    # Move up with 'w'
    beq $v0, 119, move_up_coral

    # Move down with 's'
    beq $v0, 115, move_down_coral
    
    # Move right with 'd'
    beq $v0, 100, move_right_coral
    
    beq $v0, 120, beginexit
    j coralmovement
    
## Movement Functions ##
    
    move_left_coral:
    add $a1, $a1, -3
    j check_coral

    move_up_coral:
    add $a0, $a0, -3
    j check_coral

    move_down_coral:
    add $a0, $a0, 3
    j check_coral

    move_right_coral:
    add $a1, $a1, 3
    j check_coral

####################    

#################### Movement for Oil Barrel ####################
oilbarrelmovement:  

    jal draw_background_3
    jal drawing3
    
post_level_oilbarrel: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left_oilbarrel

    # Move up with 'w'
    beq $v0, 119, move_up_oilbarrel

    # Move down with 's'
    beq $v0, 115, move_down_oilbarrel
    
    # Move right with 'd'
    beq $v0, 100, move_right_oilbarrel
    
    beq $v0, 120, beginexit
    j oilbarrelmovement
    
## Movement Functions ##
    
    move_left_oilbarrel:
    add $a1, $a1, -3
    j check_oilbarrel

    move_up_oilbarrel:
    add $a0, $a0, -3
    j check_oilbarrel

    move_down_oilbarrel:
    add $a0, $a0, 3
    j check_oilbarrel

    move_right_oilbarrel:
    add $a1, $a1, 3
    j check_oilbarrel

####################  

#################### Movement Input For Level 3 ####################
movement3:

    jal draw_background_3
    jal drawing3
    
post_level3: 
   
    sub $sp, $sp, 8	# Adds 8 to sp to make room for func arguments
    sw $a0, 4($sp)	# Adds width/height to stack
    sw $a1, 8($sp)
    jal draw_sub
    add $sp, $sp, 8 	# Restores the stack
    li $v0, 12		# Read char
    syscall
    
########## Movement Input ##########

 ## Keyboard Input ## 
    # Move left with 'a'
    beq $v0, 97, move_left3

    # Move up with 'w'
    beq $v0, 119, move_up3

    # Move down with 's'
    beq $v0, 115, move_down3
    
    # Move right with 'd'
    beq $v0, 100, move_right3
    
    beq $v0, 120, beginexit
    j start_loop
    
## Movement Functions ##
    
    move_left3:
    add $a1, $a1, -3
    j check_level3

    move_up3:
    add $a0, $a0, -3
    j check_level3

    move_down3:
    add $a0, $a0, 3
    j check_level3

    move_right3:
    add $a1, $a1, 3
    j check_level3
 
#################### Check Clownfish ####################
check_clownfish:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, clownfishtouch #y
    blt $a1, 47, clownfishtouch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Water Bottle ####################
check_waterbottle:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, waterbottletouch #y
    blt $a1, 47, waterbottletouch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Pufferfish Level 1 ####################
check_pufferfish:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, pufferfishtouch #y
    blt $a1, 47, pufferfishtouch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Level 1  #################
check_level1:
    blt $a0, 47, movement1 # arrow placement
    blt $a1, 47, movement1 # arrow placement
    
    li $a0, 0
    li $a1, 0
    
    j cheesetouch1
    
#################### Check Pufferfish Level 2 ####################
check_pufferfish2:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, pufferfish2touch #y
    blt $a1, 47, pufferfish2touch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Starfish ####################
check_starfish:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, starfishtouch #y
    blt $a1, 47, starfishtouch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Soda ####################
check_soda:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, sodatouch #y
    blt $a1, 47, sodatouch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Level 2  #################
check_level2:
    blt $a0, 47, movement2 #y
    blt $a1, 47, movement2 #x
    
    li $a0, 0
    li $a1, 0
    
    j cheesetouch2

#################### Check Pufferfish Level 3 ####################
check_pufferfish3:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, pufferfish3touch #y
    blt $a1, 47, pufferfish3touch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop

#################### Check Coral ####################
check_coral:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, coraltouch #y
    blt $a1, 47, coraltouch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Coral ####################
check_oilbarrel:    

    # check if sub is in the bottom right corner and if so move to the next level
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 47, oilbarreltouch #y
    blt $a1, 47, oilbarreltouch #x

    li $a0, 0
    li $a1, 0
    
    j start_loop
    
#################### Check Level 3  #################
check_level3:
    blt $a0, 47, movement3 #y
    blt $a1, 47, movement3 #x
    
    li $a0, 0
    li $a1, 0
    
    j cheesetouch3
          
#################### Check Clownfish Touch ####################
clownfishtouch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    # -25, 25
    blt $a0, -25,clownfishmovement
    blt $a1, 25, clownfishmovement
 
    li $a0, 0
    li $a1, 0
    
playgood:

   .include "goodsounds.asm"

printmessage_clownfish:

    li $v0, MESSAGEDIALOG  
    la $a0, clownfishmessage1       
    la $a1, 1
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 1
   
    j waterbottlemovement
    
#################### Check Water Bottle Touch ####################
waterbottletouch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 17, waterbottlemovement
    blt $a1, -45, waterbottlemovement
 
    li $a0, 0
    li $a1, 0
    
playtrash:

   .include "trashsound1.asm"
   
printmessage_waterbottle:

    li $v0, MESSAGEDIALOG  
    la $a0, waterbottlemessage1         
    la $a1, 2
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 1
   
    j pufferfishmovement

#################### Check Pufferfish Touch ####################
pufferfishtouch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 17, pufferfishmovement
    blt $a1, -52, pufferfishmovement
 
    li $a0, 0
    li $a1, 0
    
playgoodpufferfish1:
  
     j goodsound_pufferfish1
        
printmessage_pufferfish:

    li $v0, MESSAGEDIALOG  
    la $a0, pufferfishmessage1         
    la $a1, 1
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 1
    
    j movement1
    
##################### Check Level One Touch ####################
cheesetouch1:

printmessage1:

    li $v0, MESSAGEDIALOG  
    la $a0, level1done          
    la $a1, 1
    syscall                
   
    addi $v0, $zero, SLEEP	
    addi $a0, $zero, 65
    syscall
   
    li $a0, 0
    li $a1, 1
    add $a2, $a2, 1
   
    j start_loop

#################### Check Pufferfish 2 Touch ####################
pufferfish2touch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 17, pufferfish2movement
    blt $a1, -52, pufferfish2movement
 
    li $a0, 0
    li $a1, 0
    
goodsoundpufferfish2:

   j goodsound_pufferfish2
   
printmessage_pufferfish2:

    li $v0, MESSAGEDIALOG  
    la $a0, pufferfishmessage2         
    la $a1, 1
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 2
   
    j starfishmovement

#################### Check Starfish Touch ####################
starfishtouch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    # -25, 25
    blt $a0, -30,starfishmovement
    blt $a1, 40, starfishmovement
 
    li $a0, 0
    li $a1, 0
goodsoundstarfish:
   j goodsound_starfish
      
printmessage_starfish:

    li $v0, MESSAGEDIALOG  
    la $a0, starfishmessage2       
    la $a1, 1
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 2
   
    j sodatouch

#################### Check Soda Touch ####################
sodatouch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 10, sodamovement
    blt $a1, 25, sodamovement
 
    li $a0, 0
    li $a1, 0
    
    
playtrash2:

   j trash_sound2
   
printmessage_soda:

    li $v0, MESSAGEDIALOG  
    la $a0, sodamessage2         
    la $a1, 2
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 2
   
    j movement2
         
##################### Check Level 2 Touch ####################
cheesetouch2:  
    
printmessage2:

    li $v0, MESSAGEDIALOG  
    la $a0, level2done          
    la $a1, 1
    syscall                
   
    addi $v0, $zero, SLEEP	
    addi $a0, $zero, 65
    syscall
   
    li $a0, 0
    li $a1, 1
    add $a2, $a2, 1
   
    j start_loop

#################### Check Pufferfish 3 Touch ####################
pufferfish3touch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 17, pufferfish3movement
    blt $a1, -52, pufferfish3movement
 
    li $a0, 0
    li $a1, 0
    
goodsoundpufferfish3:
   
    j goodsound_pufferfish3
       
printmessage_pufferfish3:

    li $v0, MESSAGEDIALOG  
    la $a0, pufferfishmessage3         
    la $a1, 1
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 3
   
    j coralmovement
    
#################### Check Coral Touch ####################
coraltouch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 36, coralmovement
    blt $a1, -35, coralmovement
 
    li $a0, 0
    li $a1, 0
    
goodsoundcoral:
 
    j goodsound_coral
        
printmessage_coral:

    li $v0, MESSAGEDIALOG  
    la $a0, coralmessage3         
    la $a1, 1
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
    li $a2, 3
   
    j oilbarrelmovement
   
#################### Check Coral Touch ####################
oilbarreltouch:
	
    # check if sub is touching item
    # if a0 > 40 and a1 > 40 increment level
    blt $a0, 10, oilbarrelmovement
    blt $a1, 25, oilbarrelmovement
 
    li $a0, 0
    li $a1, 0
    li $a2, 3
    
play_trash3:

   j trash_sound3
   
printmessage_oilbarrel:

    li $v0, MESSAGEDIALOG  
    la $a0, oilbarrelmessage3         
    la $a1, 2
    syscall          
  
    addi $v0, $zero, SLEEP	#helps message box show
    addi $a0, $zero, 20
    syscall
   
    li $a0, 0
    li $a1, 1
   
    j movement3
     
##################### Check Level 3 Touch ####################
cheesetouch3:

printmessage3:

    li $v0, MESSAGEDIALOG  
    la $a0, level3done            
    la $a1, 1
    syscall                
   
    addi $v0, $zero, SLEEP	
    addi $a0, $zero, 65
    syscall
   
    li $a0, 0
    li $a1, 1
    add $a2, $a2, 1
   
    j start_loop
   
    
#################### Background Drawing ####################

## Level 4 Background ##
draw_background_4:
	sub $sp, $sp, 4
    sw $ra, 4($sp)   
                    
# Loop for printing pixels for the entire background
    li $t0, 0       # Initialize row counter
    
loop_row4:
    li $t1, 0       # Initialize column counter

loop_col4:

    # Calculate memory address for current pixel
    mul $t2, $t0, WIDTH   # $t2 = row_counter * WIDTH
    add $t2, $t2, $t1     # $t2 = $t2 + column_counter
    sll $t2, $t2, 2       # Multiply by 4 (each pixel is 4 bytes)
    add $t2, $t2, BASE    # Add base address

    # Store pixel color (assuming storing a white pixel)
    addi $s0, $zero, SKYBLUE
    sw $s0, 0($t2)      # Store pixel color to memory at calculated address

    # Move to the next column (increment column counter)
    addi $t1, $t1, 1

    # Check if column counter reached the end (WIDTH pixels in a row)
    li $t3, WIDTH
    bne $t1, $t3, loop_col4  # Loop if column counter != WIDTH

    # Move to the next row (increment row counter)
    addi $t0, $t0, 1

    # Check if row counter reached the end (HEIGHT rows)
    li $t4, HEIGHT
    bne $t0, $t4, loop_row4  # Loop if row counter != HEIGHT
    
    lw $ra, 4($sp)
    add $sp, $sp, 4
    jr $ra   
             
## Level 3 Background ##      
draw_background_3:
    sub $sp, $sp, 4
    sw $ra, 4($sp)   
                    
# Loop for printing pixels for the entire background
    li $t0, 0       # Initialize row counter
    
loop_row3:
    li $t1, 0       # Initialize column counter

loop_col3:

    # Calculate memory address for current pixel
    mul $t2, $t0, WIDTH   # $t2 = row_counter * WIDTH
    add $t2, $t2, $t1     # $t2 = $t2 + column_counter
    sll $t2, $t2, 2       # Multiply by 4 (each pixel is 4 bytes)
    add $t2, $t2, BASE    # Add base address

    # Store pixel color (assuming storing a white pixel)
    addi $s0, $zero, DARKBLUE
    sw $s0, 0($t2)      # Store pixel color to memory at calculated address

    # Move to the next column (increment column counter)
    addi $t1, $t1, 1

    # Check if column counter reached the end (WIDTH pixels in a row)
    li $t3, WIDTH
    bne $t1, $t3, loop_col3  # Loop if column counter != WIDTH

    # Move to the next row (increment row counter)
    addi $t0, $t0, 1

    # Check if row counter reached the end (HEIGHT rows)
    li $t4, HEIGHT
    bne $t0, $t4, loop_row3  # Loop if row counter != HEIGHT
    
    lw $ra, 4($sp)
    add $sp, $sp, 4
    jr $ra            

## Level 2 Background ##

draw_background_2:
    sub $sp, $sp, 4
    sw $ra, 4($sp)
    
# Loop for printing pixels for the entire background
    li $t0, 0       # Initialize row counter
    
loop_row2bg2:
    li $t1, 0       # Initialize column counter

loop_col2bg2:

    # Calculate memory address for current pixel
    mul $t2, $t0, WIDTH   # $t2 = row_counter * WIDTH
    add $t2, $t2, $t1     # $t2 = $t2 + column_counter
    sll $t2, $t2, 2       # Multiply by 4 (each pixel is 4 bytes)
    add $t2, $t2, BASE    # Add base address

    # Store pixel color (assuming storing a white pixel)
    addi $s0, $zero, BLUE2
    sw $s0, 0($t2)      # Store pixel color to memory at calculated address

    # Move to the next column (increment column counter)
    addi $t1, $t1, 1

    # Check if column counter reached the end (WIDTH pixels in a row)
    li $t3, WIDTH
    bne $t1, $t3, loop_col2bg2  # Loop if column counter != WIDTH

    # Move to the next row (increment row counter)
    addi $t0, $t0, 1

    # Check if row counter reached the end (HEIGHT rows)
    li $t4, HEIGHT
    bne $t0, $t4, loop_row2bg2  # Loop if row counter != HEIGHT
    
    lw $ra, 4($sp)
    add $sp, $sp, 4
    jr $ra

## Level 1 Background ##
draw_background_1:

# Set up addresses
addi $t0, $zero, BASE

# Load measurements
li $t3, PIXEL_SIZE
li $t4, WIDTH
li $t5, HEIGHT

# Calculate position for bottom center of the screen
mul $t6, $t4, $t3    # Total width in pixels
div $t6, $t6, -4       # Half of the total width	

mul $t7, $t5, $t3    # Total height in pixels
li $t9, 40            # Multiplier for bottom position	
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally
    sub $sp, $sp, 4
    sw $ra, 4($sp)

    # Loop for printing pixels for the entire background
    li $t0, 0       # Initialize row counter
    
loop_row1:
    li $t1, 0       # Initialize column counter

loop_col1:

    # Calculate memory address for current pixel
    mul $t2, $t0, WIDTH   # $t2 = row_counter * WIDTH
    add $t2, $t2, $t1     # $t2 = $t2 + column_counter
    sll $t2, $t2, 2       # Multiply by 4 (each pixel is 4 bytes)
    add $t2, $t2, BASE    # Add base address

    # Store pixel color (assuming storing a white pixel)
    addi $s0, $zero, LIGHTBLUE
    sw $s0, 0($t2)      # Store pixel color to memory at calculated address

    # Move to the next column (increment column counter)
    addi $t1, $t1, 1

    # Check if column counter reached the end (WIDTH pixels in a row)
    li $t3, WIDTH
    bne $t1, $t3, loop_col1  # Loop if column counter != WIDTH

    # Move to the next row (increment row counter)
    addi $t0, $t0, 1

    # Check if row counter reached the end (HEIGHT rows)
    li $t4, HEIGHT
    bne $t0, $t4, loop_row1  # Loop if row counter != HEIGHT

    # Prologue, restores stack pointer, returns to return address
    lw $ra, 4($sp)
    add $sp, $sp, 4
    jr $ra
    
#################### Submarine Drawing ####################
draw_sub:

    sub $sp, $sp, 4
    sw $ra, 4($sp)
    lw $s0, 8($sp)	# Load the row offset into $s0
    lw $s1, 12($sp)	# Load column offset into $s1
    

loop:
	
	# include item pixel files
	.include "arrow.asm"
	
	#load base address
	addi $t0, $zero, BASE

	#load measurements
	li $t3, PIXEL_SIZE
	li $t4, WIDTH
	li $t5, HEIGHT
	
	#find middle of display 
	div $t6, $t4, 2
	mul $t6, $t6, PIXEL_SIZE
	
	#find middle row
	div $t7, $t5, 2
	mul $t7, $t7, PIXEL_SIZE
	mul $t7, $t7, HEIGHT
	mul $s0, $s0, PIXEL_SIZE 	# Calculate row offset
	mul $s0, $s0, WIDTH	
	add $t7, $t7, $s0
	
	#find middle of middle row
	add $t8, $t7, $t6
	add $t8, $t8, BASE
	mul $s1, $s1, PIXEL_SIZE
	add $t8, $t8, $s1

## Row Drawings ##
rwone_row1:
	li $t2, ORANGE
	sw $t2, 0($t8)
	li $t2, ORANGE
	sw $t2, 4($t8)
	
rwone_row2:	

	addi $t8, $t8 512
	li $t2, DARK_ORANGE
	sw $t2, 0($t8)
	
rwone_row3:

	addi $t8, $t8 512
	li $t2, DARK_ORANGE
	sw $t2, 0($t8)
	
rwone_row4:

	addi $t8, $t8 512
	li $t2, DARK_ORANGE
	sw $t2, -8($t8)
	li $t2, DARK_ORANGE
	sw $t2, -4($t8)
	li $t2, ORANGE
	sw $t2, 0($t8)
	li $t2, YELLOW
	sw $t2, 4($t8)
	li $t2, ORANGE
	sw $t2, 8($t8)
	
rwone_row5:

	addi $t8, $t8 512
	li $t2, DARK_ORANGE
	sw $t2, -8($t8)
	li $t2, DARK_ORANGE
	sw $t2, -4($t8)
	li $t2, ORANGE
	sw $t2, 0($t8)
	li $t2, YELLOW
	sw $t2, 4($t8)
	li $t2, ORANGE
	sw $t2, 8($t8)

rwone_row6:

	addi $t8, $t8 512
	li $t2, DARK_ORANGE
	sw $t2, -8($t8)
	li $t2, DARK_RED
	sw $t2, -4($t8)
	li $t2, DARK_ORANGE
	sw $t2, 0($t8)
	li $t2, DARK_ORANGE
	sw $t2, 4($t8)
	li $t2, DARK_ORANGE
	sw $t2, 8($t8)
	
rwone_row7:

	addi $t8, $t8 512
	li $t2, ORANGE
	sw $t2, -20($t8)
	li $t2, ORANGE
	sw $t2, -16($t8)
	li $t2, ORANGE
	sw $t2, -12($t8)
	li $t2, ORANGE
	sw $t2, -8($t8)
	li $t2, ORANGE
	sw $t2, -4($t8)
	li $t2, ORANGE
	sw $t2, 0($t8)
	li $t2, ORANGE
	sw $t2, 4($t8)
	li $t2, ORANGE
	sw $t2, 8($t8)
	li $t2, ORANGE
	sw $t2, 12($t8)
	li $t2, ORANGE
	sw $t2, 16($t8)
	li $t2, LIGHT_YELLOW
	sw $t2, 20($t8)
	li $t2, DARK_BLUE
	sw $t2, 24($t8)
	li $t2, DARK_BLUE
	sw $t2, 28($t8)
	
rwone_row8:

	addi $t8, $t8 512
	li $t2, ORANGE
	sw $t2, -36($t8)
	li $t2, ORANGE
	sw $t2, -32($t8)
	li $t2, ORANGE
	sw $t2, -24($t8)
	li $t2, ORANGE
	sw $t2, -20($t8)
	li $t2, ORANGE
	sw $t2, -16($t8)
	li $t2, ORANGE
	sw $t2, -12($t8)
	li $t2, ORANGE
	sw $t2, -8($t8)
	li $t2, ORANGE
	sw $t2, -4($t8)
	li $t2, ORANGE
	sw $t2, 0($t8)
	li $t2, ORANGE
	sw $t2, 4($t8)
	li $t2, ORANGE
	sw $t2, 8($t8)
	li $t2, ORANGE
	sw $t2, 12($t8)
	li $t2, LIGHT_YELLOW
	sw $t2, 16($t8)
	li $t2, BLUE
	sw $t2, 20($t8)
	li $t2, BLUE
	sw $t2, 24($t8)
	li $t2, LIGHT_BLUE
	sw $t2, 28($t8)
	li $t2, DARK_BLUE
	sw $t2, 32($t8)
	
	
rwone_row9:

	addi $t8, $t8 512
	li $t2, YELLOW
	sw $t2, -36($t8)
	li $t2, YELLOW
	sw $t2, -32($t8)
	li $t2, DARK_ORANGE
	sw $t2, -28($t8)
	li $t2, ORANGE
	sw $t2, -24($t8)
	li $t2, YELLOW
	sw $t2, -20($t8)
	li $t2, YELLOW
	sw $t2, -16($t8)
	li $t2, YELLOW 
	sw $t2, -12($t8)
	li $t2, ORANGE
	sw $t2, -8($t8)
	li $t2, LIGHT_YELLOW
	sw $t2, -4($t8)
	li $t2, LIGHT_YELLOW
	sw $t2, 0($t8)
	li $t2, ORANGE
	sw $t2, 4($t8)
	li $t2, YELLOW
	sw $t2, 8($t8)
	
	li $t2, YELLOW 
	sw $t2, 12($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 16($t8)
	
	li $t2, BLUE
	sw $t2, 20($t8)
	
	li $t2, BLUE
	sw $t2, 24($t8)
	
	li $t2, BLUE
	sw $t2, 28($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 32($t8)
	
rwone_row10:

	addi $t8, $t8 512
	
	li $t2, DARK_ORANGE
	sw $t2, -40($t8)
	
	li $t2, ORANGE
	sw $t2, -36($t8)
	
	
	li $t2, ORANGE
	sw $t2, -32($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -28($t8)
	
	li $t2, ORANGE
	sw $t2, -24($t8)
	
	li $t2, YELLOW
	sw $t2, -20($t8)
	
	li $t2, YELLOW
	sw $t2, -16($t8)
	
	li $t2, ORANGE 
	sw $t2, -12($t8)

	li $t2, LIGHT_YELLOW
	sw $t2, -8($t8)
	
	li $t2, DARK_BLUE
	sw $t2, -4($t8)
	
	li $t2, LIGHT_BLUE
	sw $t2, 0($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 4($t8)
	
	li $t2, ORANGE
	sw $t2, 8($t8)
	
	li $t2, YELLOW 
	sw $t2, 12($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 16($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 20($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 24($t8)
	
	li $t2, BLUE
	sw $t2, 28($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 32($t8)
	
	
rwone_row11:

	addi $t8, $t8 512
	
	li $t2, DARK_RED
	sw $t2, -40($t8)
	
	li $t2, ORANGE
	sw $t2, -36($t8)
	
	li $t2, ORANGE
	sw $t2, -32($t8)
	
	li $t2, DARK_RED
	sw $t2, -28($t8)
	
	li $t2, ORANGE
	sw $t2, -24($t8)
	
	li $t2, ORANGE
	sw $t2, -20($t8)
	
	li $t2, ORANGE
	sw $t2, -16($t8)
	
	li $t2, ORANGE 
	sw $t2, -12($t8)

	li $t2, LIGHT_YELLOW
	sw $t2, -8($t8)
	
	li $t2, DARK_BLUE
	sw $t2, -4($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 0($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 4($t8)
	
	li $t2, ORANGE
	sw $t2, 8($t8)
	
	li $t2, ORANGE
	sw $t2, 12($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 16($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 20($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 24($t8)
	
	li $t2, BLUE
	sw $t2, 28($t8)
	
	li $t2, DARK_BLUE
	sw $t2, 32($t8)
	
rwone_row12:

	li $t2, DARK_RED
	sw $t2, -40($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -36($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -32($t8)
	
	li $t2, DARK_RED
	sw $t2, -28($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -24($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -20($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -16($t8)
	
	li $t2, DARK_ORANGE 
	sw $t2, -12($t8)

	li $t2, DARK_ORANGE
	sw $t2, -8($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, -4($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 0($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 4($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 8($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 12($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 16($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 20($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 24($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 28($t8)
	
	li $t2, LIGHT_YELLOW
	sw $t2, 32($t8)
	
rwone_row13:

	addi $t8, $t8 512
	
	
	li $t2, DARK_ORANGE
	sw $t2, -36($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -32($t8)
	
	li $t2, DARK_RED
	sw $t2, -28($t8)
	
	li $t2, DARK_RED
	sw $t2, -24($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -20($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -16($t8)
	
	li $t2, DARK_ORANGE 
	sw $t2, -12($t8)

	li $t2, DARK_ORANGE
	sw $t2, -8($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -4($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 0($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 4($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 8($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 12($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 16($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 20($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, 24($t8)
	
	li $t2, DARK_RED
	sw $t2, 28($t8)
	
	li $t2, DARK_RED
	sw $t2, 32($t8)
	
rwone_row14:

	addi $t8, $t8 512
	
	
	li $t2, DARK_ORANGE
	sw $t2, -36($t8)
	
	li $t2, DARK_ORANGE
	sw $t2, -32($t8)
	
	
	li $t2, DARK_RED
	sw $t2, -24($t8)
	
	li $t2, DARK_RED
	sw $t2, -20($t8)
	
	li $t2, DARK_RED
	sw $t2, -16($t8)
	
	li $t2, DARK_RED 
	sw $t2, -12($t8)

	li $t2, DARK_RED
	sw $t2, -8($t8)
	
	li $t2, DARK_RED
	sw $t2, -4($t8)
	
	li $t2, DARK_RED
	sw $t2, 0($t8)
	
	li $t2, DARK_RED
	sw $t2, 4($t8)
	
	li $t2, DARK_RED
	sw $t2, 8($t8)
	
	li $t2, DARK_RED
	sw $t2, 12($t8)
	
	li $t2, DARK_RED
	sw $t2, 16($t8)
	
	li $t2, DARK_RED
	sw $t2, 20($t8)
	
	li $t2, DARK_RED
	sw $t2, 24($t8)
	
	li $t2, DARK_RED
	sw $t2, 28($t8)
		
rwone_row15:

	addi $t8, $t8 512
	
	li $t2, DARK_RED
	sw $t2, -20($t8)
	
	li $t2, DARK_RED
	sw $t2, -16($t8)
	
	li $t2, DARK_RED 
	sw $t2, -12($t8)

	li $t2, DARK_RED
	sw $t2, -8($t8)
	
	li $t2, DARK_RED
	sw $t2, -4($t8)
	
	li $t2, DARK_RED
	sw $t2, 0($t8)
	
	li $t2, DARK_RED
	sw $t2, 4($t8)
	
	li $t2, DARK_RED
	sw $t2, 8($t8)
	
	li $t2, DARK_RED
	sw $t2, 12($t8)
	
	li $t2, DARK_RED
	sw $t2, 16($t8)
	
	li $t2, DARK_RED
	sw $t2, 20($t8)
	
	li $t2, DARK_RED
	sw $t2, 24($t8)
	

	lw $ra, 4($sp)
	add $sp, $sp, 4
	jr $ra
	
#################### Item Drawings ####################

##########
drawing1:
.include "waterBottle.asm"
.include "pufferfish.asm"
.include "clownfish.asm"

jr $ra
 ##########
 drawing2:
.include "soda.asm"
.include "pufferfish2.asm"
.include "starfish.asm"

jr $ra
 ##########
 drawing3:
.include "oilBarrel.asm"
.include "coral.asm"
.include "pufferfish3.asm"

jr $ra
 ##########

########## To - Do List ##########
todo1:
  li $v0, MESSAGEDIALOG  
  la $a0, level1todo       
  la $a1, 1
  syscall 
    
   li $a0, 0
   li $a1, 0 
 
   jr $ra

##########
todo2:
  li $v0, MESSAGEDIALOG  
  la $a0, level2todo       
  la $a1, 1
  syscall 
    
   li $a0, 0
   li $a1, 0 
 
   jr $ra
   
##########
todo3:
  li $v0, MESSAGEDIALOG  
  la $a0, level3todo       
  la $a1, 1
  syscall 
    
   li $a0, 0
   li $a1, 0 
 
   jr $ra

########## Final Message ##########
finalmessage:
	.include "heart.asm"
	
########## Exit ##########
beginexit:
#Thank you message prompt
	li $v0, MESSAGEDIALOG		#load print string service
	la $a0, thankyou		#load address of prompt
	la $a1, 1
	syscall
	
	j exit
			
exit:	
li $v0, 10
syscall
