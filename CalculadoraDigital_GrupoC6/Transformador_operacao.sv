module transformador_operacao(
	input logic [3:0] dado,
	output logic [1:0] op_codificada
);
	always @(*)
		casex(dado)
			4'b 1010: op_codificada = 2'b 11;
			4'b 1011: op_codificada = 2'b 10;
			4'b 1100: op_codificada = 2'b 01;
			default: op_codificada = 2'b 00;
		endcase
endmodule 

module detectorD(
input logic [3:0] num,
output logic eh_um
);

assign eh_num = num == 4'b 1101 ? 1'b1 : 1'b0;

endmodule 