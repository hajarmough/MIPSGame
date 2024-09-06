#set color codes

.eqv	arrowBlack			0x00000000
.eqv	arrowWhite			0x00ffffff
.eqv	arrowGrey			0x00d1d8e2



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
char_posarrow: .word	79888

.globl arrowloop
###############################################

.text

arrowloop:
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
li $t9, 100            # Multiplier for bottom position	
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally


Draw_arrow:

arrow_row1:

	li $t2, arrowBlack
	sw $t2, 0($t8)
	
	li $t2, arrowBlack
	sw $t2, 4($t8)
	
	li $t2, arrowBlack
	sw $t2, 8($t8)
	
arrow_row2:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -4($t8)
	
	li $t2, arrowWhite
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowWhite
	sw $t2, 8($t8)
	
	li $t2, arrowBlack
	sw $t2, 12($t8)

arrow_row3:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -4($t8)
	
	li $t2, arrowWhite
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowWhite
	sw $t2, 8($t8)
	
	li $t2, arrowBlack
	sw $t2, 12($t8)

arrow_row4:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -4($t8)
	
	li $t2, arrowWhite
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowWhite
	sw $t2, 8($t8)
	
	li $t2, arrowBlack
	sw $t2, 12($t8)
	
arrow_row5:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -4($t8)
	
	li $t2, arrowWhite
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowWhite
	sw $t2, 8($t8)
	
	li $t2, arrowBlack
	sw $t2, 12($t8)
	
arrow_row6:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -8($t8)
	
	li $t2, arrowBlack
	sw $t2, -4($t8)
	
	li $t2, arrowWhite
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowWhite
	sw $t2, 8($t8)
	
	li $t2, arrowBlack
	sw $t2, 12($t8)
	
	li $t2, arrowBlack
	sw $t2, 16($t8)
	
arrow_row7:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -12($t8)
	
	li $t2, arrowGrey
	sw $t2, -8($t8)
	
	li $t2, arrowWhite
	sw $t2, -4($t8)
	
	li $t2, arrowWhite
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowWhite
	sw $t2, 8($t8)
	
	li $t2, arrowWhite
	sw $t2, 12($t8)
	
	li $t2, arrowGrey
	sw $t2, 16($t8)
	
	li $t2, arrowBlack
	sw $t2, 20($t8)
	
arrow_row8:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -12($t8)
	
	li $t2, arrowGrey
	sw $t2, -8($t8)
	
	li $t2, arrowGrey
	sw $t2, -4($t8)
	
	li $t2, arrowWhite
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowWhite
	sw $t2, 8($t8)
	
	li $t2, arrowGrey
	sw $t2, 12($t8)
	
	li $t2, arrowGrey
	sw $t2, 16($t8)
	
	li $t2, arrowBlack
	sw $t2, 20($t8)
	
arrow_row9:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, -8($t8)
	
	li $t2, arrowGrey
	sw $t2, -4($t8)
	
	li $t2, arrowGrey
	sw $t2, 0($t8)
	
	li $t2, arrowWhite
	sw $t2, 4($t8)
	
	li $t2, arrowGrey
	sw $t2, 8($t8)
	
	li $t2, arrowGrey
	sw $t2, 12($t8)
	
	li $t2, arrowBlack
	sw $t2, 16($t8)

arrow_row10:

	addi $t8, $t8 512
	
	
	li $t2, arrowBlack
	sw $t2, -4($t8)
	
	li $t2, arrowGrey
	sw $t2, 0($t8)
	
	li $t2, arrowGrey
	sw $t2, 4($t8)
	
	li $t2, arrowGrey
	sw $t2, 8($t8)
	
	li $t2, arrowBlack
	sw $t2, 12($t8)
	
arrow_row11:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, 0($t8)
	
	li $t2, arrowGrey
	sw $t2, 4($t8)
	
	li $t2, arrowBlack
	sw $t2, 8($t8)
	
arrow_row12:

	addi $t8, $t8 512
	
	li $t2, arrowBlack
	sw $t2, 4($t8)
