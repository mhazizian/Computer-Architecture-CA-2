module data_path(clk, rst);

	input clk, rst;
	
	logic [11:0] next_pc, current_pc;
	logic [18:0] instruction;
	logic [7:0] alu_out, alu_in1, alu_in2, register_file_out2;
	logic cin = 1'b0, zero, cout, sel_ALUScr_reg, sel_ALUScr_const;
	logic [2:0] ALU_op;
	
	Controller controller(instruction[18:13], ALU_op, sel_ALUScr_reg, sel_ALUScr_const);
	
	incrementer_12 inc_pc(current_pc, next_pc);

	pc_register pc(clk, rst, next_pc, current_pc);
	
	InstructionMemory im(rst, current_pc, instruction);
	
	RegisterFile rf(clk, rst, instruction[10:8],  instruction[7:5], instruction[13:11], alu_out, alu_in1, register_file_out2);

	mux_2_to_1_8 mux_alu_source(register_file_out2, instruction[7:0], sel_ALUScr_reg, sel_ALUScr_const, alu_in2);
	
	Alu alu(alu_in1, alu_in2, cin, instruction[16:14], alu_out, zero, cout);
	
endmodule
	
	