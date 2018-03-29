module data_path(clk, rst);

	input clk, rst;
	
	logic [11:0] next_pc, current_pc, pc_plus1, pc_offset, pc_plus_offset;
	logic [18:0] instruction;
	
	logic [7:0] alu_out, alu_in1, alu_in2, register_file_out2, data_memory_out,
				register_file_write_input, shift_out;
	
	logic cout, sel_ALUScr_reg, sel_ALUScr_const,
				sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1, MemRead, MemWrite,
				sel_RegisterFile_in_alu, sel_RegisterFile_in_memory, RegisterFileWriteEn,
				sel_RegisterFileWriteDst_r2, sel_RegisterFile_in_shifter, sel_RegisterFileReadReg2_rd,
				C_in, C_out, C_in_shifter, C_in_alu, sel_Cin_alu, sel_Cin_shifter;
		
	logic [2:0] ALU_op, register_file_reg2_input;
	
	// Flip flops
	
	mux_3_to_1_1 mux_C(C_in_alu, C_in_shifter, C_out, sel_Cin_alu, sel_Cin_shifter, C_in);
	
	register_1 C(clk, rst, C_in, C_out);
	
	// Controller

	Controller controller(instruction[18:13], C_out, Z_out, ALU_op, sel_ALUScr_reg, sel_ALUScr_const,
	sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1, MemWrite, MemRead,
	sel_RegisterFile_in_alu, sel_RegisterFile_in_memory, RegisterFileWriteEn,
	sel_RegisterFile_in_shifter, sel_RegisterFileReadReg2_rd, sel_Cin_alu, sel_Cin_shifter);
	
	// Sign enxtender
	
	sign_extender s_extender(instruction[7:0], pc_offset);
	
	
	
	// PC block
	
	incrementer_12 inc_pc(current_pc, pc_plus1);
	
	adder_12 pc_adder(pc_offset, pc_plus1, pc_plus_offset);
	
	mux_3_to_1_12 mux_pc_source(pc_plus1, instruction[11:0], pc_plus_offset, sel_PCSrc_plus1, sel_PCSrc_const, sel_PCSrc_offset, next_pc);

	pc_register pc(clk, rst, next_pc, current_pc);	
	
	
	
	// Instruction memory
	
	InstructionMemory im(rst, current_pc, instruction);
	
	
	
	// Register file
	
//	mux_2_to_1_3 mux_rf_write_source(instruction[10:8], instruction[13:11], sel_RegisterFileWriteDst_r2, register_file_write_dst);
	
	mux_2_to_1_3 mux_rf_second_source(instruction[13:11], instruction[7:5], sel_RegisterFileReadReg2_rd, register_file_reg2_input);
	
	RegisterFile rf(clk, rst, RegisterFileWriteEn, instruction[10:8], register_file_reg2_input, instruction[13:11], register_file_write_input, alu_in1, register_file_out2);

	
	
	// ALU block
	
	mux_2_to_1_8 mux_alu_source(register_file_out2, instruction[7:0], sel_ALUScr_reg, sel_ALUScr_const, alu_in2);
	
//	Alu alu(alu_in1, alu_in2, cin, instruction[16:14], alu_out, Z, cout);

	Alu alu(alu_in1, alu_in2, C_out, instruction[16:14], alu_out, C_in_alu, Z_in_alu);
	
	
	
	// Shifter
		
	shifter shifter_block(alu_in1, instruction[15:14], shift_out, instruction[7:5], C_in_shifter, Z_in_shifter);//, shift_enable);

//  shift_out added
	
	
	
	// Data Memory block
	
	DataMemory data_memory(rst, alu_out, register_file_out2, MemRead, MemWrite, data_memory_out);

	mux_3_to_1_8 mux_data_memory(data_memory_out, alu_out, shift_out, sel_RegisterFile_in_memory, sel_RegisterFile_in_alu, sel_RegisterFile_in_shifter, register_file_write_input);


	// Z flip flop
	
	register_1 Z(clk, rst, Z_in, Z_out);
	
	mux_3_to_1_1 mux_Z(Z_in_alu, Z_in_shifter, Z_out, sel_Cin_alu, sel_Cin_shifter, Z_in);

	
endmodule
	
	