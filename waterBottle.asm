#set color codes

.eqv	DARKER_BLUE_BOTTLE			0x001c75b7
.eqv	DARK_BLUE_BOTTLE_BOTTLE				0x004087ca
.eqv	BLUE_BOTTLE				0x0067b8ea
.eqv	LIGHT_BLUE_BOTTLE				0x00b8ddf7


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
char_poswater: .word	79888

.globl waterloop

###############################################

.text

waterloop:

# Set up addresses
addi $t0, $zero, BASE

# Load measurements
li $t3, PIXEL_SIZE
li $t4, WIDTH
li $t5, HEIGHT

# Calculate position for bottom center of the screen
mul $t6, $t4, $t3    # Total width in pixels
div $t6, $t6, 4       # Half of the total width

mul $t7, $t5, $t3    # Total height in pixels
li $t9, 80            # Multiplier for bottom position
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally


Draw_Bottle:


waterBottle_row1:

	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 8($t8)
	
	
waterBottle_row2:

	addi $t8, $t8 512
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 8($t8)
	
waterBottle_row3:

	addi $t8, $t8 512
	
	li $t2, BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, LIGHT_BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 8($t8)
	
waterBottle_row4:

	addi $t8, $t8 512
	
	li $t2, BLUE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, LIGHT_BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 12($t8)

waterBottle_row5:

	addi $t8, $t8 512
	
	li $t2, BLUE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, LIGHT_BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, LIGHT_BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 12($t8)
	
waterBottle_row6:

	addi $t8, $t8 512
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 12($t8)
	
waterBottle_row7:

	addi $t8, $t8 512
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 12($t8)
	
waterBottle_row8:

	addi $t8, $t8 512
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 12($t8)

waterBottle_row9:

	addi $t8, $t8 512
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, BLUE_BOTTLE
	sw $t2, 12($t8)
	

	
waterBottle_row10:

	addi $t8, $t8 512
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 12($t8)
	
waterBottle_row11:

	addi $t8, $t8 512
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, -4($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARK_BLUE_BOTTLE_BOTTLE
	sw $t2, 8($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 12($t8)

waterBottle_row12:

	addi $t8, $t8 512
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 0($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 4($t8)
	
	li $t2, DARKER_BLUE_BOTTLE
	sw $t2, 8($t8)

