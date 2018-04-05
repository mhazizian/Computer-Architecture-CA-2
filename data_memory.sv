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
			data[103] = 8'b01100100;
		end

		if (MemWrite) data[Address] = WriteData;
	end

endmodule