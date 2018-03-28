module InstructionMemory(rst, address, instruction);

	input [11:0] address;
	input rst;
	output logic[18:0] instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		ins_memory <= '{default:19'b0};

		ins_memory[2] <= 19'b0100000100000001111;
		ins_memory[3] <= 19'b1000101100101100100;
		ins_memory[4] <= 19'b1000001101001100100;
		
	end

	always @(address) begin
		instruction <= ins_memory[address];
	end

endmodule