module ROM

#(
	parameter DATA_WIDTH=8, 
	parameter ADDR_WIDTH=10
)
(
	input clk, 
	input [1:0]active,
	output reg [(DATA_WIDTH-1):0] data_out,
	output reg [(ADDR_WIDTH-1):0] addr_out
);
	reg [DATA_WIDTH-1:0] rom[0:2**ADDR_WIDTH-1];
	wire w_clk = ~ clk;
	
	reg [DATA_WIDTH-1:0] Sin = 8'b00000000;
	reg [DATA_WIDTH-1:0] Sin_1 = 8'b00000000;
	reg [DATA_WIDTH-1:0] Gaus = 8'b00000000;
	reg [DATA_WIDTH-1:0] Exp = 8'b00000000;


	reg [ADDR_WIDTH-1:0] addr_reg = 0;
	
	initial begin
		$readmemb("../rom.txt",rom);
	end
	
	always @ (posedge w_clk)
	begin
		
		if (active == 2'b00) begin
		addr_reg = 10'b0000000000;
		data_out <= rom[addr_reg + Sin];
		addr_out = addr_reg + Sin;
		Sin = Sin+1;
		end
		
		if (active == 2'b01) begin
		addr_reg = 10'b0100000000;
		data_out <= rom[addr_reg + Sin_1];
		addr_out = addr_reg + Sin_1;
		Sin_1 = Sin_1+1;
		end
		
		if (active == 2'b10) begin
		addr_reg = 10'b1000000000;
		data_out <= rom[addr_reg + Gaus];
		addr_out = addr_reg + Gaus;
		Gaus = Gaus+1;
		end
		
		if (active == 2'b11) begin
		addr_reg = 10'b1100000000;
		data_out <= rom[addr_reg + Exp];
		addr_out = addr_reg + Exp;
		Exp = Exp+1;
		end
		
	end
	
endmodule
	