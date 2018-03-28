module InstructionMemory(rst, address, instruction);

	input [11:0] address;
	input rst;
	output logic[18:0] instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		ins_memory <= '{default:19'b0};

		ins_memory[1] <= 19'b0000000100101000000;
		ins_memory[1] <= 19'b0000000100101000000;
		ins_memory[1] <= 19'b0000000100101000000;
		ins_memory[1] <= 19'b0000000100101000000;
		ins_memory[1] <= 19'b0000000100101000000;
		ins_memory[1] <= 19'b0000000100101000000;
		ins_memory[1] <= 19'b0000000100101000000;
		ins_memory[1] <= 19'b0000000100101000000;
	end

	always @(address) begin
		instruction <= ins_memory[address];
	end

endmodule