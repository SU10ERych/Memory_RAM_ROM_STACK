`timescale 1ns/1ns
module testbench;

	reg clk;
	reg [37:0] SW;
	wire [31:0] LEDR;

	rab_1 dut ( clk, SW, LEDR );
	
	initial
		begin

		clk = 1;
		SW = 38'b11111111111111111111111111110001111111;
		#5;
		
		repeat(3)
		begin
			#20;
			SW[36:32] = SW[36:32]+5'b00001;
		end
		#40;
		SW = 38'b00000000000000000000000000000000000000;
		repeat(3)
		begin
			#20;
			SW[36:32] = SW[36:32]+5'b00001;
		end	
	end
	
	always #10 clk = ~clk;
	
	initial
		#200 $finish;
		
	initial
		$monitor("clk=%b SW=%h LEDR=%h", clk, SW, LEDR);

	initial
		$dumpvars;
endmodule 