module Dual_port_RAM

#(
	parameter DATA_WIDTH = 8,
	parameter ADDR_WIDTH = 5
)

(
	input we,
	input clk_1, clk_2,
	input [(DATA_WIDTH-1):0] data_in,
	input [ADDR_WIDTH-1:0] read_addr, 
	input [ADDR_WIDTH-1:0] write_addr, 
	output reg[(DATA_WIDTH-1):0] data_out
);

	reg [DATA_WIDTH - 1:0] dp_ram [0:ADDR_WIDTH-1];
	
	always @ (posedge clk_1)
		begin
			if (we)
				dp_ram [write_addr] <= data_in;
		end
		
	always @ (posedge clk_2)
		begin
			if (we)
				data_out <= dp_ram [read_addr];
		end
		
endmodule