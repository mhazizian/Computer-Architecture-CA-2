module data_path(clk, rst);

	input clk, rst;
	
	logic [11:0] next_pc, current_pc;
	logic [18:0] instruction;
	logic [7:0] alu_out, alu_in1, alu_in2;
	logic cin = 1'b0, zero, cout;
	
	
	incrementer_12 inc_pc(current_pc, next_pc);

	pc_register pc(clk, rst, next_pc, current_pc);
	
	InstructionMemory im(rst, current_pc, instruction);
	
	RegisterFile rf(clk, rst, instruction[10:8],  instruction[7:5], instruction[13:11], alu_out, alu_in1, alu_in2);

	Alu alu(alu_in1, alu_in2, cin, instruction[16:14], alu_out, zero, cout);
	
endmodule
	
	