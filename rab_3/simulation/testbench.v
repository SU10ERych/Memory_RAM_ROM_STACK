
`timescale 1ns/1ns
module testbench;

	reg [7:0] data_in;
	reg [7:0] addr;
	reg we;
	reg clk;
	wire [8:0] data_out;
	wire [7:0] addr_out;

	RAM dut (data_in, addr, we, clk, data_out, addr_out);
	initial
		begin

			clk = 0;
			we = 0;
			addr = 8'b00000000;
			data_in = 8'b00000000;

			#40; we = 0;
			for (addr=0; addr < 8; addr= addr+1)
				begin
					#40;
					data_in = data_in + 1;
				end

			#40; we = 1;
			for (addr=0; addr < 8; addr= addr+1)
				#40;
		end

		always #10 clk = ~clk;
		initial
			#300 $finish;

		initial
			$monitor("data_in=%b addr=%b we=%b clk=%b data_out=%b addr_out=%b", data_in, addr, we, clk, data_out, addr_out);
 
		initial
			$dumpvars;
endmodule
