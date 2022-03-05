.data
	A: .double 0:4          #Intilaize all values with 0s
	B: .double 0:4          #Intilaize all values with 0s
	C: .double 0:4          #Intilaize all values with 0s
	prompt1:.asciiz "Enter 4 values for matrix A:\n"
	prompt2:.asciiz "Enter 4 values for matrix B:\n"
	message:.asciiz "C=AxB:\n"
	space: .asciiz " "
	newline: .asciiz "\n"

.text

main:
	li 	$v0, 4
	la 	$a0, prompt1
	syscall

         la	$a0, A
	li	$a1, 4

	jal 	inputmatrix

	la 	$a0, A
	li	$a1, 2
     	li 	$a2, 2          
     
     	jal 	printmatrix

	li 	$v0, 4
	la 	$a0, prompt2
     	syscall

     	la 	$a0, B
     	li 	$a1, 4
     	
     	jal 	inputmatrix
     	
     	la 	$a0, B
     	li 	$a1, 2
	li 	$a2, 2

     	jal 	printmatrix    

	li 	$a0, 2            
     	la 	$a1, A            

     	la 	$a2, B            
     	la 	$a3, C           

	jal 	multiplymat         

	li 	$v0, 4
	la 	$a0, message

     	syscall

     	la 	$a0, C            
     	li 	$a1, 2            
     	li 	$a2, 2           

     	jal 	printmatrix          

     	li 	$v0, 10          
     	
     	syscall

inputmatrix:

     li $t0,0            

     mul $t1,$a1,8       

     move $t2,$a0        



loop:     bge $t0,$t1,return

     li $v0,7            

     syscall

     s.d $f0,($t2)       

     li $v0,4            

     la $a0,newline

     syscall

    

     addi $t0,$t0,8      

     addi $t2,$t2,8      

                 
     j loop             

    
return:   
	jr 	$ra     


multiplymat:            

     move $t0,$a0

     li $t1,0     

loop1:    bge $t1,$t0,multover 

     li $t2,0            

loop2:    bge $t2,$t0,nextloop1

     li $t3,0            

loop3:    bge $t3,$t0,nextloop2 

    

     li $t4,8

     mul $s0,$t1,$t0          

     add $s0,$s0,$t2

     mul $s0,$s0,$t4

     add $s0,$s0,$a3

    

     mul $s1,$t1,$t0          

     add $s1,$s1,$t3

     mul $s1,$s1,$t4

     add $s1,$s1,$a1

    

     mul $s2,$t3,$t0          

     add $s2,$s2,$t2

     mul $s2,$s2,$t4

     add $s2,$s2,$a2

    

     l.d $f0,($s0)       
     l.d $f2,($s1)       
     l.d $f4,($s2)      

    

     mul.d $f2,$f2,$f4        
     add.d $f0,$f0,$f2        

    

     s.d $f0,($s0)      

    

     addi $t3,$t3,1      

     j loop3

nextloop2:

     addi $t2,$t2,1      

     j loop2

nextloop1:

     addi $t1,$t1,1      
     j loop1

multover: jr $ra             

printmatrix :      

          li $t0,0         

          move $t5,$a0   

outerloop:     bge $t0,$a1,printingover 
          li $t1,0       

innerloop:     bge $t1,$a2,nextiter     

          mul $t3,$t0,$a2     
          add $t3,$t3,$t1

          li $t4,8

          mul $t3,$t3,$t4

          add $t3,$t3,$t5

         

          li $v0,3       

          l.d $f12,($t3) 

          syscall        

         

          li $v0,4       

          la,$a0,space

          syscall

         

          addi $t1,$t1,1 
          j innerloop

         

nextiter: li $v0,4

          la,$a0,newline 

          syscall

          addi,$t0,$t0,1 

          j outerloop

printingover: jr $ra         
    