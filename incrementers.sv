module incrementer_12(num, q);

	input [11:0]num;
	output logic[11:0]q;

	assign q = num + 1;
	
endmodule