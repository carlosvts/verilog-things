module full_adder(
	input wire a, b, cin,
	output wire s, c
);

	wire w1, w2, w3;

	half_adder ha1 (.a(a), .b(b), .s(w1), .c(w2));
	half_adder ha2 (.a(w1), .b(cin), .s(s), .c(w3));
	
	assign c = w2 | w3;

endmodule 