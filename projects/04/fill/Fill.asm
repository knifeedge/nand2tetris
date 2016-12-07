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
 
  // Load numcols to 8191 (32*256)-1 = 8191
	@8191
	D=A
	@numcols
	M=D

	(LOOP)
    // set i=0
    @i
	  M=0
	
    // Save screen address
	  @SCREEN
	  D=A
	  @address
	  M=D

	  @KBD
	  D=M
    @WHITE
	  D;JEQ
	  @BLACK
	  0;JMP
	
  (WHITE)
    @color
	  M=0
	  @DRAW
	  0;JMP
		
	(BLACK)
    @color
    M=-1
    @DRAW
    0;JMP

  (DRAW)
	  @i
		D=M
		@numcols
		D=D-M
		@LOOP
		D;JGT
	  @color
	  D=M
		@address
		A=M
		M=D
    @i
		M=M+1
		@1
		D=A
		@address
		M=D+M
    @DRAW
	  0;JMP
