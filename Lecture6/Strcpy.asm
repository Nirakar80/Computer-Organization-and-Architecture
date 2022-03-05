.data 
x:	.asciiz "Nirakar SHRESTHA\n"
y:	.space 15

.text

main:
	li	$v0, 4
	la	$a0, x
	syscall
	la	$a1, y
	jal 	strcpy
	li	$v0, 4
	la	$a0, y
	syscall
	li	$v0, 10
	syscall
	
strcpy:
	sub	$sp, $sp, 4
	sw	$s0, 0($sp)
	addi	$s0, $zero, 0

loop:
	add	$t0, $a0, $s0
	lb	$t1, 0($t0)
	add	$t2, $a1, $s0
	sb	$t1, 0($t2)
	beq	$t1, $zero, exit
	addi	$s0, $s0, 1
	j	loop
	
exit:
	lw	$s0, 0($sp)
	add	$sp, $sp, 4
	jr	$ra
	
	

