module D_reg_8

#(
	parameter WIDTH = 8
)

(
input ena,
input clk,
input [WIDTH - 1 : 0] d,
output reg [WIDTH - 1 : 0] q
);

always @ (posedge clk)
//if (ena)
	q <= d;
 
endmodule