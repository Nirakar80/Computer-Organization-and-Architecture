.data:
 b1: .word 10
 h1: .word 12
 b2: .word 12
 h2: .word 12
 msg1: .asciiz "Area1 greater than Area2.\n"
 msg2: .asciiz "Area2 greater than Area1.\n"

 debug1: .asciiz "Area1="
 debug2: .asciiz "Area2="
 newline: .asciiz "\n"
.text:
main:
 lw $a0, b1
 lw $a1, h1
 lw $a2, b2
 lw $a3, h2
 jal Compare
 li $v0, 10
 syscall
Compare:
 subi $sp, $sp, 4
 sw $ra, 0($sp)
 jal Area
 add $s0, $v0, $zero
 la $a0, debug1
 li $v0, 4
 syscall
 add $a0, $s0, $zero
 li $v0, 1
 syscall
 la $a0, newline
 li $v0, 4
 syscall
 la $a0, debug2
 li $v0, 4
 syscall
 add $a0, $a2, $zero
 add $a1, $a3, $zero
 jal Area
 add $a0, $v0, $zero
 li $v0, 1
 syscall
 la $a0, newline
 li $v0, 4
 syscall
 sub $s0, $s0, $v0


 bltz $s0, LESS
 j MORE
LESS:
 li $v0, 4
 la $a0, msg2
 syscall
MORE:
 li $v0, 4
 la $a0, msg1
 syscall
 lw $ra, 0($sp)
 addi $sp, $sp, 4
 jr $ra
Area:
 subi $sp, $sp, 8
 sw $ra, 0($sp)
 sw $s0, 4($sp)
 mul $s1, $a0, $a1
 srl $v0, $s1, 1
 lw $ra, 0($sp)
 lw $s0, 4($sp)
 addi $sp, $sp, 8
 jr $ra