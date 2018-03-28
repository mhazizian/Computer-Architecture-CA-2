module InstructionMemory(rst, address, instruction);

	input [11:0] address;
	input rst;
	output logic[18:0] instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		ins_memory <= '{default:19'b0};


		ins_memory[2] <= 19'b0100000100000001010;
		ins_memory[3] <= 19'b0101001000100000101;
		ins_memory[4] <= 19'b0111001100000010001;
		ins_memory[5] <= 19'b0010110001000101010;
		ins_memory[6] <= 19'b0110110100100000101;
	end

	always @(address) begin
		instruction <= ins_memory[address];
	end

endmodule