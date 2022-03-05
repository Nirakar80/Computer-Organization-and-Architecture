.data 
	vector: .word 1,3,5,7,9,0,2,4,6,8
	size:	.word 10
	
.text

main:
	li	$v0, 4
	la	$a0, vextor
	lw	$a1, aize
	jal	Print
	li	$v0, 10
	syscall

Print:
	addi	$t0, $zero, 0
	addi	$t1, $zero, 0
FOR:
	beq	$t0, size, EXIT
	lw	$a0, 0($t1)
	li	$v0, 1
	syscall
	addi	$t0, $t0, 1
	j FOR
EXIT:
	jr	$ra
SWAP:
	sll	$t0, $a1, 2
	add	$t1, $a0, $t0
	lw	$s0, 0($t1)
	lw	$s1, 4($t1)
	sw	$s0, 4($t1)
	sw	$s1, 0($t0)
	jr	$ra
	
		