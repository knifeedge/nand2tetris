// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

	@2 // Always intialize the result in R2 to zero
	M=0

	@0 // Check R0 for zero
	D=M
	@ZERO
	D;JEQ

  @1 //Check R1 for zero
	D=M
	@ZERO
	D;JEQ

  (LOOP)
		@1
		D=M
		@END
		D;JEQ
		@0 // Get R0
		D=M
		@2
		M=D+M // Add R0 to R2
		@1
		M=M-1 // Subtract 1 from R1
		@LOOP
		0;JMP

	(ZERO)
		@2
		M=0
		@END
		0;JMP

	(END)
		@END
  	0;JMP
