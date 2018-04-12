module InstructionMemory(rst, address, instruction);

	input [11:0] address;
	input rst;
	output logic[18:0] instruction;

	reg[18:0] ins_memory[0:4095];

	always @(posedge rst) begin
		ins_memory <= '{default:19'b0};

/*
		// Program 1
		
		ins_memory[2] 	<= {3'b100, 2'b00, 3'b001, 3'b000, 8'b01100100}; 			// load-memory: R0(100) to R1
		ins_memory[3] 	<= {3'b100, 2'b00, 3'b010, 3'b000, 8'b01100110}; 			// load-memory: R0(102) to R2
		ins_memory[4] 	<= {2'b00, 3'b000, 3'b011, 3'b001, 3'b010, 5'b00110}; 		// R3 = R1 + R2
		ins_memory[5] 	<= {3'b100, 2'b01, 3'b011, 3'b000, 8'b01101000}; 			// save-memory: R3 to R0(104)

		ins_memory[6] 	<= {3'b100, 2'b00, 3'b001, 3'b000, 8'b01100101}; 			// load-memory: R0(101) to R1
		ins_memory[7] 	<= {3'b100, 2'b00, 3'b010, 3'b000, 8'b01100111}; 			// load-memory: R0(103) to R2
		ins_memory[8] 	<= {2'b00, 3'b001, 3'b011, 3'b001, 3'b010, 5'b00110}; 		// R3 = R1 + R2 + ci
		ins_memory[9] 	<= {3'b100, 2'b01, 3'b011, 3'b000, 8'b01101001}; 			// save-memory: R3 to R0(105)


		// Program 2

		ins_memory[1] 	<= {2'b00, 3'b000, 3'b111, 3'b000, 3'b000, 5'b00000}; 		// R7 = R0 + R0
		ins_memory[2] 	<= {2'b00, 3'b000, 3'b001, 3'b000, 3'b000, 5'b00000}; 		// R1 = R0 + R0

		// LOOP 
		ins_memory[3] 	<= {2'b01, 3'b010, 3'b011, 3'b001, 8'b00010100}; 			// R3 = R1 - 20
		ins_memory[4] 	<= {3'b101, 2'b00, 6'b111000, 8'b00000110}; 				// BrachZ is True pc = pc + 1 + 6 (To END)
				
		ins_memory[5] 	<= {3'b100, 2'b00, 3'b010, 3'b001, 8'b01100100}; 			// load-memory: R1(100) to R2
		ins_memory[6] 	<= {2'b00, 3'b010, 3'b011, 3'b111, 3'b010, 5'b10100}; 		// R3 = R7 - R2
		ins_memory[7] 	<= {3'b101, 2'b11, 6'b111000, 8'b00000001}; 				// BrachNC is True pc = pc + 1 + 1 (To L1)
		ins_memory[8] 	<= {2'b00, 3'b000, 3'b111, 3'b010, 3'b000, 5'b00000}; 		// R7 = R2 + R0

		// L1
		ins_memory[9] 	<= {2'b01, 3'b000, 3'b001, 3'b001, 8'b00000001}; 			// R1 = R1 + 1
		ins_memory[10] 	<= {5'b11101, 2'b11, 12'b000000000011}; 					// jump to LOOP

		// END
		ins_memory[11] 	<= 19'b0000000000000000000;
*/
	
		// Bubble Sort
		
		ins_memory[1] 	<= {2'b00, 3'b000, 3'b001, 3'b000, 3'b000, 5'b00000}; 		// R1 = R0 + R0
		
		// First For
		
		ins_memory[2] 	<= {2'b01, 3'b010, 3'b011, 3'b001, 8'b00010100}; 			// R3 = R1 - 20
		ins_memory[3] 	<= {3'b101, 2'b00, 6'b111000, 8'b00001101}; 				// BrachZ is True pc = pc + 1 + 13 (To EXIT_FIRST_FOR)
		
		ins_memory[4] 	<= {2'b00, 3'b000, 3'b010, 3'b001, 3'b000, 5'b00000}; 		// R2 = R1 + R0
		
		// Second For
		
		ins_memory[5] 	<= {2'b01, 3'b010, 3'b011, 3'b010, 8'b00010100}; 			// R3 = R2 - 20
		ins_memory[6] 	<= {3'b101, 2'b00, 6'b111000, 8'b00001000}; 				// BrachZ is True pc = pc + 1 + 8 (To EXIT_SECOND_FOR)
		
		ins_memory[7] 	<= {3'b100, 2'b00, 3'b100, 3'b001, 8'b01100100}; 			// load-memory: R1(100) to R4
		ins_memory[8] 	<= {3'b100, 2'b00, 3'b101, 3'b010, 8'b01100100}; 			// load-memory: R0(100) to R5
		
		ins_memory[9] 	<= {2'b00, 3'b010, 3'b011, 3'b101, 3'b100, 5'b10100}; 		// R3 = R5 - R4
		ins_memory[10] 	<= {3'b101, 2'b11, 6'b111000, 8'b00000010}; 				// BrachNC is True pc = pc + 1 + 2 (To END_IF)
		
		ins_memory[11] 	<= {3'b100, 2'b01, 3'b100, 3'b010, 8'b01100100}; 			// save-memory: R4 to R2(100)
		ins_memory[12] 	<= {3'b100, 2'b01, 3'b101, 3'b001, 8'b01100100}; 			// save-memory: R5 to R1(100)
		
		// END_IF
		
		ins_memory[13] 	<= {2'b01, 3'b000, 3'b010, 3'b010, 8'b00000001}; 			// R2 = R2 + 1
		ins_memory[14] 	<= {5'b11101, 2'b11, 12'b000000000101}; 					// jump to SECOND_FOR
		
		// EXIT_SECOND_FOR
		
		ins_memory[15] 	<= {2'b01, 3'b000, 3'b001, 3'b001, 8'b00000001}; 			// R1 = R1 + 1
		ins_memory[16] 	<= {5'b11101, 2'b11, 12'b000000000010}; 					// jump to FIRST_FOR
		
		// EXIT_FIRST_FOR
		
		ins_memory[17] 	<= 19'b0000000000000000000; 
		
	end

	always @(address) begin
		instruction <= ins_memory[address];
	end

endmodule