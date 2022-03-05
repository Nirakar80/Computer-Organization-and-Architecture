.data

dialog:		.asciiz "The product is: "

.text
.globl main

main:
	la	$a0, dialog
	li	$v0, 4
	syscall
	li	$v0, 0
	add	$s0, $zero, 4
	add	$s1, $zero, 5
	jal	multiplication
	movz	$a0, $v0, $zero
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall	

multiplication:
	addi	$sp, $sp, -8
	sw	$ra, 0($sp)

recursive:
	bne	$s1, $zero, addition
	lw	$ra, 0($sp)
	addi	$sp, $sp, 8
	jr	$ra	
	
addition:
	addi	$t0, $zero, 1
	add	$v0, $v0, $s0
	sub	$s1, $s1, $t0
	jal	recursive
