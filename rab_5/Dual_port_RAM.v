module Dual_port_RAM

#(
	parameter DATA_WIDTH = 8,
	parameter ADDR_WIDTH_W = 5,
	parameter ADDR_WIDTH_H = 5
)

(
	input we,
	input clk,
	input [(DATA_WIDTH-1):0] data_in,
	input [ADDR_WIDTH_W-1:0] read_addr_1, 
	input [ADDR_WIDTH_H-1:0] read_addr_2,
	input [ADDR_WIDTH_W-1:0] write_addr_1, 
	input [ADDR_WIDTH_H-1:0] write_addr_2,
	output reg[(DATA_WIDTH-1):0] data_out
);

	reg [DATA_WIDTH - 1:0] dp_ram [0:ADDR_WIDTH_W-1][0:ADDR_WIDTH_H-1];
	
	always @ (posedge clk)
		begin
			if (we)
				dp_ram [write_addr_1][write_addr_2] <= data_in;
				data_out <= dp_ram [read_addr_1][read_addr_2];
		end
		
endmodule