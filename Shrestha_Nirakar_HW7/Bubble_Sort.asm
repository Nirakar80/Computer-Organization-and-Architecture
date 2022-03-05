.data
	vector: .word 3,7,1,7,9,0,8,2,6,5
	length: .word 10
	dialog: .asciiz "Sorted array is: \n "
.text

main: 
	la 	$s7, vector
	la 	$a1, length
	li 	$s6, 9
	li 	$t4, 10
	li 	$v0,4
	la 	$a0, dialog
	syscall
	
ITERATIVE: 
	sll 	$t7, $s1, 2
	add 	$t7, $s7, $t7
	lw 	$t0, 0($t7)
	lw	$t1, 4($t7)
	slt 	$t2, $t0, $t1
	bne 	$t2, $zero, INTERCHANGE
	sw 	$t1, 0($t7)
	sw 	$t0, 4($t7)

INTERCHANGE: 
	addi 	$s1, $s1, 1
	sub 	$s5, $s6, $s0
	bne 	$s1, $s5, ITERATIVE
	addi 	$s0, $s0, 1
	li 	$s1, 0
	bne 	$s0, $s6, ITERATIVE

PRINT: 
	beq 	$t3, $t4, EXIT
	lw 	$t5, 0($s7)
	li 	$v0, 1
	move 	$a0, $t5
	syscall
	li 	$a0, 32
	li 	$v0, 11
	syscall
	addi 	$s7, $s7, 4
	addi 	$t3, $t3, 1
	j 	PRINT

EXIT: 
	li 	$v0, 10
	syscall
	
