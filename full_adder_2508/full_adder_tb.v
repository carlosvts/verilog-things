`timescale 1ns/100ps

module full_adder_tb;

	reg a, b, cin;
	wire s, c;
	
	full_adder dut(.a(a), .b(b), .cin(cin), .s(s), .c(c));
	
	initial
	begin
		$monitor("time = %d \t a = %b \t b = %b \t cin = %b \t s = %b \t c = %b", $time, a, b, cin, s, c);
		
		a = 0;
		b = 0;
		cin = 0;
		#10 a = 1;
		#10 b = 1;
		#10 cin = 1;
		#10 $stop;
	end

endmodule 