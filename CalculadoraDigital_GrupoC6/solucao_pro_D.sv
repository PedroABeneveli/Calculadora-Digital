module seletor_clock(
	input logic ready,
	input logic [3:0] valor,
	input logic [1:0] estado,
	output logic relogio
);

always @(*)
	casex({ready, valor, estado})
		7'b 0_xxxx_xx: relogio = 1'b 0;	// não tem tecla pressionada
		
		7'b 1_0xxx_00: relogio = 1'b 1;	// 0 a 7
		7'b 1_100x_00: relogio = 1'b 1;	// 8 e 9
		7'b 1_101x_00: relogio = 1'b 0;	// A e B
		7'b 1_11xx_00: relogio = 1'b 0;	// C a F
		
		7'b 1_0xxx_01: relogio = 1'b 0;	// 0 a 7
		7'b 1_100x_01: relogio = 1'b 0;	// 8 e 9
		7'b 1_101x_01: relogio = 1'b 1;	// A e B
		7'b 1_1100_01: relogio = 1'b 1;	// C
		7'b 1_1101_01: relogio = 1'b 0;	// D
		7'b 1_111x_01: relogio = 1'b 0;	// E e F
		
		7'b 1_0xxx_10: relogio = 1'b 1;	// 0 a 7
		7'b 1_100x_10: relogio = 1'b 1;	// 8 e 9
		7'b 1_101x_10: relogio = 1'b 0;	// A e B
		7'b 1_11xx_10: relogio = 1'b 0;	// C a F
		
		7'b 1_0xxx_11: relogio = 1'b 0;	// 0 a 7
		7'b 1_10xx_11: relogio = 1'b 0;	// 8 a B
		7'b 1_1100_11: relogio = 1'b 0;	// C	
		7'b 1_1101_11: relogio = 1'b 1;	// D
		7'b 1_111x_11: relogio = 1'b 0;	// E e F
		default: 		relogio = 1'b 0;
	endcase
endmodule 