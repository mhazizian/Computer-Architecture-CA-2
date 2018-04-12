module add_sub_12(first, second, res);
	
	input[11:0] first;
	input[7:0] second;
	output logic [11:0] res;
		
	assign res = second[7] ? (first - {5'b0, second[6:0]}) : (first + {5'b0, second[6:0]});

endmodule
