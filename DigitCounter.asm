#MIPS program that returns the amount of digits in an integer created by Sotiris Emmanouil 

.data 
Message1: .asciiz "Please enter an integer: "
Message2: .asciiz "This integer has "
Message3: .asciiz " digit(s)"
Message4: .asciiz "Do you wish to try another integer? Enter 1 for yes, 0 for no: "
Message5: .asciiz "\n"
Message6: .asciiz "This integer has 1 digit"
.text

Main:
li, $v0, 4		# print message 
la $a0, Message1
syscall
li $v0, 5		# receive input from user
syscall
move $t0, $v0
beqz $t0, OneDigit		#if the value entered is 0, do not divide and state it is 1 digit
b Division		#else, branch to division to begin counting

OneDigit:
li, $v0, 4		#prints message
la $a0, Message6
syscall
b Output2

Division: 				#loop to divide each number by 10 and 
beqz $t0, Output1			#record the amount of times division occurs until the quotient 
div $t0, $t0, 10			#reaches 0
jal Addition
b Division 

Addition:
addi $s4, $s4, 1       #keep track of how many times integer division is succesful
jr $ra

Output1:
li, $v0, 4			# prints message2
la $a0, Message2
syscall
la, $a0, ($s4)			#loads the address of $t4 into $a0 so that it can be printed
li, $v0, 1
syscall 
li, $v0, 4
la $a0, Message3		# prints message3
syscall
li, $s4, 0			#resets register $s4 to 0 so it can begin a fresh count of integers if requested by user

Output2:
li, $s4, 0
li, $v0, 4
la, $a0, Message5		#creates a space 
syscall
li, $v0, 4
la, $a0, Message4	 #print message
syscall
li $v0, 5		# receive input from user if they wish to proceed
syscall
move $t3, $v0
beqz $t3, Terminate
beq $t3, 1, Main

Terminate:
li $v0, 10
syscall			#terminates the program
