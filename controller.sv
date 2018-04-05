`include "defines.sv"

module Controller(instruction, c , z, ALU_op, sel_ALUScr_reg, sel_ALUScr_const,
	sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1, sel_PCSrc_stack,
	MemWrite, MemRead,
	sel_RegisterFile_in_alu, sel_RegisterFile_in_memory, RegisterFileWriteEn,
	sel_RegisterFile_in_shifter, sel_RegisterFileReadReg2_rd, sel_Cin_alu, sel_Cin_shifter,
	push_stack, pop_stack);

	input [5:0] instruction;
	input c, z;
	output logic[3:0] ALU_op;
	output logic sel_ALUScr_reg, sel_ALUScr_const,
		sel_PCSrc_const, sel_PCSrc_offset, sel_PCSrc_plus1,
		MemWrite, MemRead, sel_RegisterFile_in_alu, sel_RegisterFile_in_memory,
		RegisterFileWriteEn, sel_RegisterFile_in_shifter,
		sel_RegisterFileReadReg2_rd, sel_Cin_alu, sel_Cin_shifter, push_stack, pop_stack, 
		sel_PCSrc_stack;

	always @(instruction) begin
		sel_ALUScr_reg = 0; sel_ALUScr_const = 0;

		sel_PCSrc_const = 0;
		sel_PCSrc_offset = 0;
		sel_PCSrc_plus1 = 0;

		MemWrite = 0; MemRead = 0;
		sel_RegisterFile_in_alu = 0;
		sel_RegisterFile_in_memory = 0;
		RegisterFileWriteEn = 0;
		sel_RegisterFile_in_shifter = 0;
		sel_RegisterFileReadReg2_rd = 0;

		sel_Cin_alu = 0;
		sel_Cin_shifter = 0;

		push_stack = 0;
		pop_stack = 0;
		sel_PCSrc_stack = 0;


		if (instruction[5:4] ==`REGISTER_TYPE_OPCODE) begin
			ALU_op = {1'b0, instruction[3:1]};
			sel_ALUScr_reg = 1;
			sel_PCSrc_plus1 = 1;
			sel_RegisterFile_in_alu = 1;
			RegisterFileWriteEn = 1;
			sel_Cin_alu = 1;
		end
		if (instruction[5:4] ==`IMMEDIATE_TYPE_OPCODE) begin
			ALU_op = {1'b0, instruction[3:1]};
			sel_ALUScr_const = 1;
			sel_PCSrc_plus1 = 1;
			sel_RegisterFile_in_alu = 1;
			RegisterFileWriteEn = 1;
			sel_Cin_alu = 1;
		end


		case (instruction[5:3])
			`SHIFT_TYPE_OPCODE :  begin
				sel_RegisterFile_in_shifter = 1;
				sel_PCSrc_plus1 = 1;
				RegisterFileWriteEn = 1;
				sel_Cin_shifter = 1;
			end
			`MEMORY_TYPE_OPCODE : begin
				// ALU_op = `ADD_FN;
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
				end

			end
			`CONDITIONAL_JUMP_TYPE_OPCODE : begin
				sel_PCSrc_plus1 = 1;
				// ALU_op = `ADD_FN;

				case (instruction[2:1])
					`BZ_FN : if (z) begin
						sel_PCSrc_offset = 1;
						sel_PCSrc_plus1 = 0;
					end
					`BC_FN : if (c) begin
						sel_PCSrc_offset = 1;
						sel_PCSrc_plus1 = 0;
					end
					`BNZ_FN : if (~z) begin
						sel_PCSrc_offset = 1;
						sel_PCSrc_plus1 = 0;
					end
					`BNC_FN : if (~c) begin
						sel_PCSrc_offset = 1;
						sel_PCSrc_plus1 = 0;
					end
				endcase
				
			end
		endcase
		
		if (instruction[5:2] ==`NON_CONDITIONAL_JUMP_TYPE_OPCODE) begin
			sel_PCSrc_const = 1;
			sel_RegisterFile_in_alu = 1;
			if (instruction[5:1] == `JSB_OPCODE) push_stack = 1;
		end

		if (instruction[5:0] == `OTHER_TYPE_OPCODE) begin
			pop_stack = 1;
			sel_PCSrc_stack = 1;
		end
			
	end

endmodule // Controller