`include "defines.sv"

module DataMemory(input clk, rst,
	input[2:0] ReadReg1, ReadReg2 , WriteReg,
	input [7:0] WriteData,
	output logic [7:0]ReadData1, ReadData2);

	logic [7:0] q0, q1, q2, q3, q4, q5, q6, q7;
	logic ld0, ld1, ld2, ld3, ld4, ld5, ld7, ld7;

	register_8 r0(clk, rst, ld0, 8'b0, q0);
	register_8 r1(clk, rst, ld1, WriteData, q1);
	register_8 r2(clk, rst, ld2, WriteData, q2);
	register_8 r3(clk, rst, ld3, WriteData, q3);
	register_8 r4(clk, rst, ld4, WriteData, q4);
	register_8 r5(clk, rst, ld5, WriteData, q5);
	register_8 r6(clk, rst, ld6, WriteData, q6);
	register_8 r7(clk, rst, ld7, WriteData, q7);

	assign ReadData1 = (ReadReg1 == `R0) ? q0 :
					   (ReadReg1 == `R1) ? q1 :
					   (ReadReg1 == `R2) ? q2 :
					   (ReadReg1 == `R3) ? q3 :
					   (ReadReg1 == `R4) ? q4 :
					   (ReadReg1 == `R5) ? q5 :
					   (ReadReg1 == `R6) ? q6 : q7;

	assign ReadData2 = (ReadReg2 == `R0) ? q0 :
					   (ReadReg2 == `R1) ? q1 :
					   (ReadReg2 == `R2) ? q2 :
					   (ReadReg2 == `R3) ? q3 :
					   (ReadReg2 == `R4) ? q4 :
					   (ReadReg2 == `R5) ? q5 :
					   (ReadReg2 == `R6) ? q6 : q7;

	case (WriteReg)
		`R0 : ld0 = 1`b1;
		`R1 : ld1 = 1`b1;
		`R2 : ld2 = 1`b1;
		`R3 : ld3 = 1`b1;
		`R4 : ld4 = 1`b1;
		`R5 : ld5 = 1`b1;
		`R6 : ld6 = 1`b1;
		`R7 : ld7 = 1`b1;
	endcase // WriteReg 


	always@(posedge rst) begin
		ld0 = 0; ld1 = 0; ld2 = 0; ld3 = 0;
		ld4 = 0; ld5 = 0; ld6 = 0; ld7 = 0;
	end

endmodule

