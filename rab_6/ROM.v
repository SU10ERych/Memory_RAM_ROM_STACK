module ROM
#(
	parameter DATA_WIDTH = 4,
	parameter ADDR_WIDTH = 6
)

(
	input clk,
	input [(ADDR_WIDTH - 1):0] addr_1, addr_2, 
	output [(DATA_WIDTH - 1):0] data_out,
	output reg [ADDR_WIDTH - 1:0] addr_reg_1, addr_reg_2
);
	

	(*rom_style = "block" *) reg [DATA_WIDTH - 1:0] rom[0:2**ADDR_WIDTH-1];

		
	wire w_clk = ~ clk;
	
	initial begin
		$readmemh("../rom.txt", rom);
	end
	
	always @ (posedge w_clk)
	begin
		addr_reg_1 <= addr_1;
		addr_reg_2 <= addr_2;

	end
	
	assign data_out = rom[addr_reg_1] * rom[addr_reg_2];
	//assign data_out = rom[addr_reg_1];

	
		
endmodule
	