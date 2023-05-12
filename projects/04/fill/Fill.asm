// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// unconditional loop
// if keyboard pressed - blacken screen


@color

(LOOP)
  @KBD
  D=M
  // if keyboard pressed, blacken
  @BLACKEN
  D;JGT
  // else, clear screen
  @CLEAR
  0;JMP

(BLACKEN)
  @color
  M=-1
  @PAINT
  0;JMP

(CLEAR)
  @color
  M=0
  @PAINT
  0;JMP


(PAINT)
  @color
  D=M
  @SCREEN
  M=D

  // reset loop
  @LOOP
  0;JMP

// Don't think this is needed?
(END)
  @END
  0;JMP
