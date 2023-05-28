`timescale 1ns/1ns
module testbench;
	reg clk;
	reg [3:0] addr;
	wire [6:0] data_out;
	wire [3:0] addr_out;
	reg ena;
	integer i;
	
	ROM dut (clk, addr, data_out, addr_out, ena);
	
initial
	begin
		ena = 1;
		clk = 0;
		#20; addr = 4'b0000; 
		for (i=0 ; i<=14; i=i+1)
			begin
				#20; addr = addr+4'b0001;
			end
			
		#20; addr=4'b0000; ena = 0;
		for (i=0; i<=4; i=i+1)
			begin
				#20; addr = addr+4'b0001;
			end
	end
	
	always #10 clk = ~clk;
		initial
			#380 $finish;

	initial
		$monitor("clk=%b addr=%b data_out=%b addr_out=%b ena=%b", clk, addr, data_out, addr_out, ena);
	initial
		$dumpvars;
endmodule