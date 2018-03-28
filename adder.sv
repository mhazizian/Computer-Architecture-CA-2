module adder_12(first, second, sum);

	input [11:0] first, second;
	output logic [11:0] sum;

	assign sum = first + second;

endmodule
