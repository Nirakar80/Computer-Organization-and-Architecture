 .data
prompt:	 .ascii   	"\nWould you like to...\n"
         .ascii   	"[0] Convert from Celsius to Fahrenheit \n"
         .ascii		"[1] Convert from Fahrenheit to Celsius \n"
         .ascii   	"[2] Exit \n"
         .asciiz		"Please enter your selection: "
conv:	 .float		1.8
bias:	 .float		32.0
strProC: .asciiz	"Please enter the temperature in Celsius: "
strAnsC: .asciiz	"Your temperature in Fahrenheit is "
strAnsF: .asciiz	"Your temperature in Celsius is " 
strProF: .asciiz	"Pleace enter the temperature in Fahrenheit: "
strExit: .asciiz	"Have a nice day!"

strErr:	 .asciiz	"I'm sorry but you've entered an invalid option"

.text
.globl main

main:	
	add  	$s7, $ra, $0
	jal	Staart

Staart:	
	la 	$a0, prompt		
	addi 	$v0, $0, 4		
	syscall
	addi 	$v0, $0, 5 		
	syscall
	add 	$t0, $0, $v0    
	addi 	$t7, $0 , 0     
	beq	$t0, $t7, cel                
	addi 	$t7, $0 , 1     
	beq 	$t0, $t7, fer    
	addi	$t7, $0 , 2     
	beq    	$t0, $t7, exit               
	jal 	error           
			                                   
exit:	
	la	$a0, strExit    
	addi	$v0, $0, 4       
	syscall                  
    	jr	$s7            
    	                            
cel:	
	la	$a0, strProC
	addi	$v0, $0, 4
	syscall
	addi	$v0, $0, 6
	syscall 
	lwc1	$f1, conv($0)
	mul.s	$f0, $f0, $f1 
	lwc1	$f1, bias	
	add.s	$f12, $f0, $f1  
	la	$a0, strAnsC
	addi	$v0, $0, 4
	syscall
	addi	$v0, $0, 2	
	syscall
	addi	$a0, $0, 10	
	addi	$v0, $0, 11
	syscall
    	j 	Staart		
	
fer:	
	la	$a0, strProF	
	addi	$v0, $0, 4
	syscall
	addi	$v0, $0, 6	
	syscall
	lwc1	$f1, bias	
	sub.s	$f0, $f0, $f1   
	lwc1	$f1, conv	
	div.s	$f12 $f0, $f1	
	la		$a0, strAnsF
	addi	$v0, $0, 4
	syscall
	addi	$v0, $0, 2	
	syscall
	addi	$a0, $0, 10		
	addi	$v0, $0, 11
	syscall
	j Staart				
	 
error:	 
	la 	$a0, strErr		
	addi	$v0, $0, 4
	syscall
	j Staart	
