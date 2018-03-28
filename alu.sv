`include "defines.sv"

module Alu(alu_in1, alu_in2, cin, opcode, alu_out, zero, cout);

	input [7:0] alu_in1, alu_in2;
	input [2:0] opcode;
	input cin;
	output logic [7:0] alu_out;
	output logic zero;
	
	always @(*) begin
		case(opcode)
			`ADD_FN:		{cout, alu_out} <= alu_in1 + alu_in2;
			`ADDC_FN:		{cout, alu_out} <= alu_in1 + alu_in2 + cin;
			`SUB_FN:		{cout, alu_out} <= alu_in1 - alu_in2;
			`SUBC_FN: 		{cout, alu_out} <= alu_in1 - alu_in2 - cin;
			`AND_FN:		alu_out <= alu_in1 & alu_in2;
			`OR_FN:			alu_out <= alu_in1 | alu_in2;
			`XOR_FN:		alu_out <= alu_in1 ^ alu_in2;
			`MASK_FN:		alu_out <= ~(alu_in1 & alu_in2);
		endcase
	end
	
	assign zero = (alu_out == 7'b0 ? 1 : 0);
	
endmodule