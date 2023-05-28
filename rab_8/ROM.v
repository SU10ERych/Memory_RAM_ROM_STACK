module ROM

#(
	parameter DATA_WIDTH=7, 
	parameter ADDR_WIDTH=4
)
(
	input clk,
	input [(ADDR_WIDTH-1):0] addr, 
	output [(DATA_WIDTH-1):0] data_out,
	output [(ADDR_WIDTH-1):0] addr_out,
	input ena 
);
	reg [DATA_WIDTH-1:0] rom[0:2**ADDR_WIDTH-1];
	wire w_clk = ~ clk;

	reg [ADDR_WIDTH-1:0] addr_reg;
	
	initial begin
		$readmemb("../rom.txt",rom);
	end
	
	always @ (posedge w_clk)
	begin
		
		if (ena)
			addr_reg <= addr;
		else
			addr_reg = 4'bxxxx;
	end
	
	assign data_out = rom[addr_reg]; 
	assign addr_out = addr_reg;
	
endmodule
	