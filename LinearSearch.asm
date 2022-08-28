# An implementation of the Linear Search Algorithm in the MIPS Assembly Language by Sotiris Emmanouil. This algorithm has a runtime of O(n).

.data
array:     .word  75, 70, 40, 53, 29, 60, 89, 90, 100, 4, 23, 400, 5	                                   #array entries
size:      .word  13							                                                 #size of the array 
message0: .asciiz "Please enter a number to check to see if its on the list: "
message1: .asciiz "The number "
message2: .asciiz " is on the list \n"
message3: .asciiz " is not on the list \n" 
message4: .asciiz "Would you like to try a different number?\nEnter 1 for yes or anything else for no: "
.text

Main:
li $v0, 4
la $a0, message0		                      #print message0
syscall
li $v0, 5			                            #receive input from user
syscall				
move $t6, $v0			                        #integer that will be used to search is now located in register $t6
la $t0, size			                        #load the address of size into register $t0
lw $t3, 0($t0)		                        #load the address of size into register $t0
la $t1, array                             #load the address of the array into register $t1
li $t2, 0 			                          #load 0 into register $t2

Loop:
lw $t5, ($t1)
beq $t6, $t5, NumberExists	              # if the number exists in the array, branch to NumberExists
beq $t2, $t3, NumberDoesNotExist     	    #when the array capacity has been reached, branch to end
addi $t2, $t2, 1                          #advance loop counter
addi $t1, $t1, 4 	   		                  #advance to next array entry 
b Loop					                          #loop

NumberExists:
li $v0, 4			# load 4 into $v0 to print message
la $a0, message1		#print 
syscall
la $a0, ($t6)			#print number that exists in the array 
li $v0, 1
syscall				
li $v0, 4
la $a0, message2		#print message2
syscall
la $a0, message4		#print message4
syscall
li $v0, 5			#receive input from user
syscall	
move $t7, $v0
bne $t7, 1, Terminate		#if user does not enter 1, branch to terminate
beq $t7, 1, Main		# if user enters 1, branch back to Main

NumberDoesNotExist:
li $v0, 4			# load 4 into $v0 to print message
la $a0, message1		#print message1
syscall
la $a0, ($t6)			
li $v0, 1
syscall
li $v0, 4
la $a0, message3		#print message3 
syscall
li $v0, 4
la $a0, message4		#print message4
syscall
li $v0, 5			#receive input from user
syscall	
move $t7, $v0 
beq $t7, 1, Main		# if user enters 1, branch back to Main

Terminate:			#terminate the program 
li $v0, 10
syscall
