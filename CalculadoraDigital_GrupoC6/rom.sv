module rom(
	input logic [3:0] entrada,
	input logic [1:0] estado,
	output logic [1:0] prox_estado,
	output logic [1:0] saida
);

logic [3:0] resultado;

assign saida = resultado[3:2];
assign prox_estado = resultado[1:0];

always @(*)
	casex ({estado,entrada})
		6'b 00_101x: resultado = 2'b 00_00;	//A e B
		6'b 00_11xx: resultado = 2'b 00_00;	//C a F
		6'b 00_0xxx: resultado = 2'b 00_01;	//0 a 7
		6'b 00_100x: resultado = 2'b 00_01;	//8 ou 9
		
		6'b 01_101x: resultado = 2'b 01_10;	//A e B
		6'b 01_1100: resultado = 2'b 01_10;	//C
		6'b 01_1101: resultado = 2'b 01_01;	//D
		6'b 01_111x: resultado = 2'b 01_01;	//E e F
		6'b 01_100x: resultado = 2'b 01_01;	//8 e 9
		6'b 01_0xxx: resultado = 2'b 01_01;	//0 a 7
		
		6'b 10_101x: resultado = 2'b 10_10;	//A e B
		6'b 10_11xx: resultado = 2'b 10_10;	//C a F
		6'b 10_0xxx: resultado = 2'b 10_11;	//0 a 7
		6'b 10_100x: resultado = 2'b 10_11;	//8 ou 9
		
		6'b 11_1101: resultado = 2'b 11_00;	//D
		6'b 11_1100: resultado = 2'b 11_11;	//C
		6'b 11_111x: resultado = 2'b 11_11;	//E e F
		6'b 11_10xx: resultado = 2'b 11_11;	//8 a B
		6'b 11_0xxx: resultado = 2'b 11_11;	//0 a 7
		
		default: 	 resultado = 2'b 00_00;
	endcase
endmodule 