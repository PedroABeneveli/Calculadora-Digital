module ula(
	input logic unsigned [3:0] num1,
	input logic unsigned [3:0] num2,
	input logic operacao [1:0],
	output logic [7:0] resultado
);

	logic signed [7:0] soma;
	logic signed [7:0] sub;
	logic signed [7:0] mult;

	assign soma = num1 + num2;
	assign sub = num1 - num2;
	assign mult = num1 * num2;
	
	mux4 muxUla (.d0(7'b0), .d1(soma), .d2(sub), .d3(mult), .selection(operacao), .S(resultado));
	
endmodule 

module mux4(
	input logic [7:0] d0, d1, d2, d3,
	input selection[1:0], 
	output [7:0] S
);
	assign S = selection[1] ? (selection[0] ? d3 : d2) : (selection[0] ? d1 : d0);
endmodule 

module demux4_4bits(
	output logic [3:0] d0, d1, d2, d3,
	input [1:0] selection, 
	input [3:0] S
);
	assign d0 = selection == 2'b 00 ? S : 4'b0000;
	assign d1 = selection == 2'b 01 ? S : 4'b0000;
	assign d2 = selection == 2'b 10 ? S : 4'b0000;
	assign d3 = selection == 2'b 11 ? S : 4'b0000;
endmodule 

module decod_2(
	input logic [1:0] num,
	output logic s0, s1, s2, s3
);
	assign s0 = num == 2'b 00 ? 1'b1 : 1'b0;
	assign s1 = num == 2'b 01 ? 1'b1 : 1'b0;
	assign s2 = num == 2'b 10 ? 1'b1 : 1'b0;
	assign s3 = num == 2'b 11 ? 1'b1 : 1'b0;
endmodule 