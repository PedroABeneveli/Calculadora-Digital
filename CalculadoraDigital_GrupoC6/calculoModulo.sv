module modulo_num(
	input logic [7:0] numero,
	output logic [7:0] modulo
);

assign modulo = numero[7] ? (~numero + 1'b1) : numero;

endmodule 

module inverte(
	input [3:0] valor,
	output [3:0] notValor
);

assign notValor = ~valor;

endmodule 