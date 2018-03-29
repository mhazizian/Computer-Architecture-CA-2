module register_1(clk, rst, d, q);

	input clk, rst, d;
	output logic q;
	
	always@(posedge clk, posedge rst) begin
		q <= d;
		if (rst) q <= 1'b0;
	end
endmodule
///////////////// Edited
module register_8(clk, rst, ld, d, q);

	input clk, rst, ld;
	input [7:0]d;
	output logic [7:0]q;

	always@(posedge clk, posedge rst) begin
		if (ld) q <= d;
		if (rst) q <= 1;
	end
endmodule

module pc_register(clk, rst, d, q);

	input clk, rst;
	input [11:0]d;
	output logic [11:0]q;

	always@(negedge clk, posedge rst) begin
		if (rst) q <= 11'b0;
		else q <= d;
	end
endmodule

module register_19(clk, rst, ld, d, q);

	input clk, rst, ld;
	input [18:0]d;
	output logic [18:0]q;

	always@(posedge clk, posedge rst) begin
		if (ld) q <= d;
		if (rst) q <= 19'b0;
	end
endmodule