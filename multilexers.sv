module mux_2_to_1_8(first, second, sel_first, sel_second, out);

	input[7:0] first, second;
	input sel_first, sel_second;
	output logic [7:0] out;
	
	assign out = sel_first ? first : (sel_second ? second : out); 
	
endmodule

module mux_3_to_1_1(first, second, third, sel_first, sel_second, out);

	input first, second, third;
	input sel_first, sel_second;
	output logic out;
	
	assign out = sel_first ? first : (sel_second ? second : third); 
	
endmodule

module mux_3_to_1_8(first, second, third, sel_first, sel_second, sel_third, out);

	input[7:0] first, second, third;
	input sel_first, sel_second, sel_third;
	output logic [7:0] out;
	
	assign out = sel_first ? first : (sel_second ? second : (sel_third ? third : out)); 
	
endmodule

module mux_2_to_1_3(first, second, sel, out);

	input[2:0] first, second;
	input sel;
	output logic [2:0] out;
	
	assign out = sel ? first : second; 
	
endmodule

module mux_2_to_1_1(first, second, sel_first, sel_second, out);

	input first, second;
	input sel_first, sel_second;
	output logic out;
	
	assign out = sel_first ? first : (sel_second ? second : out); 
	
endmodule

module mux_3_to_1_12(first, second, third, sel_first, sel_second, sel_third, out);

	input[11:0] first, second, third;
	input sel_first, sel_second, sel_third;
	output logic [11:0] out;
	
	assign out = sel_first ? first : (sel_second ? second : (sel_third ? third : out));  
	
endmodule


module mux_4_to_1_12(first, second, third, fourth, sel_first, sel_second, sel_third, sel_fourth, out);

	input[11:0] first, second, third, fourth;
	input sel_first, sel_second, sel_third, sel_fourth;
	output logic [11:0] out;
	
	assign out = sel_first ? first : (sel_second ? second : (sel_third ? third : (sel_fourth ? fourth : out)));  
	
endmodule