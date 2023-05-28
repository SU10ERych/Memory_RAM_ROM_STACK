`timescale 1ns/1ns
module testbench;
	reg clk;
	wire [7:0] data_out;
	wire [9:0] addr_out;
	integer i;
	
	ROM dut (clk, data_out, addr_out);
	
initial
	begin
		clk = 0;
		#1024;
	end
	
	always #2 clk = ~clk;
		initial
			#1024 $finish;

	initial
		$monitor("clk=%b data_out=%b addr_out=%b", clk, data_out, addr_out);
	initial
		$dumpvars;
endmodule