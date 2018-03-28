module InstructionMemory(rst, address, instruction);

	input [11:0] address;
	input rst;
	output logic[18:0] instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		ins_memory <= '{default:19'b0};
		ins_memory[0] <= 19'b0000000101001100000;
		
		ins_memory[1] <= 19'b0000000100101100000;
		ins_memory[2] <= 19'b0000011100111000000;
		ins_memory[3] <= 19'b0010001000101100000;
		ins_memory[4] <= 19'b0011010000111100000;

		ins_memory[7] <= 19'b000001011010000000;



		ins_memory[9] <= 19'b0001011011101000000;
	end

	always @(address) begin
		instruction <= ins_memory[address];
	end

endmodule