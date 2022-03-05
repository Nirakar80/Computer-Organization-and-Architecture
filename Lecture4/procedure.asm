.text
.globl main

main: 
	addi	 $a0, $zero, 7	# $a0 = 7
	addi	 $a1, $zero, 3	# $a1 = 3
	addi	 $a2, $zero, 6	# $a2 = 6
	addi	 $a3, $zero, 4	# $a3 = 4
	jal 	 procedure	# call procedure()
	move	 $a0, $v0	# load 1st arg.reg. with returned value
	addi	 $v0, $zero, 1	# load 1 into $v0
	syscall			# this will print $a0
	addi	$v0, $zero, 10	# load into $v0
	syscall

procedure:
	add	$t0, $a0, $a1	# $t0 = $a0+ $a1
	add	$t1 $a2 $a3	# $t1= $a2+ $a3
	sub	$s0, $t0, $t1	# $s0 = $t0 - $t1
	add	$v0, $s0, $zero	# $v0 = $s0 
	jr	$ra		#return