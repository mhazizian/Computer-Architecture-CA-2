module TB_datapath();
	logic clk = 1'b0, rst = 1'b0;

	data_path dp(clk, rst);

	initial repeat(200) #50 clk = ~clk;

	initial begin 
		#75
		rst = 1'b1;
		#100
		rst = 1'b0;
		
	end

endmodule // TB_datapath