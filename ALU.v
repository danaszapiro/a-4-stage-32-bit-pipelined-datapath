`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:09 10/27/2016 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(R1, ALUOp, R2, R3
    );
	 
	 input [2:0] ALUOp;
	 input [31:0] R3;
	 input [31:0] R2;
	 output reg [31:0] R1;
	 
	 //wire [31:0] MOV, NOT, ADD, SUB, OR, AND, SLT;

	always@(*) 
	begin
		case(ALUOp)

				3'b000: R1<=R2;
				3'b001: R1<=~R2;
				3'b010: R1<=R2+R3;
				3'b011: R1<=R2-R3;
				3'b100: R1<=R2|R3;
				3'b101: R1<=R2&R3;
				3'b110: R1<=(R2<R3) ? 1:0; 
		endcase
	end
				
			
		
endmodule
