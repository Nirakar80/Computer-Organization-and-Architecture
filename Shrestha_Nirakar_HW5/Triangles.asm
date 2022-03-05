.data:
	b1: .asciiz "Enter base for Triangle 1: "
	h1: .asciiz "Enter height for Triangle 1: "
	b2: .asciiz "Enter base for Triangle 2: "
 	h2: .asciiz "Enter height for Triangle 2: "
 	msg1: .asciiz "Area1 is greater than Area2.\n"
 	msg2: .asciiz "Area2 is greater than Area1.\n"
 	msg3: .asciiz "Both Area are equal.\n"
	debug1: .asciiz "Area1 = "
	debug2: .asciiz "Area2 = "
	newline: .asciiz "\n"

.text:

main:
	li        $v0, 4
     	la        $a0, b1
   	syscall
   	li        $v0, 5
    	syscall
    	move	  $s1, $v0
    	
   	li        $v0, 4
     	la        $a0, h1
   	syscall
   	li        $v0, 5
     	syscall
    	move 	  $s2, $v0
    	li        $v0, 4
     	la        $a0, b2
   	syscall
   	li        $v0, 5
    	syscall
    	move 	  $s3, $v0
    	li        $v0, 4
     	la        $a0, h2
   	syscall
   	li        $v0, 5
    	syscall
    	move 	  $s4, $v0
    	jal 	Compare
	li	$v0, 10
	syscall
	
Compare:
	subi	$sp, $sp, 4
	sw 	$ra, 0($sp)
	jal 	Area
	move	$s6, $v0
	add 	$s0, $v0, $zero
	la 	$a0, debug1
	li 	$v0, 4
	syscall
	add 	$a0, $s0, $zero
	li	$v0, 1
	syscall
	la 	$a0, newline
	li 	$v0, 4
	syscall
	la 	$a0, debug2
	li 	$v0, 4
	syscall
	add	$s1, $s3, $zero
	add	$s2, $s4, $zero
	jal	Area
	move	$s7, $v0
	add	$a0, $v0, $zero
	li 	$v0, 1
	syscall
	la 	$a0, newline
	li 	$v0, 4
	syscall
	sub	$s0, $s0, $v0
	beq 	$s6, $s7, EQUAL
	blt	$s7, $s6, LESS	
	j 	MORE

LESS:
	li 	$v0, 4
	la 	$a0, msg1
	syscall
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra
	
MORE:
	li	$v0, 4
	la 	$a0, msg2
	syscall
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra

EQUAL:
	li	$v0, 4
	la 	$a0, msg3
	syscall
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra

Area:
	subi	$sp, $sp, 8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	mul 	$s5, $s1, $s2
	srl 	$v0, $s5, 1
	lw 	$ra, 0($sp)
	lw 	$s0, 4($sp)
	addi 	$sp, $sp, 8
	jr 	$ra
