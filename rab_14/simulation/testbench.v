
`timescale 1ns/1ns
module testbench;
	reg we_1;
	reg clk_1;
	reg [7:0] data_in_1;
	reg [14:0] read_addr_1;
	reg [14:0] write_addr_1;
	wire [7:0] data_out_1;
	
	reg we_2;
	reg clk_2;
	reg [7:0] data_in_2;
	reg [14:0] read_addr_2;
	reg [14:0] write_addr_2;
	wire [7:0] data_out_2;
	integer i;

	Dual_port_RAM dut (we_1, we_2, clk_1, clk_2, data_in_1, data_in_2, read_addr_1, read_addr_2, write_addr_1, write_addr_2, data_out_1,  data_out_2);
	initial
		begin

			clk_1 = 0;
			clk_2 = 0;
			we_1 = 0;
			we_2 = 0;
			
			write_addr_1 = 15'b000000000000000;
			read_addr_1 = 15'b000000000000000;
			data_in_1 = 8'b00000000;
			
			write_addr_2 = 15'b000000100000000;
			read_addr_2 = 15'b000000100000000;
			data_in_2 = 8'b10000000;

			#20; we_1 = 1; we_2 = 1;
			
			for (i=0; i < 8; i= i+1)
				begin
					#40;
					data_in_1 = data_in_1 + 1;
					data_in_2 = data_in_2 + 1;
					
					write_addr_1 = write_addr_1 + 1;
					write_addr_2 = write_addr_2 + 1;
					
					
					read_addr_1 = write_addr_1;
					read_addr_2 = write_addr_2;
					
				end
			#20;	
		end

		always #10 clk_1 = ~clk_1;
		always #10 clk_2 = ~clk_2;
		initial
			#1000 $finish;

		initial
			$monitor("data_in_1=%b write_addr_1=%b read_addr_1=%b we_1=%b clk_1=%b data_out_1=%b data_in_2=%b write_addr_2=%b read_addr_2=%b we_2=%b clk_2=%b data_out_2=%b", data_in_1, write_addr_1, read_addr_1, we_1, clk_1, data_out_1, data_in_2, write_addr_2, read_addr_2, we_2, clk_2, data_out_2);
 
		initial
			$dumpvars;
endmodule
