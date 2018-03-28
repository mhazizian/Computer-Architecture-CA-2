`include "defines.sv"

module Alu(alu_in1, alu_in2, C, opcode, alu_out, Z);

	input [7:0] alu_in1, alu_in2;
	input [2:0] opcode;
	input C;
	output logic [7:0] alu_out;
	output logic Z;
	
	always @(*) begin
		case(opcode)
			`ADD_FN:		alu_out <= alu_in1 + alu_in2;
			`ADDC_FN:		alu_out <= alu_in1 + alu_in2 + C;
			`SUB_FN:		alu_out <= alu_in1 - alu_in2;
			`SUBC_FN: 		alu_out <= alu_in1 - alu_in2 - C;
			`AND_FN:		alu_out <= alu_in1 & alu_in2;
			`OR_FN:			alu_out <= alu_in1 | alu_in2;
			`XOR_FN:		alu_out <= alu_in1 ^ alu_in2;
			`MASK_FN:		alu_out <= ~(alu_in1 & alu_in2);
		endcase
	end
	
	assign Z = (alu_out == 7'b0 ? 1 : 0);
	
endmodule