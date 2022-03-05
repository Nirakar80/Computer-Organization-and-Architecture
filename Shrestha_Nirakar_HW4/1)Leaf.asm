.data

dialog:		.asciiz "The product is: "    

.text
.globl main

main:
	la	$a0, dialog
	li	$v0, 4
	syscall
	li	$v0, 0
	addi	$a0, $zero, 12
	addi	$a1, $zero, 10
	jal	leaf
	movz	$a0, $v0, $zero
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
	
leaf:	
	mul	$s0, $a0, $a1
	add	$v0, $s0, $zero
	jr	$ra
	
	
