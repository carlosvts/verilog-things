module Counter
	#(
		parameter MOD = 32,
		parameter NUM_BITS = 5
	)
	(
		input wire clk, rstn,
		output reg [NUM_BITS-1:0] count
	);

	always@(posedge clk, negedge rstn)
	begin
		if(!rstn)
			count <= {NUM_BITS{1'b0}};
		else
			count <= (count < MOD)? count + 1'b1 : count;
	end
endmodule 
