#set color codes

.eqv	BLACK				0x00000000
.eqv	WHITE				0x00FFFFFF
.eqv	ORANGE_CLOWNFISH		0x00ec7523
.eqv	DARK_ORANGE_CLOWNFISH		0x00b23020
.eqv	DARKER_ORANGE			0x00620e26
.eqv	YELLOW_CLOWNFISH		0x00f1ba84
.eqv	DARK_YELLOW_CLOWNFISH		0x00c67643

#bitmap details
#4 x 4 pixels
#display 256 x 256
.eqv 	PIXEL_SIZE	4
.eqv	WIDTH		128
.eqv	HEIGHT		128
.eqv	BASE		0x10040000


#syscalls used
.eqv	EXIT		10

.data 
char_pos_clownfish: .word	79888
.globl clownfish_loop
###############################################

.text

clownfish_loop:
	# Set up addresses
addi $t0, $zero, BASE

# Load measurements
li $t3, PIXEL_SIZE
li $t4, WIDTH
li $t5, HEIGHT

# -4, 40

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


Draw_clownFish:


clownFish_row1:

	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 4($t8)
	
clownFish_row2:

	addi $t8, $t8 512
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 4($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 8($t8)
	
clownFish_row3:

	addi $t8, $t8 512
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 4($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 8($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 12($t8)

clownFish_row4:

	addi $t8, $t8 512
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -8($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 4($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 8($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 12($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 16($t8)
	
clownFish_row5:

	addi $t8, $t8 512
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -24($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -20($t8)

	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -12($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, -8($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 4($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, 8($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, 12($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 16($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 20($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 24($t8)

clownFish_row6:

	addi $t8, $t8 512
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -28($t8)	
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, -24($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, -20($t8)	
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -16($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, -12($t8)	
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, -8($t8)		
		
	li $t2, ORANGE_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, 4($t8)	
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, 8($t8)		
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 12($t8)	
	
	li $t2, BLACK
	sw $t2, 16($t8)	
	
	li $t2, WHITE
	sw $t2, 20($t8)	
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 24($t8)	
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 28($t8)	
	
clownFish_row7:

	addi $t8, $t8 512
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -28($t8)	
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, -24($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, -20($t8)	
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, -16($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, -12($t8)	
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, -8($t8)		
		
	li $t2, ORANGE_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, 4($t8)	
	
	li $t2, YELLOW_CLOWNFISH
	sw $t2, 8($t8)		
	
	li $t2, ORANGE_CLOWNFISH
	sw $t2, 12($t8)	
	
	li $t2, BLACK
	sw $t2, 16($t8)	
	
	li $t2, BLACK
	sw $t2, 20($t8)	
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 24($t8)	
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 28($t8)	

clownFish_row8:

	addi $t8, $t8 512
	
	li $t2, DARKER_ORANGE
	sw $t2, -28($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -24($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -20($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, -16($t8)
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, -12($t8)	
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, -8($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, 4($t8)	
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, 8($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 12($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 16($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 20($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 24($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 28($t8)

clownFish_row9:

	addi $t8, $t8 512
	
	li $t2, DARKER_ORANGE
	sw $t2, -24($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, -20($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, -12($t8)
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, -8($t8)	
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, -4($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 0($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 4($t8)
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, 8($t8)	
	
	li $t2, DARK_YELLOW_CLOWNFISH
	sw $t2, 12($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 16($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 20($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 24($t8)

clownFish_row10:

	addi $t8, $t8 512
	
	li $t2, DARKER_ORANGE
	sw $t2, -8($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, -4($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 0($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 4($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 8($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 12($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 16($t8)
	
clownFish_row11:

	addi $t8, $t8 512
	
	li $t2, DARKER_ORANGE
	sw $t2, 0($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 4($t8)
	
	li $t2, DARK_ORANGE_CLOWNFISH
	sw $t2, 8($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 12($t8)

clownFish_row12:

	addi $t8, $t8 512
	
	li $t2, DARKER_ORANGE
	sw $t2, 4($t8)
	
	li $t2, DARKER_ORANGE
	sw $t2, 8($t8)
