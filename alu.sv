`include "defines.sv"

module Alu(alu_in1, alu_in2, cin, opcode, alu_out, cout, Z);

	input [7:0] alu_in1, alu_in2;
	input [3:0] opcode;
	input cin;
	output logic [7:0] alu_out;
	output logic Z, cout;
	
	always @(*) begin
		case(opcode)
			`ADD_FN:		{cout, alu_out} <= alu_in1 + alu_in2;
			`ADDC_FN:		{cout, alu_out} <= alu_in1 + alu_in2 + cin;
			`SUB_FN:		{cout, alu_out} <= alu_in1 - alu_in2;
			`SUBC_FN: 		{cout, alu_out} <= alu_in1 - alu_in2 - cin;
			
			`AND_FN:		
			begin
				alu_out <= alu_in1 & alu_in2;
				cout <= 1'b0;
			end
			
			`OR_FN:			
			begin
				alu_out <= alu_in1 | alu_in2;
				cout <= 1'b0;
			end
			
			`XOR_FN:		
			begin
				alu_out <= alu_in1 ^ alu_in2;
				cout <= 1'b0;
			end
			
			`MASK_FN:		
			begin
				alu_out <= ~(alu_in1 & alu_in2);
				cout <= 1'b0;
			end
			
			`ADD_SIGNED:
				alu_out <= alu_in2[7] ? (alu_in1 - {1'b0, alu_in2[6:0]}) : (alu_in1 + {1'b0, alu_in2[6:0]});
		endcase
	
	end
	
	assign Z = (alu_out == 8'b0 ? 1 : 0);
	
endmodule