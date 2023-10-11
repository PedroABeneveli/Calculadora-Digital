module decod_sinal(
	input logic MSbit,
	output logic [6:0] display
);

always @(*)
	casex (MSbit)
		1'b 0: display = 7'b 1111111;
		1'b 1: display = 7'b 0111111;
	endcase
	
endmodule 