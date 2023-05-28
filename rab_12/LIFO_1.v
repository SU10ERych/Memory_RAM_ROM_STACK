module LIFO_1

#(
	parameter DATA_WIDTH = 8, 
	parameter STACK_SIZE = 4
)

(
	input clk, reset, push, pop, 
	input [DATA_WIDTH - 1:0] write_data,
	output reg full, empty,
	output reg [DATA_WIDTH - 1:0] read_data
);

	reg [DATA_WIDTH - 1:0] stack [0:STACK_SIZE - 1];
	wire w_clk = ~clk;
	
	integer i;
	
	always @ (posedge w_clk)
	begin
	
		if (reset) begin
			for (i = 0; i < STACK_SIZE; i = i + 1)
				stack [i] <= 0;
			full <= 0;
			empty <= 1;
		end
	
		else if (push) begin
			empty <= 0;
			for (i = 0; i < STACK_SIZE - 1; i = i + 1)
				stack [i + 1] <= stack [i];
			stack [0] <= write_data;
			
			if (stack[STACK_SIZE - 1] != 0)
				full <= 1;
		end
		
		else if (pop) begin
			full <= 0;
			for (i = 0; i < STACK_SIZE - 1; i = i + 1)
				stack [i] <= stack [i + 1];
			stack [STACK_SIZE - 1] <= 0;
			read_data = stack [0];
			
			if (stack[0] == 0)
				empty <= 1;
			
		end
	end
	
	
endmodule
