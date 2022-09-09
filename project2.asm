#Sotiris Emmanouil Project 2 CS240 

.data
Prompt: .asciiz            "\n Please Input a value for N = "
floatpointmessage: .asciiz "\n You entered a Floating Point number. It has been truncated and we will be using: "
Result: .asciiz            "\n The sum of the integers from 1 to N is: "
Bye:    .asciiz "           \n *** Adios Amigo - Have a good day *** " 
.globl main
.text
 
main:
 
li $v0, 4 
la $a0, Prompt 
syscall 
li $v0, 6 
syscall 
li $t0, 0 
mfc1 $t1, $f0 
srl $t2, $t1, 23 
add $s3, $t2, -127 
sll $t4, $t1, 9
srl $t5, $t4, 9 
add $t6, $t5, 8388608 
add $t7, $s3, 9 
sllv $s4, $t6, $t7  
rol $t4, $t6, $t7  
li $t5, 31 
sub $t2, $t5, $s3 
sllv $t5, $t4, $t2 
srlv $s5, $t5, $t2 
move $v0, $s5 
li $t0, 0 
blez $t1, End 
beqz $s4, Loop        
li $v0, 4        
la $a0, floatpointmessage 
syscall 
li $v0, 1 
move $a0, $s5 
syscall
move $v0, $s5  

Loop:
add $t0, $t0, $v0 
addi $v0, $v0, -1    
bnez $v0, Loop        
li $v0, 4            
la $a0, Result        
syscall               
li $v0, 1                  
move $a0, $t0             
syscall                    
b main                     
 
End: 
li $v0, 4
la $a0, Bye 
li $v0, 10   
syscall
