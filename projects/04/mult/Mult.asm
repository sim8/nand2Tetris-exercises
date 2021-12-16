// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// loop R0

// r2 = r2 + R1
// end!

// Initialize count to 0
@R2
M=0

// Initialize index to R0
@R0
D=M
@i
M=D

(LOOP)
  // if i === 0, go to end
  @i
  D=M
  @END
  D;JEQ

  // add R1 to count (R2)
  @R1
  D=M
  @R2
  M=M+D

  // decrement index, jump to start of loop
  @i
  M=M-1
  @LOOP
  0;JMP
  
  
(END)
  @END
  0;JMP