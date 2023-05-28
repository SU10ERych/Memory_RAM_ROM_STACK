module RAM
#(
	parameter DATA_WIDTH = 8,
	parameter ADDR_WIDTH = 16
)

(
	input [(DATA_WIDTH-1):0] data_in,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output reg [(DATA_WIDTH-1):0] data_out,
	output [(ADDR_WIDTH-1):0] addr_out
);

	reg [DATA_WIDTH-1:0] ram[0:2**ADDR_WIDTH-1];
	reg [ADDR_WIDTH-1:0] addr_reg_R;
	//reg [ADDR_WIDTH-1:0] addr_reg_W;
	//reg [DATA_WIDTH-1:0] data_reg_in;
	//wire [DATA_WIDTH-1:0] data_in_reg;
	//wire [DATA_WIDTH-1:0] data_out;
	
	wire w_we = ~we;
	wire w_clk = ~clk;
	

	always @(posedge w_clk)
		begin
			//data_reg_in <= data_in;
			//addr_reg_W <= addr;
			addr_reg_R <= addr;
			if (w_we)
			begin
				ram[addr] <= data_in;
			end
			data_out <= ram[addr_reg_R];
		end
	
	//assign data_out = data_reg_out;
	assign addr_out = addr_reg_R;
	
endmodule