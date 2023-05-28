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
	
	reg [7:0] fasa_inc = 8'b1;
	reg [9:0] addrSin = 10'b0000000000;

	
	initial begin
		$readmemb("../rom.txt",rom);
	end
	
	always @(posedge w_clk) begin
	
		if (addrSin[9:8] == 2'b00) begin
			data_out <= rom[addrSin[7:0]];
      end
		
      else if (addrSin[9:8] == 2'b01) begin
			data_out <= rom[~addrSin[7:0]];
      end
		
      else if (addrSin[9:8] == 2'b10) begin
			data_out <= ~rom[addrSin[7:0]];
      end
		
      else if (addrSin[9:8] == 2'b11) begin
			data_out <= ~rom[~addrSin[7:0]];
      end
		
			addr_out = addrSin;
			addrSin = addrSin + {2'b00,fasa_inc};
		end
	
endmodule
	