`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:56 10/27/2016 
// Design Name: 
// Module Name:    S3_Register 
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
module S3_Register( Out, S3_WS, S3_WE, rst,R1, S2_WS, S2_WE, clk
    );

	output reg [31:0] Out;
	output reg [4:0] S3_WS; 
	output reg S3_WE;
	input [31:0] R1;
	input [4:0] S2_WS;
	input S2_WE;
	input clk;
	input rst;
	
	always@(posedge clk)
		begin
		if (rst)
			begin
			Out <= 32'b0;
			S3_WS <= 5'd0;
			S3_WE <= 1'b0;
			
			end
		else
			begin
			Out <= R1;
			S3_WS <= S2_WS;
			S3_WE <= S2_WE;
			end
		end
		


endmodule
