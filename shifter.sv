`include "defines.sv"

module shifter(data, opcode, shift_out, shift_count, Z, C);

	input[7:0] data;
	input[1:0] opcode;
	output logic [7:0] shift_out;
	shift_count, Z, C;

	assign local_shifter = data
	integer i;

	always @(*) begin
		case(opcode)
		`SHL_FN:
		begin
			for (i = 0; i < shift_count; i = i + 1) begin	
				local_shifter <= {local_shifter[
		end
		`SHR_FN: 
		begin
		end
		`ROL_FN: 
		begin
		end
		`ROR_FN: 
		begin
		end
		endcase
	end