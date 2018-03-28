module TB_DataMemory();
	logic clk = 1'b0, rst = 1'b0;
	logic[2:0] ReadReg1 = 3'b000, ReadReg2 = 3'b000, WriteReg = 3'b000;
	logic[7:0] WriteData, ReadData1, ReadData2;

	DataMemory DM(clk, rst, ReadReg1, ReadReg2 , WriteReg,
		WriteData, ReadData1, ReadData2);


	initial repeat(100) #50 clk = ~clk;

	initial begin 
		#75
		rst = 1'b1;
		#100
		rst = 1'b0;
		WriteReg = 0;
		WriteData = 10;

		#100
		ReadReg1 = 0;
		ReadReg2 = 1;
		WriteReg = 1;
		WriteData = 1;

		#100
		ReadReg1 = 1;
		ReadReg2 = 2;
		WriteReg = 2;
		WriteData = 2;

		#100
		ReadReg1 = 2;
		ReadReg2 = 3;
		WriteReg = 3;
		WriteData = 3;

		#100
		ReadReg1 = 3;
		ReadReg2 = 4;
		WriteReg = 4;
		WriteData = 4;

		#100
		ReadReg1 = 4;
		ReadReg2 = 5;
		WriteReg = 5;
		WriteData = 5;

		#100
		ReadReg1 = 5;
		ReadReg2 = 6;
		WriteReg = 6;
		WriteData = 6;

		#100
		ReadReg1 = 6;
		ReadReg2 = 0;
		WriteReg = 7;
		WriteData = 7;


	end


endmodule // TB_DataMemory