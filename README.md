# MIPS-Assembly-Projects
A collection of some of the projects I have created using the MIPS Assembly language.


1. The DigitCounter

This MIPS program receives an integer input from the user, loops the inputed integer through integer division until the quotient is 0, increments a register by 1 everytime integer divison occurs where the quotient has not reached 0, and displays the result along with a message. This program is built to catch certain situations, such as when the input is 0. In this situation, the program will simply branch to a segment of the code stating that the inputed integer has 1 digit. The program also gives the user the option of trying multiple numbers out. For example, after trying the number 354 and receiving the result of 3, the program will prompt the user to input 1 or 0, 1 for yes and 0 for no, on whether to try another number. If 1 is entered, the program will branch back to the prompt asking the user to enter an integer to be counted, and if 0 is entered, the program will terminate.

2. SwissFlag.asm

This program uses the MIPS assembly language as well as the prebuilt colors in the form of hexadecimal memory addresses to display the Swiss flag. This program should be run on the MARS 4_5 simulator with the configurations listed in the commentary found in the beginning of the program for the best results.
