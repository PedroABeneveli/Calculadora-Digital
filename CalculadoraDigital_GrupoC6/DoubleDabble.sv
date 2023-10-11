module doubleDabble(
   input [7:0] binario,
   output reg [7:0] bcd				// Como nosso valor máximo é 81, o bcd que normalmente teria que ser de 12 bits pode ser de só 8
   );
   
integer i;
	
always @(binario) begin
	bcd=0;		 	
	for (i=0;i<8;i=i+1) begin									//Iterate once for each bit in input number
		if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
		if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
		bcd = {bcd[7:0],binario[7-i]};							//Shift one bit, and shift in proper bit from input 
    end
end
endmodule 