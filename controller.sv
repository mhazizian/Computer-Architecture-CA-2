`include "defines.sv"

module Controller(instruction, ALU_op, sel_ALUScr_reg, sel_ALUScr_const, sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1);

	input [5:0] instruction;
	output logic[2:0] ALU_op;
	output logic sel_ALUScr_reg, sel_ALUScr_const,
		sel_PCSrc_const, sel_PCSrc_offset, sel_PCSrc_plus1;

	always @(instruction) begin
		sel_ALUScr_reg = 0; sel_ALUScr_const = 0;
		sel_PCSrc_const = 0; sel_PCSrc_offset = 0;
		sel_PCSrc_plus1 = 0;

		if (instruction[5:4] ==`REGISTER_TYPE_OPCODE) begin
			ALU_op = instruction[3:0];
			sel_ALUScr_reg = 1;
			sel_PCSrc_plus1 = 1;
		end
		if (instruction[5:4] ==`IMMEDIATE_TYPE_OPCODE) begin
			ALU_op = instruction[3:0];
			sel_ALUScr_const = 1;
			sel_PCSrc_plus1 = 1;
		end
		if (instruction[5:3] ==`CONDITIONAL_JUMP_TYPE_OPCODE) begin
			sel_PCSrc_offset = 1;
		end
		if (instruction[5:2] ==`NO_CONDITIONAL_JUMP_TYPE_OPCODE) begin
			sel_PCSrc_const = 1;
		end
			
	end

endmodule // Controller