`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:09:25 10/27/2016
// Design Name:   top
// Module Name:   /ad/eng/users/d/a/danasz/lab6/top_tb.v
// Project Name:  lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.Out(Out)
	);
always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		InstrIn = 0;
		#100;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#20;
		InstrIn = 32'b011010_00001_00001_0000000000001010;
		#10;
       InstrIn = 32'b011100_00010_00010_0000000000000010; 
		 #10;
		 InstrIn= 32'b010010_00011_00001_00010_00000000000; 
		 #10;
		 InstrIn= 32'b010011_00100_00001_00010_00000000000; 

 
		// Add stimulus here

	end
      
endmodule

