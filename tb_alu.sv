`include "defines.sv"

module tb_alu();

	logic [7:0] alu_in1 = 8'b01010101, alu_in2 = 8'b00001111, alu_out;
	logic [2:0] opcode = `ADDC_FN;
	logic C = 1'b1, Z;

	Alu uut(alu_in1, alu_in2, C, opcode, alu_out, Z);
	
	initial #1800 $stop;
	
	initial begin
		opcode = `ADD_FN;
		#200
		opcode = `ADDC_FN;
		#200
		opcode = `SUB_FN;
		#200
		opcode = `SUBC_FN;
		#200
		opcode = `AND_FN;
		#200
		opcode = `OR_FN;
		#200
		opcode = `XOR_FN;
		#200
		opcode = `MASK_FN;
	end
	
endmodule