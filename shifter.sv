`include "defines.sv"

module shifter(data, opcode, shift_out, shift_count, Z, C, shift_enable);

	input [7:0] data;
	input [1:0] opcode;
	input [2:0] shift_count;
	input shift_enable;
	
	output logic Z, C;
	output logic [7:0] shift_out;
	
	assign Z = (shift_out == 8'b0 ? 1 : 0);	
	
	always @(posedge shift_enable) begin
	 
		integer i;
	
		shift_out = data;
		C = 0;
		
		case(opcode)

			`SHL_FN:
			begin
				for (i = 0; i < shift_count; i = i + 1) 
				begin	
					C = shift_out[7];
					shift_out = {shift_out[6:0], 1'b0};
				end
			end
			`SHR_FN:
			begin
				for (i = 0; i < shift_count; i = i + 1) 
				begin
					C = shift_out[0];
					shift_out = {1'b0, shift_out[7:1]};
				end
			end
			`ROL_FN:
			begin
				for (i = 0; i < shift_count; i = i + 1) 
				begin	
					shift_out = {shift_out[6:0], shift_out[7]}; 
				end
			end
			
			`ROR_FN: 
			begin
				for (i = 0; i < shift_count; i = i + 1) 
				begin	
					shift_out = {shift_out[0], shift_out[7:1]}; 
				end
			end
			
		endcase
	end
	
endmodule