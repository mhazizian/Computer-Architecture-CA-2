module data_path(clk, rst);

  input clk, rst;

	logic cout, sel_ALUScr_reg, sel_ALUScr_const,
		sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1,
		MemRead, MemWrite, sel_RegisterFile_in_alu, 
		sel_RegisterFile_in_memory, RegisterFileWriteEn,
		sel_RegisterFile_in_shifter, sel_RegisterFileReadReg2_rd,
		C_in, C_out, C_in_shifter, C_in_alu, sel_Cin_alu,
		sel_Cin_shifter, sel_PCSrc_stack, push_stack, pop_stack;
	
	logic [18:0] instruction;
	
	logic [11:0] next_pc, current_pc, 
		pc_plus1, pc_plus_offset, stack_out;
			
	logic [7:0] alu_out, alu_in1, alu_in2, register_file_out2, data_memory_out,
		register_file_write_input, shift_out;	
		
	logic [2:0] register_file_reg2_input;	
	logic [3:0] ALU_op;
	
	// Controller
	
	Controller CU(instruction[18:13], C_out , Z_out, ALU_op, 
	
	sel_ALUScr_reg, sel_ALUScr_const,
	
	sel_PCSrc_offset, sel_PCSrc_const, 
	sel_PCSrc_plus1, sel_PCSrc_stack,
	
	MemWrite, MemRead,
	
	sel_RegisterFile_in_alu, 
	sel_RegisterFile_in_memory,
	sel_RegisterFile_in_shifter, 
	sel_RegisterFileReadReg2_rd, 
	
	RegisterFileWriteEn,
	
	sel_Cin_alu, sel_Cin_shifter,

	push_stack, pop_stack);
	
	// Flip flops
	
	register_1 C(clk, rst, C_in, C_out);
	
	register_1 Z(clk, rst, Z_in, Z_out);
	
	mux_3_to_1_1 mux_C(C_in_alu, C_in_shifter, C_out, sel_Cin_alu, sel_Cin_shifter, C_in);
	
	mux_3_to_1_1 mux_Z(Z_in_alu, Z_in_shifter, Z_out, sel_Cin_alu, sel_Cin_shifter, Z_in);
	
	// Stack block
	
	Stack stack(clk, pc_plus1, push_stack, pop_stack, stack_out);	
	
	// PC block
	
	incrementer_12 inc_pc(current_pc, pc_plus1);

	add_sub_12 pc_adder(pc_plus1, instruction[7:0], pc_plus_offset);

	mux_4_to_1_12 mux_pc_source(pc_plus1, instruction[11:0], pc_plus_offset, stack_out, sel_PCSrc_plus1, sel_PCSrc_const, sel_PCSrc_offset, sel_PCSrc_stack, next_pc);
	
	pc_register pc(clk, rst, next_pc, current_pc);	
	
	// Instruction memory
	
	InstructionMemory im(rst, current_pc, instruction);	
	
	// Register file
	
	mux_2_to_1_3 mux_rf_second_source(instruction[13:11], instruction[7:5], sel_RegisterFileReadReg2_rd, register_file_reg2_input);
	
	RegisterFile rf(clk, rst, RegisterFileWriteEn, instruction[10:8], register_file_reg2_input, instruction[13:11], register_file_write_input, alu_in1, register_file_out2);

	// ALU block
	
	mux_2_to_1_8 mux_alu_source(register_file_out2, instruction[7:0], sel_ALUScr_reg, sel_ALUScr_const, alu_in2);

	Alu alu(alu_in1, alu_in2, C_out, ALU_op, alu_out, C_in_alu, Z_in_alu);
		
	// Shifter
		
	shifter shifter_block(alu_in1, instruction[15:14], shift_out, instruction[7:5], C_in_shifter, Z_in_shifter);//, shift_enable);	
	
	// Data Memory block
	
	DataMemory data_memory(clk, rst, alu_out, register_file_out2, MemRead, MemWrite, data_memory_out);

	mux_3_to_1_8 mux_data_memory(data_memory_out, alu_out, shift_out, sel_RegisterFile_in_memory, sel_RegisterFile_in_alu, sel_RegisterFile_in_shifter, register_file_write_input);
	
endmodule
	
	