#set color codes

.eqv	sodaBlack		0x00302c2d
.eqv	sodaWhite		0x00fff5c2
.eqv	sodaLight_Red		0x00e44831
.eqv	sodaRed			0x00a93b3a
.eqv	sodaDark_Red		0x007b444a
.eqv	sodaDarker_Red		0x005e363f
.eqv	sodaGrey		0x00a1928d
.eqv	sodaLight_Grey		0x00cec7b4
.eqv	sodaDark_Grey		0x007c7273
.eqv	sodaDarker_Grey		0x00595353



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
char_pos_soda: .word	79888

.globl sodaloop
###############################################

.text

sodaloop:
	# Set up addresses
addi $t0, $zero, BASE

# Load measurements
li $t3, PIXEL_SIZE
li $t4, WIDTH
li $t5, HEIGHT

# Calculate position for bottom center of the screen
mul $t6, $t4, $t3    # Total width in pixels
div $t6, $t6, -4      # Half of the total width

mul $t7, $t5, $t3    # Total height in pixels
li $t9, 80            # Multiplier for bottom position
mul $t7, $t7, $t9    # Bottom position

sub $t7, $t7, $t3    # Adjust for the pixel size
sub $t6, $t6, $t3    # Adjust for the pixel size

# Calculate the address for the bottom center pixel
add $t8, $t0, $t7    # Base address + bottom position
add $t8, $t8, $t6    # Move to the center horizontally


Draw_soda:


soda_row1:

	li $t2, sodaGrey
	sw $t2, 0($t8)
	
	li $t2, sodaLight_Grey
	sw $t2, 4($t8)
	
	li $t2, sodaGrey
	sw $t2, 8($t8)
	
	li $t2, sodaGrey
	sw $t2, 12($t8)
	
	li $t2, sodaGrey
	sw $t2, 16($t8)
	
soda_row2:
	addi $t8, $t8 512
	
	li $t2, sodaDark_Red
	sw $t2, -4($t8)
	
	li $t2, sodaRed
	sw $t2, 0($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 4($t8)
	
	li $t2, sodaRed
	sw $t2, 8($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 12($t8)
	
	li $t2, sodaRed
	sw $t2, 16($t8)
	
	li $t2, sodaDarker_Red
	sw $t2, 20($t8)
	
soda_row3:
	addi $t8, $t8 512
	
	li $t2, sodaRed
	sw $t2, -4($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 0($t8)
	
	li $t2, sodaRed
	sw $t2, 4($t8)
	
	li $t2, sodaRed
	sw $t2, 8($t8)
	
	li $t2, sodaRed
	sw $t2, 12($t8)
	
	li $t2, sodaDark_Red
	sw $t2, 16($t8)
	
	li $t2, sodaDark_Red
	sw $t2, 20($t8)
	
soda_row4:
	addi $t8, $t8 512
	
	li $t2, sodaRed
	sw $t2, -4($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 0($t8)
	
	li $t2, sodaRed
	sw $t2, 4($t8)
	
	li $t2, sodaRed
	sw $t2, 8($t8)
	
	li $t2, sodaRed
	sw $t2, 12($t8)
	
	li $t2, sodaDark_Red
	sw $t2, 16($t8)
	
	li $t2, sodaDark_Red
	sw $t2, 20($t8)
	
soda_row5:
	addi $t8, $t8 512
	
	li $t2, sodaRed
	sw $t2, -4($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 0($t8)
	
	li $t2, sodaRed
	sw $t2, 4($t8)
	
	li $t2, sodaRed
	sw $t2, 8($t8)
	
	li $t2, sodaRed
	sw $t2, 12($t8)
	
	li $t2, sodaDark_Red
	sw $t2, 16($t8)
	
	li $t2, sodaDarker_Red
	sw $t2, 20($t8)
	
soda_row6:
	addi $t8, $t8 512
	
	li $t2, sodaRed
	sw $t2, -4($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 0($t8)
	
	li $t2, sodaRed
	sw $t2, 4($t8)
	
	li $t2, sodaRed
	sw $t2, 8($t8)
	
	li $t2, sodaRed
	sw $t2, 12($t8)
	
	li $t2, sodaDark_Red
	sw $t2, 16($t8)
	
	li $t2, sodaWhite
	sw $t2, 20($t8)
	
soda_row7:
	addi $t8, $t8 512
	
	li $t2, sodaWhite
	sw $t2, -4($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 0($t8)
	
	li $t2, sodaLight_Red
	sw $t2, 4($t8)
	
	li $t2, sodaRed
	sw $t2, 8($t8)
	
	li $t2, sodaWhite
	sw $t2, 12($t8)
	
	li $t2, sodaWhite
	sw $t2, 16($t8)
	
	li $t2, sodaBlack
	sw $t2, 20($t8)
	
soda_row8:
	addi $t8, $t8 512
	
	li $t2, sodaWhite
	sw $t2, -4($t8)
	
	li $t2, sodaWhite
	sw $t2, 0($t8)
	
	li $t2, sodaWhite
	sw $t2, 4($t8)
	
	li $t2, sodaWhite
	sw $t2, 8($t8)
	
	li $t2, sodaBlack
	sw $t2, 12($t8)
	
	li $t2, sodaBlack
	sw $t2, 16($t8)
	
	li $t2, sodaBlack
	sw $t2, 20($t8)
	
soda_row9:
	addi $t8, $t8 512
	
	li $t2, sodaWhite
	sw $t2, -4($t8)
	
	li $t2, sodaWhite
	sw $t2, 0($t8)
	
	li $t2, sodaBlack
	sw $t2, 4($t8)
	
	li $t2, sodaBlack
	sw $t2, 8($t8)
	
	li $t2, sodaBlack
	sw $t2, 12($t8)
	
	li $t2, sodaBlack
	sw $t2, 16($t8)
	
	li $t2, sodaBlack
	sw $t2, 20($t8)
	
soda_row10:
	addi $t8, $t8 512
	
	li $t2, sodaBlack
	sw $t2, -4($t8)
	
	li $t2, sodaDark_Grey
	sw $t2, 0($t8)
	
	li $t2, sodaBlack
	sw $t2, 4($t8)
	
	li $t2, sodaBlack
	sw $t2, 8($t8)
	
	li $t2, sodaBlack
	sw $t2, 12($t8)
	
	li $t2, sodaBlack
	sw $t2, 16($t8)
	
	li $t2, sodaBlack
	sw $t2, 20($t8)
	
soda_row11:
	addi $t8, $t8 512
	
	li $t2, sodaDarker_Grey
	sw $t2, -4($t8)
	
	li $t2, sodaDark_Grey
	sw $t2, 0($t8)
	
	li $t2, sodaBlack
	sw $t2, 4($t8)
	
	li $t2, sodaBlack
	sw $t2, 8($t8)
	
	li $t2, sodaBlack
	sw $t2, 12($t8)
	
	li $t2, sodaBlack
	sw $t2, 16($t8)
	
	li $t2, sodaDarker_Grey
	sw $t2, 20($t8)
	
soda_row12:
	addi $t8, $t8 512
	
	li $t2, sodaDarker_Grey
	sw $t2, 0($t8)
	
	li $t2, sodaDark_Grey
	sw $t2, 4($t8)
	
	li $t2, sodaDarker_Grey
	sw $t2, 8($t8)
	
	li $t2, sodaDarker_Grey
	sw $t2, 12($t8)
	
	li $t2, sodaDarker_Grey
	sw $t2, 16($t8)
