`include "defines.sv"

module Controller(instruction, ALU_op, sel_ALUScr_reg, sel_ALUScr_const);

	input [5:0] instruction;
	output logic[2:0] ALU_op;
	output logic sel_ALUScr_reg, sel_ALUScr_const;

	always @(instruction) begin
		sel_ALUScr_reg = 0; sel_ALUScr_const = 0;

		if (instruction[5:4] ==`REGISTER_TYPE_OPCODE) begin
			ALU_op = instruction[3:0];
			sel_ALUScr_reg = 1;
		end
		if (instruction[5:4] ==`REGISTER_TYPE_OPCODE) begin
			ALU_op = instruction[3:0];
			sel_ALUScr_const = 1;
		end
			
	end

endmodule // Controller