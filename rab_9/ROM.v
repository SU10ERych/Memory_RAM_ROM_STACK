module ROM

#(
	parameter DATA_WIDTH=8, 
	parameter ADDR_WIDTH=10
)
(
	input clk,
	output reg [(DATA_WIDTH-1):0] data_out,
	output reg [(ADDR_WIDTH-1):0] addr_out
);
	reg [DATA_WIDTH-1:0] rom[0:2**ADDR_WIDTH-1];
	wire w_clk = ~ clk;
	
	reg [DATA_WIDTH-1:0] Sin = 8'b00000000;

	reg [ADDR_WIDTH-1:0] addr_reg;
	
	initial begin
		$readmemb("../rom.txt",rom);
	end
	
	always @ (posedge w_clk)
	begin
	
		addr_reg = 0;
		data_out <= rom[addr_reg + Sin];
		addr_out = addr_reg + Sin;
		Sin = Sin+1;
	
	end
	
endmodule
	