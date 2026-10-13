// ALU.v
module ALU (
	input wire [3:0] A, B,
	input wire [3:0] ctrl,
	output reg [3:0] Result,
	output reg Ovr,
	output wire Zero
);
	always@*
	begin
		case(ctrl)
			4'b0000: {Ovr, Result} = A & B;
			4'b0001: {Ovr, Result} = A | B;
			4'b0010: {Ovr, Result} = A + B;
			4'b0110: {Ovr, Result} = A - B;
			4'b0111: {Ovr, Result} = (A < B)? 1: 0;
			4'b1100: {Ovr, Result} = ~(A | B);
			default: {Ovr, Result} = 0; 
		endcase
	end	
	assign Zero = (Result == 0);	
endmodule
