module InstructionMemory(rst, address, instruction);

	input [11:0] address;
	input rst;
	output logic[18:0] instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		ins_memory <= '{default:19'b0};

		// Register type and Immediate type commands
		
		ins_memory[2] <= 19'b0000001101000101111; // R3 = R2 + R1		// R3 = 2
		ins_memory[3] <= 19'b0100110001100000101; // R4 = R3 + 5		// R4 = 7
		ins_memory[4] <= 19'b0001010110000100100; // R5 = R4 - R1		// R5 = 6
		ins_memory[5] <= 19'b0101111010100000010; // R6 = R5 - 2		// R6 = 4
		ins_memory[6] <= 19'b0010011110001100100; // R7 = R4 & R3		// R7 = 2
		ins_memory[7] <= 19'b0010111011001100100; // R6 = R6 + R3		// R6 = 6
		ins_memory[8] <= 19'b0011001101111101111; // R3 = R3 ^ R7		// R3 = 0
		ins_memory[9] <= 19'b0011110010000000100; // R4 = ~(R4 & R0)	// R4 = 255
		
		//	Conditional jump command
		
		ins_memory[10] <= 19'b1110000000000001111; // pc = 15
		ins_memory[15] <= 19'b0011000110011000000; // R1 = R4 ^ R6		// R1 = 249
		
	end

	always @(address) begin
		instruction <= ins_memory[address];
	end

endmodule