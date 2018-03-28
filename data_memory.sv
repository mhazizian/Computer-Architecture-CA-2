module DataMemory(rst, Address, WriteData, MemRead, MemWrite, ReadData);

	input [7:0] Address, WriteData;
	input rst, MemRead, MemWrite;
	output logic[7:0] ReadData;

	reg[7:0] data[0:255];

	always @(rst, Address, MemRead, MemWrite) begin
		if (rst) data <= '{default:8'b0};
		if (MemRead) ReadData = data[Address];
		if (MemWrite) data[Address] = WriteData;
	end

endmodule