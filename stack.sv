module Stack(address, push, pop, stack_out);

	input[11:0] address;
	input push, pop;
	output logic [11:0] stack_out;

	reg [11:0] stack [0:7];
	logic [2:0] pointer = 3'b0;
	
	assign stack_out = stack[pointer];	
	
	always @(push, pop, address) begin	
		if(pop)	begin
			pointer <= pointer - 3'b01;		
		end

		if(push) begin
			stack[pointer] <= address;
			pointer <= pointer + 3'b01;
		end
	end
	
endmodule
	