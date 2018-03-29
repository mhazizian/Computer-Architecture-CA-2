`include "defines.sv"

module Controller(instruction, ALU_op, sel_ALUScr_reg, sel_ALUScr_const,
	sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1, MemWrite, MemRead,
	sel_RegisterFile_in_alu, sel_RegisterFile_in_memory, RegisterFileWriteEn, sel_RegisterFileWriteDst_r2,
	sel_RegisterFile_in_shifter, sel_RegisterFileReadReg2_rd);

	input [5:0] instruction;
	output logic[2:0] ALU_op;
	output logic sel_ALUScr_reg, sel_ALUScr_const,
		sel_PCSrc_const, sel_PCSrc_offset, sel_PCSrc_plus1,
		MemWrite, MemRead, sel_RegisterFile_in_alu, sel_RegisterFile_in_memory,
		RegisterFileWriteEn, sel_RegisterFileWriteDst_r2, sel_RegisterFile_in_shifter,
		sel_RegisterFileReadReg2_rd;

	always @(instruction) begin
		sel_ALUScr_reg = 0; sel_ALUScr_const = 0;
		sel_PCSrc_const = 0; sel_PCSrc_offset = 0;
		sel_PCSrc_plus1 = 0;
		MemWrite = 0; MemRead = 0;
		sel_RegisterFile_in_alu = 0;
		sel_RegisterFile_in_memory = 0;
		RegisterFileWriteEn = 0;
		sel_RegisterFileWriteDst_r2 = 0;
		sel_RegisterFile_in_shifter = 0;
		sel_RegisterFileReadReg2_rd = 0;


		if (instruction[5:4] ==`REGISTER_TYPE_OPCODE) begin
			ALU_op = instruction[3:0];
			sel_ALUScr_reg = 1;
			sel_PCSrc_plus1 = 1;
			sel_RegisterFile_in_alu = 1;
			RegisterFileWriteEn = 1;
		end
		if (instruction[5:4] ==`IMMEDIATE_TYPE_OPCODE) begin
			ALU_op = instruction[3:0];
			sel_ALUScr_const = 1;
			sel_PCSrc_plus1 = 1;
			sel_RegisterFile_in_alu = 1;
			RegisterFileWriteEn = 1;
		end
		if (instruction[5:3] ==`SHIFT_TYPE_OPCODE) begin
			sel_RegisterFile_in_shifter = 1;
			sel_PCSrc_plus1 = 1;
			RegisterFileWriteEn = 1;
		end
		if (instruction[5:3] ==`MEMORY_TYPE_OPCODE) begin
			sel_ALUScr_const = 1;
			sel_PCSrc_plus1 = 1;

			if (instruction[2:1] == `STM_FN) begin
				MemWrite = 1;
				sel_RegisterFileReadReg2_rd = 1;
			end
			if (instruction[2:1] == `LDM_FN) begin
				MemRead = 1;
				sel_RegisterFile_in_memory = 1;
				RegisterFileWriteEn = 1;
				sel_RegisterFileWriteDst_r2 = 1;
			end

		end
		if (instruction[5:3] ==`CONDITIONAL_JUMP_TYPE_OPCODE) begin
			sel_PCSrc_offset = 1;
			sel_RegisterFile_in_alu = 1;
		end
		if (instruction[5:2] ==`NON_CONDITIONAL_JUMP_TYPE_OPCODE) begin
			sel_PCSrc_const = 1;
			sel_RegisterFile_in_alu = 1;
		end
			
	end

endmodule // Controller