// Register.v
module Register(clk, rstn, D, Q);
	input wire clk, rstn;
	input wire [3:0] D;
	output reg [3:0] Q;
	
	always@(posedge clk, negedge rstn) 
	begin
		if(rstn == 0)
			Q <= 4'b0000;
		else
			Q <= D;
	end
	
endmodule
