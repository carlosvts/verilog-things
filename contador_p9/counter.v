module counter(
	input wire clk, rstn, en,
	output reg [6:0] count
);

	always@(posedge clk, negedge rstn)
	begin
		if(!rstn)
			count <= 7'b0000000;
		else if(en)
			count <= (count < 99) ? count + 1'b1 : 1'b0;
	end

endmodule
