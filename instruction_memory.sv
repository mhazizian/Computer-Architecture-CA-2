module InstructionMemory(rst, Address, Instruction);

	input [11:0] Address;
	input rst;
	output logic[18:0] Instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		data <= '{default:19'b0};
		Instruction[0] <= 19'b0000000101001100000;
	end

	always @(Address) begin
		Instruction <= ins_memory[Address];
	end

endmodule