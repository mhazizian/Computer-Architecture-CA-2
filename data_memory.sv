module DataMemory(clk, rst, Address, WriteData, MemRead, MemWrite, ReadData);

	input [7:0] Address, WriteData;
	input clk, rst, MemRead, MemWrite;
	output logic[7:0] ReadData;

	reg[7:0] data[0:255];

	always @(rst, MemRead, Address) begin
		if (MemRead) ReadData = data[Address];
	end

	always @(posedge clk, rst) begin
		if (rst) begin
			data = '{default:8'b0};

			data[100] = 8'b10000011;
			data[101] = 8'b00010100;

			data[102] = 8'b10100000;
			data[103] = 8'b11100100;

			data[106] = 8'b00010101;
			data[107] = 8'b00010100;
			data[108] = 8'b00011101;
			data[109] = 8'b00010001;
			data[110] = 8'b00010100;
			data[111] = 8'b00110101;
			
			data[112] = 8'b11110101; // Maximum number
			
			data[113] = 8'b00011111;
			data[114] = 8'b00110100;
			data[115] = 8'b01010101;
			data[116] = 8'b01110101;
			data[117] = 8'b01111111;		
			data[118] = 8'b00010111;
			data[119] = 8'b11100000;
			
			data[120] = 8'b11111111;

		end

		if (MemWrite) data[Address] = WriteData;
	end

endmodule