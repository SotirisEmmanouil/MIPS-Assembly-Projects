 # MIPS-Assembly-Projects
## A collection of some of the projects I have created using the MIPS Assembly language.


###  The DigitCounter

This MIPS program receives an integer input from the user, loops the inputed integer through integer division until the quotient is 0, increments a register by 1 everytime integer divison occurs where the quotient has not reached 0, and displays the result along with a message. This program is built to catch certain situations, such as when the input is 0. In this situation, the program will simply branch to a segment of the code stating that the inputed integer has 1 digit. The program also gives the user the option of trying multiple numbers out. For example, after trying the number 354 and receiving the result of 3, the program will prompt the user to input 1 or 0, 1 for yes and 0 for no, on whether to try another number. If 1 is entered, the program will branch back to the prompt asking the user to enter an integer to be counted, and if 0 is entered, the program will terminate.

### SwissFlag.asm

This program uses the MIPS assembly language as well as the prebuilt colors to display the Swiss flag. This program should be run on the MARS 4_5 simulator with the configurations listed in the commentary found in the beginning of the code for the best results. This project helped me understand how computer graphics work at such a low level.  

### LinearSearch.asm

A simple implementation of the Linear search algorithm using an pre defined array. The program will prompt the user to enter a value to be checked to see if it is found in the array. The program also has the ability to ask the user if they want to continue, and try a different value to be checked. 

### Project2

This program receives an input and if the input is a floating point number, the program truncates it so that it becomes an integer by manually shifting the bits around. Once the number has been truncated, the program will add all the integers between 1 and itself, printing the solution. This project was completed while taking Professor Frary's CS240 Computer Organization and Assembly Language course at CUNY Queens College during the Spring 2022 semester
