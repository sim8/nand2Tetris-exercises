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
  // last word index
  @8191
  D=A
  @screenWordIndex
  M=D
  @PAINT_WORDS
  0;JMP

(PAINT_WORDS)
  @screenWordIndex
  D=M
  @SCREEN
  D=D+A
  @indexToPaint
  M=D

  @color
  D=M
  @indexToPaint
  A=M
  M=D

  @screenWordIndex
  D=M-1
  M=D
  @PAINT_WORDS
  D;JGE
  // else, reset loop
  @LOOP
  0;JMP



// Don't think this is needed?
(END)
  @END
  0;JMP
