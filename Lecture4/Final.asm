.data:
	dialog1: .asciiz "Enter diameter for the Small Pizza: "
	dialog2:.asciiz "Enter price for the Small Pizza: "
	dialog3:.asciiz "Enter diameter for the Big Pizza: "
	dialog4:.asciiz "Enter price for the Big Pizza: "
	D1: .word
	P1: .word
	D2: .word
	P2: .word
	msg1: .asciiz "Small Pizza is cheap. \n"
	msg2: .asciiz "Big Pizza is cheap. \n"
	msg3: .asciiz "Both have same value. \n"
	debug1: .asciiz "Per Unit Price of Small Pizza = "
	debug2: .asciiz "Per Unit Price of Big Pizza =  "
	newline: .asciiz "\n"
	
.text:
main:
	la	$a0, dialog1	      
	li 	$v0, 4
	Syscall 
	li	$v0, 5	
	la	$s0, D1	
	syscall
	move 	$s0, $v0
	la	$a0, dialog2	      
	li 	$v0, 4
	Syscall 
	li	$v0, 5	
	la	$s1, P1	
	syscall
	move 	$s1, $v0
	la	$a0, dialog3	      
	li 	$v0, 4
	Syscall 
	li	$v0, 5	
	la	$s2, D2
	syscall
	move 	$s2, $v0
	la	$a0, dialog4	      
	li 	$v0, 4
	Syscall 
	li	$v0, 5	
	la	$s3, P2	
	syscall
	move 	$s3, $v0
 	move	$a0, $s0
 	move	$a1, $s1
 	move	$a2, $s2
 	move	$a3, $s3
  	jal Compare
 	li 	$v0, 10
 	syscall
 	
 Compare:
 	subi 	$sp, $sp, 4
	sw 	$ra, 0($sp)
	jal 	PRICE
	add 	$s0, $v0, $zero
	la 	$a0, debug1
	li 	$v0, 4
	syscall
	add	$a0, $s0, $zero
	li 	$v0, 1
	syscall
	la 	$a0, newline
	li 	$v0, 4
	syscall
	add 	$a0, $a2, $zero
	add 	$a1, $a3, $zero
	jal 	PRICE
	add 	$s1, $v0, $zero
	la 	$a0, debug2
	li 	$v0, 4
	syscall
	add 	$a0, $s1, $zero
	li 	$v0, 1
	syscall
	la 	$a0, newline
 	li 	$v0, 4
 	syscall
 	beq 	$s0, $s1, EQUAL
 	sub 	$s0, $s0, $s1
 	bltz 	$s0, MORE
 	j 	LESS
 	li 	$v0, 10
 	syscall
 	
 LESS:
 	li 	$v0, 4
	la 	$a0, msg2
	syscall
	lw 	$ra, 0($sp)
	addi 	$sp, $sp, 4
	jr 	$ra

MORE:
	li 	$v0, 4
	la 	$a0, msg1
	syscall
	lw 	$ra, 0($sp)
	addi 	$sp, $sp, 4
	jr 	$ra

EQUAL:
	li	$v0, 4
	la 	$a0, msg3
	syscall
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra
	
PRICE:
	subi 	$sp, $sp, 8
	sw 	$ra, 0($sp)
	sw 	$s0, 4($sp)
	addi 	$t0, $zero, 3
	srl	$t1, $a0, 1
	mul	$t1, $t1, $t1
	mul	$t1, $t0, $t1
	div	$v0, $a1, $t1
	lw 	$ra, 0($sp)
	lw 	$s0, 4($sp)
	addi 	$sp, $sp, 8
	jr 	$ra