`timescale 1ns/1ns

module tb_stack();
	
	logic[1:0] address = 2'b10, stack_out;
	logic push = 1'b0, pop = 1'b0;
	
	Stack uut(address, push, pop, stack_out);
	
	initial #1500 $stop;
	
	initial begin
		#100
		push = 1'b1;
		#200
		address = 2'b01;
		#200
		push = 1'b0;
		#100
		pop = 1'b1;
		#200
		pop = 1'b0;
		#200
		pop = 1'b1;
	end

endmodule