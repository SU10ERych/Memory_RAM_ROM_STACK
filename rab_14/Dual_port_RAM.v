module Dual_port_RAM

#(
	parameter DATA_WIDTH = 8,
	parameter ADDR_WIDTH = 15
)

(
	input we_1, we_2,
	input clk_1, clk_2,
	input [(DATA_WIDTH-1):0] data_in_1, data_in_2,
	//input [(ADDR_WIDTH-1):0] read_addr_1, read_addr_2,
	input [(ADDR_WIDTH-1):0] write_addr_1, write_addr_2,
	output[(DATA_WIDTH-1):0] data_out_1, data_out_2
);

	Dual_port dut (
		.address_a (write_addr_1),
		.address_b (write_addr_2),
		.clock_a (clk_1),
		.clock_b (clk_2),
		.data_a (data_in_1),
		.data_b (data_in_2),
		.wren_a (we_1),
		.wren_b (we_2),
		.q_a (data_out_1),
		.q_b (data_out_2)
	);
		
endmodule