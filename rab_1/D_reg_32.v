module D_reg_32

#(
	parameter WIDTH = 32
)

(
input ena,
input clk,
input [WIDTH - 1 : 0] d,
output reg [WIDTH - 1 : 0] q
);

always @ (posedge clk)
if (ena)
	q <= d;
 
endmodule