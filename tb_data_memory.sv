module TB_DataMemory();
	logic rst = 1'b0, MemRead = 1'b0, MemWrite = 1'b0;
	logic [7:0] Address, WriteData, ReadData;

	DataMemory DM(rst, Address, WriteData, MemRead, MemWrite, ReadData);


	initial begin 
		#10
		rst = 1'b1;
		#10
		rst = 1'b0;
		Address = 20;
		MemRead = 1'b1;
		#10
		Address = 0;
		MemRead = 1'b1;
		#10
		Address = 8'b11111111;
		MemRead = 1'b1;
		#10
		Address = 120;
		MemRead = 1'b1;
		# 10
		MemRead = 1'b0;
		MemWrite = 1'b1;
		WriteData = 123;
		#10
		Address = 0;
		MemRead = 1'b1;
		MemWrite = 1'b0;
		#10
		MemRead = 1'b0;

	end


endmodule // TB_DataMemory