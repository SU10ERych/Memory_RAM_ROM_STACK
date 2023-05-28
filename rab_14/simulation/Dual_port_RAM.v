module Dual_port_RAM

#(
	parameter DATA_WIDTH = 9,
	parameter ADDR_WIDTH = 15
)

(
	input we_1, we_2,
	input clk_1, clk_2,
	input [(DATA_WIDTH-1):0] data_in_1, data_in_2,
	input [(ADDR_WIDTH-1):0] read_addr_1, read_addr_2,
	input [(ADDR_WIDTH-1):0] write_addr_1, write_addr_2,
	output reg[(DATA_WIDTH-1):0] data_out_1, data_out_2
);

	reg [DATA_WIDTH - 1:0] dp_ram [0:2**ADDR_WIDTH-1];
	
	always @ (posedge clk_1)
		begin
			if (we_1)
				dp_ram [write_addr_1] <= data_in_1;
				data_out_1 <= dp_ram [read_addr_1];
		end
		
	always @ (posedge clk_2)
		begin
			if (we_2)
				dp_ram [write_addr_2] <= data_in_2;
				data_out_2 <= dp_ram [read_addr_2];
		end
		
endmodule