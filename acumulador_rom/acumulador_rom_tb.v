`timescale 1ns/1ns

// Precisa do rom.v gerado pelo IP Catalog e da biblioteca altera_mf no ModelSim
module acumulador_rom_tb;

	reg [1:0] KEY;
	wire [9:0] LEDR;
	wire [7:0] HEX0, HEX1, HEX2, HEX3;

	DE10_LITE_Golden_Top uut (
		.KEY(KEY),
		.LEDR(LEDR),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3)
	);

	initial
	begin
		$monitor("time = %d \t KEY = %b \t address = %d \t q = %b \t ctrl = %b \t A = %d \t B = %d", $time, KEY, uut.address, uut.q, uut.ctrl[3:0], uut.A, uut.B);

		// Reset (KEY[1]) -> Esperado: A = 0, B = 0, address = 0
		KEY = 2'b11;
		#10 KEY[1] = 0;
		#10 KEY[1] = 1;

		// 12 pulsos em KEY[0]: a instrucao do endereco n e executada no pulso n + 2
		// Esperado em A: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 60 e por fim 60 / 10 = 6
		repeat (12)
		begin
			#10 KEY[0] = 0;
			#10 KEY[0] = 1;
		end

		#10 $stop; // Encerra a simulação
	end

endmodule
