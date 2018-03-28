module Stack(address, push, pop, stack_out);

	input[1:0] address;
	input push, pop;
	output logic [1:0] stack_out;

	reg [1:0] stack [0:3];
	logic [2:0] pointer = 3'b0;
	
	always @(push, pop, address) begin	
		if(pop)	begin
			stack_out <= stack[pointer];
			pointer <= pointer - 3'b001;
		end

		if(push) begin
			pointer <= pointer + 3'b001;
			stack[pointer] <= address;
		end
	end
	
endmodule
	