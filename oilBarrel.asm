#set color codes

.eqv	barrelBlack			0x00000000
.eqv	barrelGrey			0x00919191
.eqv	barrelLight_Grey			0x00c5c5c5
.eqv	barrelRed			0x00ed1429
.eqv	barrelLight_Red			0x00ff5860
.eqv	barrelDark_Red			0x00c90010
.eqv	barrelDarker_Red			0x00ab0104

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
char_posoil: .word	79888

.globl oilloop

###############################################

.text

oilloop:
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
li $t9, 95            # Multiplier for bottom position	
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally


Draw_waterBottle:
oilBarrel_row1:

	li $t2, barrelBlack
	sw $t2, 0($t8)
	
	li $t2, barrelBlack
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelBlack
	sw $t2, 24($t8)
	
oilBarrel_row2:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -8($t8)
	
	li $t2, barrelBlack
	sw $t2, -4($t8)

	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelRed
	sw $t2, 12($t8)
	
	li $t2, barrelRed
	sw $t2, 16($t8)
	
	li $t2, barrelRed
	sw $t2, 20($t8)
	
	li $t2, barrelRed
	sw $t2, 24($t8)
	
	li $t2, barrelBlack
	sw $t2, 28($t8)
	
	li $t2, barrelBlack
	sw $t2, 32($t8)
	
oilBarrel_row3:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -4($t8)

	li $t2, barrelLight_Red
	sw $t2, 0($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 4($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 8($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 12($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 16($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 24($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 28($t8)
	
	li $t2, barrelRed
	sw $t2, 32($t8)
	
	li $t2, barrelBlack
	sw $t2, 36($t8)
	
oilBarrel_row4:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -8($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -4($t8)

	li $t2, barrelLight_Red
	sw $t2, 0($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 4($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 8($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 12($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 16($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 24($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 28($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 32($t8)
	
	li $t2, barrelRed
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)

oilBarrel_row5:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 0($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 4($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 8($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 12($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 16($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, 24($t8)
	
	li $t2, barrelRed
	sw $t2, 28($t8)
	
	li $t2, barrelRed
	sw $t2, 32($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)
	
oilBarrel_row6:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -8($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelRed
	sw $t2, 12($t8)
	
	li $t2, barrelRed
	sw $t2, 16($t8)
	
	li $t2, barrelRed
	sw $t2, 20($t8)
	
	li $t2, barrelRed
	sw $t2, 24($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)
	
oilBarrel_row7:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -4($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 0($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 4($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 8($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 12($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)
	
oilBarrel_row8:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelRed
	sw $t2, 12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 40($t8)
	
	li $t2, barrelBlack
	sw $t2, 44($t8)
	
oilBarrel_row9:

	
	
oilBarrel_row10:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)

oilBarrel_row11:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -4($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 0($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 4($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)

oilBarrel_row12:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 40($t8)
	
	li $t2, barrelBlack
	sw $t2, 44($t8)
	
oilBarrel_row13:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 40($t8)
	
	li $t2, barrelBlack
	sw $t2, 44($t8)

oilBarrel_row14:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelBlack
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelLight_Grey
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelBlack
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)

oilBarrel_row15:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -4($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 0($t8)
	
	li $t2, barrelBlack
	sw $t2, 4($t8)
	
	li $t2, barrelGrey
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelBlack
	sw $t2, 24($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)

oilBarrel_row16:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelBlack
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelBlack
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 40($t8)
	
	li $t2, barrelBlack
	sw $t2, 44($t8)

oilBarrel_row17:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -20($t8)
	
	li $t2, barrelLight_Red
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelBlack
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelBlack
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 40($t8)
	
	li $t2, barrelBlack
	sw $t2, 44($t8)
	
oilBarrel_row18:
	
	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)
	
oilBarrel_row19:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelDark_Red
	sw $t2, -4($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 0($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 4($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 8($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 12($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDarker_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)
	
oilBarrel_row20:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -16($t8)
	
	li $t2, barrelRed
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelRed
	sw $t2, 12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 36($t8)
	
	li $t2, barrelBlack
	sw $t2, 40($t8)
	
oilBarrel_row21:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -12($t8)
	
	li $t2, barrelRed
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelRed
	sw $t2, 12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 32($t8)
	
	li $t2, barrelBlack
	sw $t2, 36($t8)

oilBarrel_row22:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, -12($t8)
	
	li $t2, barrelBlack
	sw $t2, -8($t8)
	
	li $t2, barrelRed
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelRed
	sw $t2, 12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 28($t8)
	
	li $t2, barrelBlack
	sw $t2, 32($t8)
	
	li $t2, barrelBlack
	sw $t2, 36($t8)
	
oilBarrel_row23:

	addi $t8, $t8 512

	
	li $t2, barrelBlack
	sw $t2, -8($t8)
	
	li $t2, barrelBlack
	sw $t2, -4($t8)
	
	li $t2, barrelRed
	sw $t2, 0($t8)
	
	li $t2, barrelRed
	sw $t2, 4($t8)
	
	li $t2, barrelRed
	sw $t2, 8($t8)
	
	li $t2, barrelRed
	sw $t2, 12($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 16($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 20($t8)
	
	li $t2, barrelDark_Red
	sw $t2, 24($t8)
	
	li $t2, barrelBlack
	sw $t2, 28($t8)
	
	li $t2, barrelBlack
	sw $t2, 32($t8)

oilBarrel_row24:

	addi $t8, $t8 512
	
	li $t2, barrelBlack
	sw $t2, 0($t8)
	
	li $t2, barrelBlack
	sw $t2, 4($t8)
	
	li $t2, barrelBlack
	sw $t2, 8($t8)
	
	li $t2, barrelBlack
	sw $t2, 12($t8)
	
	li $t2, barrelBlack
	sw $t2, 16($t8)
	
	li $t2, barrelBlack
	sw $t2, 20($t8)
	
	li $t2, barrelBlack
	sw $t2, 24($t8)
	
