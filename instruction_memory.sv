module InstructionMemory(rst, address, instruction);

	input [11:0] address;
	input rst;
	output logic[18:0] instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		ins_memory <= '{default:19'b0};

		// // Register type and Immediate type commands
		
		// ins_memory[2] <= 19'b0000001101000101111; // R3 = R2 + R1		// R3 = 2
		// ins_memory[3] <= 19'b0100110001100000101; // R4 = R3 + 5		// R4 = 7
		// ins_memory[4] <= 19'b0001010110000100100; // R5 = R4 - R1		// R5 = 6
		// ins_memory[5] <= 19'b0101111010100000010; // R6 = R5 - 2		// R6 = 4
		// ins_memory[6] <= 19'b0010011110001100100; // R7 = R4 & R3		// R7 = 2
		// ins_memory[7] <= 19'b0010111011001100100; // R6 = R6 + R3		// R6 = 6
		// ins_memory[8] <= 19'b0011001101111101111; // R3 = R3 ^ R7		// R3 = 0
		// ins_memory[9] <= 19'b0011110010000000100; // R4 = ~(R4 & R0)	// R4 = 255
		// ins_memory[10] <= 19'b0011000110011000000; // R1 = R4 ^ R6		// R1 = 249
		
		// // Shifter commands
		
		// ins_memory[11] <= 19'b1100001000101100000; // R2 = 11001000
		// ins_memory[12] <= 19'b1100101101001100000; // R3 = 00011001
		// ins_memory[13] <= 19'b1101010100101100000; // R5 = 11001111
		// ins_memory[14] <= 19'b1101111000101100000; // R6 = 00111111
		
		// //	Conditional jump command
		
		// ins_memory[20] <= {3'b100, 2'b01, 3'b011, 3'b000, 8'b00001010}; // save-memory: R3(10) to R1
		// ins_memory[23] <= {3'b100, 2'b00, 3'b111, 3'b000, 8'b00001010}; // load-memory: R3(10) to R1
		
		// // Branch Z command
		
		// ins_memory[25] <= {3'b101, 2'b00, 3'b111, 3'b000, 8'b00000011}; // BrachZ is True pc = pc + 1 + 3

		// // Branch C command
		
		// ins_memory[29] <= {2'b01, 3'b000, 3'b010, 3'b110, 8'b11111111}; // 		
		// ins_memory[30] <= {3'b101, 2'b10, 3'b111, 3'b000, 8'b00000011}; // BrachZ is True pc = pc + 1 + 3

		// ins_memory[40] <= {5'b11101, 2'b11, 12'b000000101101}; // JSB to 45
		// ins_memory[41] <= {3'b101, 2'b10, 3'b111, 3'b000, 8'b00001010}; // BrachC is True pc = pc + 1 + 3
		// ins_memory[45] <= {6'b111100, 13'b0000101000000}; // RET to 41



		// Program 1
		
		ins_memory[2] <= {3'b100, 2'b00, 3'b001, 3'b000, 8'b01100100}; // load-memory: R0(100) to R1
		ins_memory[3] <= {3'b100, 2'b00, 3'b010, 3'b000, 8'b01100110}; // load-memory: R0(102) to R2
		ins_memory[4] <= {2'b00, 3'b000, 3'b011, 3'b001, 3'b010, 5'b00110}; // R3 = R1 + R2
		ins_memory[5] <= {3'b100, 2'b01, 3'b011, 3'b000, 8'b01101000}; // save-memory: R3 to R0(104)

		ins_memory[6] <= {3'b100, 2'b00, 3'b001, 3'b000, 8'b01100101}; // load-memory: R0(101) to R1
		ins_memory[7] <= {3'b100, 2'b00, 3'b010, 3'b000, 8'b01100111}; // load-memory: R0(103) to R2
		ins_memory[8] <= {2'b00, 3'b001, 3'b011, 3'b001, 3'b010, 5'b00110}; // R3 = R1 + R2 + ci
		ins_memory[9] <= {3'b100, 2'b01, 3'b011, 3'b000, 8'b01101001}; // save-memory: R3 to R0(105)


		// Program 2
/*		
		ins_memory[0] = 19'b0000011100000000000;  
		ins_memory[1] = 19'b0000000100000000000;  
		ins_memory[2] = 19'b0101001100100010100;  
		ins_memory[3] = 19'b1010000000000000110;  
		ins_memory[4] = 19'b1000001000101100100;  
		ins_memory[5] = 19'b0001001111101000000; 
		ins_memory[6] = 19'b1011100000000000001;  
		ins_memory[7] = 19'b0000011101000000000;  
		ins_memory[8] = 19'b0100000100100000001;  
		ins_memory[9] = 19'b1110000000000000010;  
		ins_memory[10] = 19'b0000000000000000000;  
		ins_memory[11] = 19'b0000000000000000000;  
		ins_memory[12] = 19'b0000000000000000000;  
		ins_memory[13] = 19'b0000000000000000000;  
		ins_memory[14] = 19'b0000000000000000000;  
		ins_memory[15] = 19'b0000000000000000000;  
*/		
	end

	always @(address) begin
		instruction <= ins_memory[address];
	end

endmodule