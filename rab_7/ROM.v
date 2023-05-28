module ROM

#(
	parameter DATA_WIDTH=8, 
	parameter ADDR_WIDTH=4
)
(
	input clk,
	input [(ADDR_WIDTH-1):0] addr,
	output [(DATA_WIDTH-1):0] data_out,
	output [(ADDR_WIDTH-1):0] addr_out,
	output reg [11:0] bcd
);

	reg [DATA_WIDTH-1:0] rom[0:2**ADDR_WIDTH-1];
	wire w_clk = ~ clk;

	reg [ADDR_WIDTH-1:0] addr_reg;
	
	integer i;
	wire [7:0] bin;
	
	initial begin
		$readmemb("../rom.txt",rom);
	end
	
	assign bin = rom[addr];
	
	always @(w_clk)
        begin
            bcd = 0;
            for (i = 0; i < 8; i = i+1)
            begin
                bcd = {bcd[10:0],bin[7-i]};
                     
                if(i < 7 && bcd[3:0] > 4) 
                    bcd[3:0] = bcd[3:0] + 3;
                if(i < 7 && bcd[7:4] > 4)
                    bcd[7:4] = bcd[7:4] + 3;
                if(i < 7 && bcd[11:8] > 4)
                    bcd[11:8] = bcd[11:8] + 3;  
            end
        end
	
	always @ (posedge w_clk)
	begin
		addr_reg <= addr;
	end
	
	assign data_out = rom[addr_reg];
	assign addr_out = addr_reg;
endmodule
	