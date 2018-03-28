module sign_extender(in, out);
	input [7:0] in;
	output logic [11:0] out;
	
	assign out = {in[7], in[7], in[7] ,in[7], in};
	
endmodule