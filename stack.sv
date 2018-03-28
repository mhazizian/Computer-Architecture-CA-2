module Stack(address, push, pop, stack_out);

	input[1:0] address;
	input push, pop;
	output logic [1:0] stack_out;

	reg [1:0] stack [0:3];
	logic [1:0] pointer = 2'b0;
	
	always @(push, pop, address) begin	
		if(pop)	begin
			pointer <= pointer - 2'b01;
			stack_out <= stack[pointer];			
		end

		if(push) begin
			stack[pointer] <= address;
			pointer <= pointer + 2'b01;
		end
	end
	
endmodule
	