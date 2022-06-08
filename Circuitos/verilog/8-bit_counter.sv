/* Name: Daniel Sánchez
*/

// Specify simulation timescape
// Format: unit step / resolution
`timescale 1ns/1ps

module up_counter_tb;

	// Testbench wires
	logic [7:0] count;
	logic clk, en, rst;

	// Instantiate the module to test
	up_counter DUT(.*);

	// Initialize signals
	initial begin
		{clk, en, rst} = 3'b001;
	end

	// Release reset signal and activate enable signal
	// (after 15-unit delay)
	initial begin
		#15;
		rst = 0;
		en = 1;
	end

	// Clock
	always begin
		#10 clk = ~clk;
	end

endmodule
