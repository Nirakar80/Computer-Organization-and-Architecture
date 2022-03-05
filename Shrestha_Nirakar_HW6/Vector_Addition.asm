.data
	vector1: .word 0,0,1,1,1,2
	vector2: .word 0,1,0,1,2,3
	vector3: .word 0,0,0,0,0,0
	length:  .word 6
	dialog: .asciiz "The new vector is: "
.text

main: 
	la 	$s0, vector1
	la 	$s1, vector2
	la 	$s4, vector3
	lw 	$s5, length
	li 	$t0, 0
	jal 	ADDITION
	li 	$t1,0
	sub 	$s4, $s4, 24
	li 	$v0,4
	la 	$a0, dialog
	syscall
	jal 	PRINT

ADDITION: 
	beq 	$t0, $s5, EXIT
	lw 	$s2, 0($s0)
	lw 	$s3, 0($s1)
	add 	$t5, $s2, $s3
	sw 	$t5, 0($s4)
	add 	$t0, $t0,1
	add 	$s0, $s0, 4
	add 	$s1, $s1, 4
	add 	$s4, $s4, 4
	j 	ADDITION

PRINT: 
	beq 	$t1, $s5, FINAL
	lw 	$a0, 0($s4)
	li 	$v0, 1
	syscall
	li 	$a0, 32
	li 	$v0, 11
	syscall
	add 	$t1, $t1, 1
	add 	$s4, $s4, 4
	j 	PRINT

FINAL: 
	li 	$v0, 10
	syscall


EXIT: 
	jr 	$ra
