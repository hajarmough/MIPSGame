#set color codes

.eqv	heartBlack			0x00000000
.eqv	heartWhite			0x00ffffff
.eqv	heartRed			0x00f44236
.eqv	heartDark_Red			0x00b61c1c

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
char_posheart: .word	79888

.globl heartdrawing
###############################################

.text

########## Top Right Placement ##########
heartdrawing:

heartloop_topright:

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
li $t9, 20            # Multiplier for bottom position
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally

jal Draw_heart
j heartloop_topleft

########## Top Left Placement ##########

heartloop_topleft:

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
li $t9, 20            # Multiplier for bottom position
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally

jal Draw_heart
j heartloop_bottomright

########## Bottom Right Placement ##########

heartloop_bottomright:

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
li $t9, 90            # Multiplier for bottom position
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally

jal Draw_heart
j heartloop_bottomleft

########## Bottom Left Placement ##########

heartloop_bottomleft:

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
li $t9, 90           # Multiplier for bottom position
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally

jal Draw_heart

.include "thankyoufile.asm"


Draw_heart:

heart_row1:

	li $t2, heartBlack
	sw $t2, 0($t8)
	
	li $t2, heartBlack
	sw $t2, 4($t8)
	
	li $t2, heartBlack
	sw $t2, 12($t8)
	
	li $t2, heartBlack
	sw $t2, 16($t8)
	
heart_row2:

	addi $t8, $t8 512
	
	li $t2, heartBlack
	sw $t2, -4($t8)
	
	li $t2, heartRed
	sw $t2, 0($t8)
	
	li $t2, heartRed
	sw $t2, 4($t8)
	
	li $t2, heartBlack
	sw $t2, 8($t8)
	
	li $t2, heartRed
	sw $t2, 12($t8)
	
	li $t2, heartRed
	sw $t2, 16($t8)
	
	li $t2, heartBlack
	sw $t2, 20($t8)

heart_row3:

	addi $t8, $t8 512
	
	li $t2, heartBlack
	sw $t2, -8($t8)
	
	li $t2, heartRed
	sw $t2, -4($t8)
	
	li $t2, heartRed
	sw $t2, 0($t8)
	
	li $t2, heartWhite
	sw $t2, 4($t8)
	
	li $t2, heartRed
	sw $t2, 8($t8)
	
	li $t2, heartRed
	sw $t2, 12($t8)
	
	li $t2, heartRed
	sw $t2, 16($t8)
	
	li $t2, heartRed
	sw $t2, 20($t8)
	
	li $t2, heartBlack
	sw $t2, 24($t8)
	
heart_row4:

	addi $t8, $t8 512
	
	li $t2, heartBlack
	sw $t2, -8($t8)
	
	li $t2, heartRed
	sw $t2, -4($t8)
	
	li $t2, heartRed
	sw $t2, 0($t8)
	
	li $t2, heartRed
	sw $t2, 4($t8)
	
	li $t2, heartRed
	sw $t2, 8($t8)
	
	li $t2, heartRed
	sw $t2, 12($t8)
	
	li $t2, heartRed
	sw $t2, 16($t8)
	
	li $t2, heartRed
	sw $t2, 20($t8)
	
	li $t2, heartBlack
	sw $t2, 24($t8)
	
heart_row5:

	addi $t8, $t8 512
	
	li $t2, heartBlack
	sw $t2, -8($t8)
	
	li $t2, heartDark_Red
	sw $t2, -4($t8)
	
	li $t2, heartRed
	sw $t2, 0($t8)
	
	li $t2, heartRed
	sw $t2, 4($t8)
	
	li $t2, heartRed
	sw $t2, 8($t8)
	
	li $t2, heartRed
	sw $t2, 12($t8)
	
	li $t2, heartRed
	sw $t2, 16($t8)
	
	li $t2, heartDark_Red
	sw $t2, 20($t8)
	
	li $t2, heartBlack
	sw $t2, 24($t8)
	
heart_row6:

	addi $t8, $t8 512
		
	li $t2, heartBlack
	sw $t2, -4($t8)
	
	li $t2, heartDark_Red
	sw $t2, 0($t8)
	
	li $t2, heartRed
	sw $t2, 4($t8)
	
	li $t2, heartRed
	sw $t2, 8($t8)
	
	li $t2, heartRed
	sw $t2, 12($t8)
	
	li $t2, heartDark_Red
	sw $t2, 16($t8)
	
	li $t2, heartBlack
	sw $t2, 20($t8)
	
heart_row7:

	addi $t8, $t8 512
	
	li $t2, heartBlack
	sw $t2, 0($t8)
	
	li $t2, heartDark_Red
	sw $t2, 4($t8)
	
	li $t2, heartRed
	sw $t2, 8($t8)
	
	li $t2, heartDark_Red
	sw $t2, 12($t8)
	
	li $t2, heartBlack
	sw $t2, 16($t8)
	
heart_row8:

	addi $t8, $t8 512
	
	
	li $t2, heartBlack
	sw $t2, 4($t8)
	
	li $t2, heartDark_Red
	sw $t2, 8($t8)
	
	li $t2, heartBlack
	sw $t2, 12($t8)
	
heart_row9:

	addi $t8, $t8 512
	
	li $t2, heartBlack
	sw $t2, 8($t8)
	
	jr $ra


