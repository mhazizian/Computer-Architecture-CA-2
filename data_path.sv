module data_path(clk, rst);

	input clk, rst;
	
	logic [11:0] next_pc, current_pc, pc_plus1, pc_offset, pc_plus_offset;
	logic [18:0] instruction;
	logic [7:0] alu_out, alu_in1, alu_in2, register_file_out2;
	
	logic cin = 1'b0, zero, cout, sel_ALUScr_reg, sel_ALUScr_const,
		sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1;
		
	logic [2:0] ALU_op;
	
	// Controller
	
	Controller controller(instruction[18:13], ALU_op, sel_ALUScr_reg, sel_ALUScr_const, sel_PCSrc_offset, sel_PCSrc_const, sel_PCSrc_plus1);
	
	// PC block
	
	incrementer_12 inc_pc(current_pc, pc_plus1);

	sign_extender s_extender(instruction[7:0], pc_offset);
	
	adder_12(pc_offset, pc_plus1, pc_plus_offset);
	
	mux_3_to_1_12 mux_pc_source(pc_plus1, instruction[11:0], pc_plus_offset, sel_PCSrc_plus1, sel_PCSrc_const, sel_PCSrc_offset, next_pc);

	pc_register pc(clk, rst, next_pc, current_pc);	
	
	// Instruction memory
	
	InstructionMemory im(rst, current_pc, instruction);
	
	// Register file
	
	RegisterFile rf(clk, rst, instruction[10:8],  instruction[7:5], instruction[13:11], alu_out, alu_in1, register_file_out2);

	// ALU block
	
	mux_2_to_1_8 mux_alu_source(register_file_out2, instruction[7:0], sel_ALUScr_reg, sel_ALUScr_const, alu_in2);
	
	Alu alu(alu_in1, alu_in2, cin, instruction[16:14], alu_out, zero, cout);
	
	
	
endmodule
	
	