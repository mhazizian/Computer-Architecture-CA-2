module register_1(input clk, rst, ld, d, output logic q);
	always@(posedge clk, posedge rst) begin
		if (ld) q <= d;
		if (rst) q <= 1'b0;
	end
endmodule

module register_8(input clk, rst, ld,input [7:0]d, output logic [7:0]q);
	always@(posedge clk, posedge rst) begin
		if (ld) q <= d;
		if (rst) q <= 8'b0;
	end
endmodule

module register_19(input clk, rst, ld,input [18:0]d, output logic [18:0]q);
	always@(posedge clk, posedge rst) begin
		if (ld) q <= d;
		if (rst) q <= 19'b0;
	end
endmodule