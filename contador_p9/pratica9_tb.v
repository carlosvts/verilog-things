`timescale 1ns/1ns

module pratica9_tb;

	reg MAX10_CLK1_50;
	reg [1:0] KEY;
	wire [7:0] HEX0, HEX1;

	DE10_LITE_Golden_Top uut (
		.MAX10_CLK1_50(MAX10_CLK1_50),
		.KEY(KEY),
		.HEX0(HEX0),
		.HEX1(HEX1)
	);

	// na simulacao, 1 "segundo" = 10 ciclos de clock (200 ns) em vez de 50_000_000
	defparam uut.div.MOD = 10;

	// clock de 50 MHz
	always #10 MAX10_CLK1_50 = ~MAX10_CLK1_50;

	initial
	begin
		$monitor("time = %d \t count = %d \t HEX1 = %b \t HEX0 = %b", $time, uut.count, HEX1[6:0], HEX0[6:0]);

		// Caso 1: reset pressionado no inicio -> Esperado: 00
		MAX10_CLK1_50 = 0;
		KEY = 2'b10;
		#45 KEY[0] = 1;

		// Caso 2: conta de 00 a 99 e volta para 00 -> 105 "segundos"
		#(200 * 105);

		// Caso 3: reset no meio da contagem -> Esperado: volta para 00
		KEY[0] = 0;
		#40 KEY[0] = 1;
		#(200 * 3);

		$stop; // Encerra a simulação
	end

endmodule
