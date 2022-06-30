# MIPS program that will display the Swiss flag using built in memory location colors. Program created by Sotiris Emmanouil
# For the program to work, use the follow configurations on the MARS BitMap display:
# Unit width in pixels: 8					     
# Unit height in pixels: 8
# Display width in pixels: 256
# Display height in pixels: 256
# Base Address for Display: 0x10008000 ($gp)

 .data
	BitMapAddress:	.word	0x10008000                              # choose the desired BitMap type
 
 .text
	lw $t0, BitMapAddress	                                        # $t0 stores the base address of the displ
	li $t1, 268		                                        # sentinel value to stop coloring
	li $t2, 276		                                        # sentinel value to stop coloring
	li $t3, 288		                                        # sentinel value  to stop coloring
	li $t4, 0xff0000	                                        # load the color red into $t4
	li $t5, 0xffffff                                                # load the color white into $t5
	li $t6, 300		                                        # sentinel value to stop coloring
	li $t7, 308		                                        # sentinel value  to stop coloring
	li $t8, 320		                                        # sentinel value  to stop coloring
	li $t9, 332   	                                                # sentinel value  to stop coloring
	
 Step1:
      beqz $t1, Step2                 # check to see if desired region has been fully colored with desired color. If so, proceed to the next step
      sw $t4,($t0)	             # pain the pixel red 
      addi $t0, $t0, 4	            # keep adding 4 bytes 
      subi $t1, $t1, 1             # subtract by 1 to reach the sentinel value's desired coloring range
      j Step1                     # loop 
      
 Step2:
     beq $t2, 268, Step3
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t2, $t2, 1
     j Step2
     
 Step3:
     beq, $t3, 276, Step4
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t3, $t3, 1
     j Step3
     
 Step4:
     beq, $t6, 288, Step5
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t6, $t6, 1
     j Step4
  
 Step5:
     beq $t7, 300, Step6
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t7, $t7, 1
     j Step5
     
 Step6:
     beq, $t8, 308, Step7
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t8, $t8, 1
     j Step6
     
 Step7:
     beq $t9, 320, Load1
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step7
     
 Load1:
     li, $t9, 340       			#register $t9 will be looaded with the approporiate value sentinel value to colored up to
     
     Step8:
     beq $t9, 332, Load2
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step8
     
 Load2:
     li, $t9, 352
     
 Step9:
     beq $t9, 340, Load3
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step9
     
 Load3:
     li, $t9, 364
    
 Step10:
     beq $t9, 352, Load4
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step10
   
 Load4:
     li, $t9, 360

 Step11:
     beq $t9, 352, Load5
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step11
     
 Load5:
     li, $t9, 372
     
 Step12:
     beq $t9, 360, Load6
     sw  $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step12    
     
 Load6:
     li $t9, 384
   
 Step13:
     beq $t9, 372, Load7
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step13
  
 Load7:
    li $t9, 392
 
 Step14:
     beq $t9, 384, Load8
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step14
 
 Load8:
    li $t9, 404
 
 Step15:
     beq $t9, 392, Load9
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step15
  
  Load9:
     li $t9, 410
  
  Step16:
     beq $t9, 404, Load10
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step16 
    
 Load10:
     li, $t9, 430
 
 Step17:
     beq $t9, 410, Load11
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step17
 
  Load11:
     li, $t9, 436
   
  Step18:
     beq $t9, 430, Load12
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step18
  
  Load12:
     li $t9, 442
  
  Step19:
     beq $t9, 436, Load13
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step19
     
  Load13:
   li, $t9, 462
  
 Step20:
     beq $t9, 442, Load14
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step20
 
 Load14:
     li, $t9, 468
 
 Step21:
     beq $t9, 462, Load15
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     b Step21
 
 Load15:
   li, $t9, 474
   
 Step22:
     beq $t9, 468, Load16
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step22
 
 Load16:
    li $t9, 494
 
 Step23:
     beq $t9, 474, Load17
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step23
 
 Load17:
   li $t9, 500
 
 Step24:
     beq $t9, 494, Load18
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step24
 
 Load18:
   li $t9, 506
   
 Step25:
     beq $t9, 500, Load19
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step25 
 
 Load19:
     li $t9, 526
   
 Step26:
     beq $t9, 506, Load20
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step26
     
 Load20:
  li, $t9, 512

Step27:
     beq $t9, 506, Load21
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step27
 
 Load21:
 li $t9, 524
 
 Step28:
     beq $t9, 512, Load22
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step28
     
 Load22:
      li, $t9, 532
    
 Step29:
     beq $t9, 524, Load23
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step29
 
 Load23:
     li $t9, 544
  
 Step30:
    beq $t9, 532, Load24
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step30
     
 Load24:
    li, $t9, 556
 
 Step31:
     beq, $t9, 544, Load25
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step31
  
  Load25:
     li $t9, 564
  
 Step32:
     beq, $t9, 556, Load26
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step32
     
  Load26:
     li $t9, 576
 
 Step33:
     beq, $t9, 564, Load27
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step33 
   
 Load27:
    li $t9, 588
 
 Step34:
     beq, $t9, 576, Load28
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step34
    
 Load28:
     li $t9, 596
  
 Step35:
     beq, $t9, 588, Load29
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step35
 
 Load29:
     li $t9, 608
     
 Step36:
    beq, $t9, 596, Load30
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step36 
 
 Load30:
    li $t9, 620
   
   Step37:
     beq, $t9, 608, Load31
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step37 
  
  Load31:
     li $t9, 628
 
  Step38:
     beq, $t9, 620, Load32
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step38
   
  Load32: 
  li $t9, 640      
 
 Step39:
     beq, $t9, 628, Load33
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step39
  
  Load33:
     li $t9, 652
   
 Step40:
     beq, $t9, 640, Load34
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step40
 
 Load34:
     li $t9, 660
  
  Step41:
     beq, $t9, 652, Load35
     sw $t5, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step41
     
 Load35:
    li $t9, 672
    
 Step42:
     beq, $t9, 660, Load36
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step42
 
 Load36:
    li $t9, 4096
   
 Step43:
     beq, $t9, 672, End
     sw $t4, ($t0)
     addi $t0,$t0,4
     subi $t9, $t9, 1
     j Step43 
   
   End:
     li $v0, 10                     		# end program
     syscall
 
