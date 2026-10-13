// Register.v
module Register(
	input wire clk, rstn,
	input wire [7:0] D,
	output reg [7:0] Q
);
	
	always@(posedge clk, negedge rstn) 
	begin
		if(rstn == 0)
			Q <= 8'b00000000;
		else
			Q <= D;
	end
	
endmodule
