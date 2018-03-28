module mux_2_to_1_8(first, second, sel_first, sel_second, out);
	input[7:0] first, second;
	input sel_first, sel_second;
	output[7:0] out;
	assign out = sel_first ? first : (sel_second ? second : out); 
endmodule

module mux_3_to_1_8(first, second, third, sel_first, sel_second, sel_third, out);
	input[7:0] first, second, third;
	input sel_first, sel_second, sel_third;
	output[7:0] out;
	assign out = sel_first ? first : (sel_second ? second : (sel_third ? third : out)); 
endmodule

module mux_2_to_1_1(first, second, sel_first, sel_second, out);
	input first, second;
	input sel_first, sel_second;
	output out;
	assign out = sel_first ? first : (sel_second ? second : out); 
endmodule