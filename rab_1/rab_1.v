module rab_1 
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 5
)

(
	input clk,
	input [37:0] SW,
	output [31:0] LEDR
);

	reg [31:0] w_we; // выход дешифратора
	reg [31:0] mux_out; // выход мультиплексора
	wire [(DATA_WIDTH-1):0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10,
	reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, 
	reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31; // выход 32-х регистров разярядностью 32
	
	//Дешифратор
	always @(SW[36:32])
		begin
			if (SW[37])
				case (SW[36:32])
					5'b00000 : w_we = 32'b00000000000000000000000000000001;
					5'b00001 : w_we = 32'b00000000000000000000000000000010;
					5'b00010 : w_we = 32'b00000000000000000000000000000100;
					5'b00011 : w_we = 32'b00000000000000000000000000001000;
					5'b00100 : w_we = 32'b00000000000000000000000000010000;
					5'b00101 : w_we = 32'b00000000000000000000000000100000;
					5'b00110 : w_we = 32'b00000000000000000000000001000000;
					5'b00111 : w_we = 32'b00000000000000000000000010000000;
					5'b01000 : w_we = 32'b00000000000000000000000100000000;
					5'b01001 : w_we = 32'b00000000000000000000001000000000;
					5'b01010 : w_we = 32'b00000000000000000000010000000000;
					5'b01011 : w_we = 32'b00000000000000000000100000000000;
					5'b01100 : w_we = 32'b00000000000000000001000000000000;
					5'b01101 : w_we = 32'b00000000000000000010000000000000;
					5'b01110 : w_we = 32'b00000000000000000100000000000000;
					5'b01111 : w_we = 32'b00000000000000001000000000000000;
					5'b10000 : w_we = 32'b00000000000000010000000000000000;
					5'b10001 : w_we = 32'b00000000000000100000000000000000;
					5'b10010 : w_we = 32'b00000000000001000000000000000000;
					5'b10011 : w_we = 32'b00000000000010000000000000000000;
					5'b10100 : w_we = 32'b00000000000100000000000000000000;
					5'b10101 : w_we = 32'b00000000001000000000000000000000;
					5'b10110 : w_we = 32'b00000000010000000000000000000000;
					5'b10111 : w_we = 32'b00000000100000000000000000000000;
					5'b11000 : w_we = 32'b00000001000000000000000000000000;
					5'b11001 : w_we = 32'b00000010000000000000000000000000;
					5'b11010 : w_we = 32'b00000100000000000000000000000000;
					5'b11011 : w_we = 32'b00001000000000000000000000000000;
					5'b11100 : w_we = 32'b00010000000000000000000000000000;
					5'b11101 : w_we = 32'b00100000000000000000000000000000;
					5'b11110 : w_we = 32'b01000000000000000000000000000000;
					5'b11111 : w_we = 32'b10000000000000000000000000000000;
					default : w_we = 32'b00000000000000000000000000000000;
				endcase
			else
					w_we = 32'b00000000000000000000000000000000;
		end
		
	//Регистры
	D_reg_32 register0
	(
	.ena(w_we[0]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg0)
	),
	
	register1
	(
	.ena(w_we[1]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg1)
	),
	
	register2
	(
	.ena(w_we[2]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg2)
	),
	
	register3
	(
	.ena(w_we[3]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg3)
	),
	
	register4
	(
	.ena(w_we[4]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg4)
	),
	
	register5
	(
	.ena(w_we[5]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg5)
	),
	
	register6
	(
	.ena(w_we[6]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg6)
	),
	
	register7
	(
	.ena(w_we[7]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg7)
	),
	
	register8
	(
	.ena(w_we[8]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg8)
	),
	
	register9
	(
	.ena(w_we[9]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg9)
	),
	
	register10
	(
	.ena(w_we[10]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg10)
	),
	
	register11
	(
	.ena(w_we[11]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg11)
	),
	
	register12
	(
	.ena(w_we[12]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg12)
	),
	
	register13
	(
	.ena(w_we[13]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg13)
	),
	
	register14
	(
	.ena(w_we[14]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg14)
	),
	
	register15
	(
	.ena(w_we[15]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg15)
	),
	
	register16
	(
	.ena(w_we[16]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg16)
	),
	
	register17
	(
	.ena(w_we[17]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg17)
	),
	
	register18
	(
	.ena(w_we[18]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg18)
	),
	
	register19
	(
	.ena(w_we[19]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg19)
	),
	
	register20
	(
	.ena(w_we[20]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg20)
	),
	
	register21
	(
	.ena(w_we[21]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg21)
	),
	
	register22
	(
	.ena(w_we[22]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg22)
	),
	
	register23
	(
	.ena(w_we[23]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg23)
	),
	
	register24
	(
	.ena(w_we[24]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg24)
	),
	
	register25
	(
	.ena(w_we[25]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg25)
	),
	
	register26
	(
	.ena(w_we[26]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg26)
	),
	
	register27
	(
	.ena(w_we[27]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg27)
	),
	
	register28
	(
	.ena(w_we[28]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg28)
	),
	
	register29
	(
	.ena(w_we[29]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg29)
	),
	register30
	(
	.ena(w_we[30]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg30)
	),
	register31
	(
	.ena(w_we[31]),
	.clk(clk),
	.d(SW[31:0]),
	.q(reg31)
	);
	
			
	//Мультиплексор
	always @(SW[36:32], reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10,
	reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, 
	reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31)
		case (SW[36:32])
			5'b00000 : mux_out = reg0;
			5'b00001 : mux_out = reg1;
			5'b00010 : mux_out = reg2;
			5'b00011 : mux_out = reg3;
			5'b00100 : mux_out = reg4;
			5'b00101 : mux_out = reg5;
			5'b00110 : mux_out = reg6;
			5'b00111 : mux_out = reg7;
			5'b01000 : mux_out = reg8;
			5'b01001 : mux_out = reg9;
			5'b01010 : mux_out = reg10;
			5'b01011 : mux_out = reg11;
			5'b01100 : mux_out = reg12;
			5'b01101 : mux_out = reg13;
			5'b01110 : mux_out = reg14;
			5'b01111 : mux_out = reg15;
			5'b10000 : mux_out = reg16;
			5'b10001 : mux_out = reg17;
			5'b10010 : mux_out = reg18;
			5'b10011 : mux_out = reg19;
			5'b10100 : mux_out = reg20;
			5'b10101 : mux_out = reg21;
			5'b10110 : mux_out = reg22;
			5'b10111 : mux_out = reg23;
			5'b11000 : mux_out = reg24;
			5'b11001 : mux_out = reg25;
			5'b11010 : mux_out = reg26;
			5'b11011 : mux_out = reg27;
			5'b11100 : mux_out = reg28;
			5'b11101 : mux_out = reg29;
			5'b11110 : mux_out = reg30;
			5'b11111 : mux_out = reg31;
			default : mux_out = 32'b00000000000000000000000000000000;
		endcase
		
	assign LEDR = mux_out;
	
endmodule
	