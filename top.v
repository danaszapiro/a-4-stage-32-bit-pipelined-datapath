`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:18:41 10/27/2016 
// Design Name: 
// Module Name:    top 
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
module top(	input clk,
	input rst,
	input [31:0] InstrIn,
	output [31:0] Out
   );

	wire [4:0] S1_RS1;
	wire [4:0] S1_RS2;
	wire [15:0] S1_IMM;
	wire S1_DS;
	wire [2:0] S1_ALUOp;
	wire [4:0] S1_WS;
	wire S1_WE;
	wire [31:0] FR_RD1;
	wire [31:0] FR_RD2;
	wire [31:0] S2_RD1;
	wire [31:0] S2_RD2;
	wire [31:0] S2_IMM;
	wire S2_DS;
	wire [2:0] S2_ALUOp;
	wire [4:0] S2_WS;
	wire S2_WE;
	wire S3_ALUOut;
	wire 	[4:0] S3_WS;
	wire  S3_WE;
	wire	[31:0] R3;
	wire [31:0] R1;
	//wire [31:0] S2_extIMM;
	assign S2_IMM[31:16] = 16'b0; 
	S1_Register S1_Reg(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.S1_ReadSelect1(S1_RS1),
		.S1_ReadSelect2(S1_RS2),
		.S1_WriteSelect(S1_WS),
		.S1_IMM (S1_IMM),
		.S1_ALUOp (S1_ALUOp),
		.S1_DS (S1_DS),
		.S1_WriteEnable(S1_WE)
   );


		nbit_register_file Register_File (
		.write_data(Out),								
		.read_data_1(FR_RD1),
		.read_data_2(FR_RD2),
		.read_sel_1(S1_RS1),
		.read_sel_2(S1_RS2),
		.write_address(S3_WS),
		.RegWrite(S3_WE),
		.clk(clk)
	);

S2_Register S2_Reg(
	.clk(clk),
	.rst(rst),
	.S1_ReadSelect1(FR_RD1),
	.S1_ReadSelect2(FR_RD2),
	.S1_WriteSelect(S1_WS),
	.S1_IMM (S1_IMM),
	.S1_ALUOp (S1_ALUOp),
	.S1_DS (S1_DS),
	.S1_WriteEnable(S1_WE),
	.S2_ReadSelect1(S2_RD1),
	.S2_ReadSelect2(S2_RD2),
	.S2_WriteSelect(S2_WS),
	.S2_IMM (S2_IMM[15:0]),
	.S2_ALUOp (S2_ALUOp),
	.S2_DS (S2_DS),
	.S2_WriteEnable(S2_WE)
   );
	
	mux MUX( 
	.sel(S2_DS), 
	.in_0(S2_RD2), 
	.in_1(S2_IMM), 
	.out(R3)
	);
	
	ALU alu(
	.R1(R1), 
	.ALUOp(S2_ALUOp), 
	.R2(S2_RD1), 
	.R3(R3)
    );
	
	S3_Register S3_reg( 
	.Out(Out), 
	.S3_WS(S3_WS), 
	.S3_WE(S3_WE),
	.rst(rst),
	.R1(R1), 
	.S2_WS(S2_WS), 
	.S2_WE(S2_WE), 
	.clk(clk)
    );
endmodule
