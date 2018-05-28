`timescale 1ns / 1ps

module Decoder(OP, Reg_Dst, Jump, Branch, Mem_Read, Mem_to_Reg, ALU_OP, Mem_Write, ALU_Src, Reg_Write);

	input [5:0] OP;
	output Reg_Dst, Jump, Branch, Mem_Read, Mem_to_Reg, Mem_Write, ALU_Src, Reg_Write;
	output [1:0] ALU_OP;
	
	/////  OP Code  /////
	//  R-type 000000  //
	//  load   100011  //
	//  store  101011  //
	//  beq    000100  //
	//  addi   001000  //
	//  j      000010  //
	/////////////////////
	
	assign Reg_Dst = (OP == 6'b000000) ? 1 : 0;
	assign Mem_Read = (OP == 6'b100011) ? 1 : 0;
	assign Mem_to_Reg = (OP == 6'b100011) ? 1 : 0;
	assign Mem_Write = (OP == 6'b101011) ? 1 : 0;
	
	////  ALUOP  ////
	//  R-type 10  //
	//  beq    01  //
	//  else   00  //
	/////////////////
	
	reg ALU_Src, Reg_Write, Jump, Branch;
	reg [1:0] ALU_OP; 

	always @(*)
	begin
	  //default
	  Jump = 0;
	  Branch = 0;
	  ALU_Src = 0;
	  Reg_Write = 0;
	  ALU_OP = 2'b00;

	  case (OP)
	    6'b000000: begin //R-type
		ALU_Src = 0;
		Reg_Write = 1;
	  	ALU_OP = 2'b10; 
	    end //R-type

	    6'b100011: begin //I-type lw
		ALU_Src = 1;
		Reg_Write = 1;
	  	ALU_OP = 2'b00; 
	    end 

	    6'b101011: begin //I-type sw
		ALU_Src = 1;
		Reg_Write = 0;
	  	ALU_OP = 2'b00; 
	    end

	    6'b000100: begin //beq
		ALU_Src = 0;
		Reg_Write = 0;
	  	ALU_OP = 2'b01;
		Branch = 1;
	    end

	    6'b001000: begin //addi
		ALU_Src = 1;
		Reg_Write = 1;
	  	ALU_OP = 2'b00; 
	    end

	    6'b000010: begin //j
           	Jump = 1; 
	    end	

	  endcase
	end
	
endmodule
