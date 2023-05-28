`timescale 1ns/1ns
module testbench;
	reg clk;
	reg [1:0] active;
	wire [7:0] data_out;
	wire [9:0] addr_out;
	integer i;
	
	ROM dut (clk, active, data_out, addr_out);
	
initial
	begin
		clk = 0;
		active = 2'b00;
		#1024;
		active = 2'b01;
		#1024;
		active = 2'b10;
		#1024;
		active = 2'b11;
	end
	
	always #2 clk = ~clk;
		initial
			#4096 $finish;

	initial
		$monitor("clk=%b active=%b data_out=%b addr_out=%b", clk, active, data_out, addr_out);
	initial
		$dumpvars;
endmodule