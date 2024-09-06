#Practice bitmap program with 
#colors and motion

#set color codes

.eqv	DARK_PURPLE	0x00860035
.eqv	DARK_PINK	0x00D00053
.eqv	PINK		0x00FF4791
.eqv	LIGHT_PINK	0x00FF8484



#bitmap details
#4 x 4 pixels
#display 512 x 512
.eqv 	PIXEL_SIZE	4
.eqv	WIDTH		128
.eqv	HEIGHT		128
.eqv	BASE		0x10040000


#syscalls used
.eqv	EXIT		10

.data 
char_pos_starfish: .word	79888
.globl starfishloop

###############################################

.text

starfishloop:
    # Set up addresses
addi $t0, $zero, BASE

# Load measurements
li $t3, PIXEL_SIZE
li $t4, WIDTH
li $t5, HEIGHT

# Calculate position for bottom center of the screen
mul $t6, $t4, $t3    # Total width in pixels
div $t6, $t6, -8       # Half of the total width

mul $t7, $t5, $t3    # Total height in pixels
li $t9, 40            # Multiplier for bottom position
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally


Draw_starFish:

starfish_row1:

	li $t2, DARK_PURPLE
	sw $t2, 0($t8)

starfish_row2:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -4($t8)
	
	li $t2, DARK_PINK
	sw $t2, 0($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 4($t8)

starfish_row3:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -4($t8)
	
	li $t2, PINK
	sw $t2, 0($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 4($t8)

starfish_row4:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -8($t8)
	
	li $t2, DARK_PINK
	sw $t2, -4($t8)
	
	li $t2, PINK
	sw $t2, 0($t8)
	
	li $t2, DARK_PINK
	sw $t2, 4($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 8($t8)
	

starfish_row5:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -8($t8)
	
	li $t2, DARK_PINK
	sw $t2, -4($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, 0($t8)
	
	li $t2, DARK_PINK
	sw $t2, 4($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 8($t8)
	
starfish_row6:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -24($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -20($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -16($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -12($t8)
	
	li $t2, DARK_PINK
	sw $t2, -8($t8)
	
	li $t2, PINK
	sw $t2, -4($t8)
	
	li $t2, PINK
	sw $t2, 0($t8)
	
	li $t2, PINK
	sw $t2, 4($t8)
	
	li $t2, DARK_PINK
	sw $t2, 8($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 12($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 16($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 20($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 24($t8)
	
starfish_row7:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -28($t8)
	
	li $t2, DARK_PINK
	sw $t2, -24($t8)
	
	li $t2, PINK
	sw $t2, -20($t8)
	
	li $t2, PINK
	sw $t2, -16($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, -12($t8)
	
	li $t2, PINK
	sw $t2, -8($t8)
	
	li $t2, PINK
	sw $t2, -4($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, 0($t8)
	
	li $t2, PINK
	sw $t2, 4($t8)
	
	li $t2, PINK
	sw $t2, 8($t8)
	
	li $t2, PINK
	sw $t2, 12($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, 16($t8)
	
	li $t2, PINK
	sw $t2, 20($t8)
	
	li $t2, DARK_PINK
	sw $t2, 24($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 28($t8)

starfish_row8:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -24($t8)
	
	li $t2, DARK_PINK
	sw $t2, -20($t8)
	
	li $t2, PINK
	sw $t2, -16($t8)
	
	li $t2, PINK
	sw $t2, -12($t8)
	
	li $t2, PINK
	sw $t2, -8($t8)
	
	li $t2, PINK
	sw $t2, -4($t8)
	
	li $t2, PINK
	sw $t2, 0($t8)
	
	li $t2, PINK
	sw $t2, 4($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, 8($t8)
	
	li $t2, PINK
	sw $t2, 12($t8)
	
	li $t2, PINK
	sw $t2, 16($t8)
	
	li $t2, DARK_PINK
	sw $t2, 20($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 24($t8)
	
starfish_row9:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -20($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -16($t8)
	
	li $t2, DARK_PINK
	sw $t2, -12($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, -8($t8)
	
	li $t2, PINK
	sw $t2, -4($t8)
	
	li $t2, PINK
	sw $t2, 0($t8)

	li $t2, PINK
	sw $t2, 4($t8)
	
	li $t2, PINK
	sw $t2, 8($t8)
	
	li $t2, DARK_PINK
	sw $t2, 12($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 16($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 20($t8)
	
starfish_row10:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -12($t8)
	
	li $t2, DARK_PINK
	sw $t2, -8($t8)
	
	li $t2, PINK
	sw $t2, -4($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, 0($t8)
	
	li $t2, PINK
	sw $t2, 4($t8)
	
	li $t2, PINK
	sw $t2, 8($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 12($t8)
	
starfish_row11:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -12($t8)
	
	li $t2, DARK_PINK
	sw $t2, -8($t8)
	
	li $t2, PINK
	sw $t2, -4($t8)
	
	li $t2, PINK
	sw $t2, 0($t8)
	
	li $t2, PINK
	sw $t2, 4($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, 8($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 12($t8)
	
starfish_row12:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -16($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, -12($t8)
	
	li $t2, PINK
	sw $t2, -8($t8)
	
	li $t2, DARK_PINK
	sw $t2, -4($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 0($t8)
	
	li $t2, DARK_PINK
	sw $t2, 4($t8)
	
	li $t2, PINK
	sw $t2, 8($t8)
	
	li $t2, PINK
	sw $t2, 12($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 16($t8)
	
starfish_row13:

	addi $t8, $t8 512
	
	li $t2, DARK_PURPLE
	sw $t2, -20($t8)
	
	li $t2, PINK
	sw $t2, -16($t8)
	
	li $t2, DARK_PINK
	sw $t2, -12($t8)
	
	li $t2, DARK_PINK
	sw $t2, -8($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -4($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 4($t8)
	
	li $t2, DARK_PINK
	sw $t2, 8($t8)
	
	li $t2, DARK_PINK
	sw $t2, 12($t8)
	
	li $t2, LIGHT_PINK
	sw $t2, 16($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 20($t8)
	
starfish_row14:

	addi $t8, $t8 512

	li $t2, DARK_PURPLE
	sw $t2, -24($t8)
	
	li $t2, DARK_PINK
	sw $t2, -20($t8)
	
	li $t2, DARK_PINK
	sw $t2, -16($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -12($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -8($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 8($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 12($t8)
	
	li $t2, DARK_PINK
	sw $t2, 16($t8)
	
	li $t2, DARK_PINK
	sw $t2, 20($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 24($t8)
	
starfish_row15:

	addi $t8, $t8 512

	li $t2, DARK_PURPLE
	sw $t2, -24($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -20($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, -16($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 16($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 20($t8)
	
	li $t2, DARK_PURPLE
	sw $t2, 24($t8)
