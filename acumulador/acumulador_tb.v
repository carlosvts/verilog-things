`timescale 1ns/1ns

module acumulador_tb;

	reg [1:0] KEY;
	reg [9:0] SW;
	wire [9:0] LEDR;
	wire [7:0] HEX0, HEX1;

	DE10_LITE_Golden_Top uut (
		.KEY(KEY),
		.SW(SW),
		.LEDR(LEDR),
		.HEX0(HEX0),
		.HEX1(HEX1)
	);

	// coloca a operacao em SW[9:6] e o valor de B em SW[3:0],
	// pressiona KEY[0] (RegB carrega) e solta (RegA carrega o resultado)
	task opera;
		input [3:0] ctrl;
		input [3:0] b;
	begin
		SW = {ctrl, 2'b00, b};
		#10 KEY[0] = 0;
		#10 KEY[0] = 1;
		#10;
	end
	endtask

	initial
	begin
		$monitor("time = %d \t KEY = %b \t ctrl = %b \t A = %d \t B = %d \t Ovr = %b \t Zero = %b", $time, KEY, SW[9:6], uut.A, uut.B, LEDR[1], LEDR[0]);

		// Reset (KEY[1]) -> Esperado: A = 0, B = 0
		KEY = 2'b11;
		SW = 10'b0;
		#10 KEY[1] = 0;
		#10 KEY[1] = 1;

		// Caso 1: Soma (0010) -> A = 0, B = 5 -> Esperado: A = 5
		opera(4'b0010, 4'd5);

		// Caso 2: Soma (0010) -> A = 5, B = 3 -> Esperado: A = 8
		opera(4'b0010, 4'd3);

		// Caso 3: Subtracao (0110) -> A = 8, B = 2 -> Esperado: A = 6
		opera(4'b0110, 4'd2);

		// Caso 4: AND (0000) -> A = 6 (0110), B = 3 (0011) -> Esperado: A = 2 (0010)
		opera(4'b0000, 4'd3);

		// Caso 5: OR (0001) -> A = 2 (0010), B = 12 (1100) -> Esperado: A = 14 (1110)
		opera(4'b0001, 4'd12);

		// Caso 6: Soma com estouro -> A = 14, B = 3 -> Esperado: A = 1 e Ovr = 1 enquanto KEY[0] pressionado
		opera(4'b0010, 4'd3);

		// Caso 7: Menor que (0111) -> A = 1, B = 9 -> Esperado: A = 1
		opera(4'b0111, 4'd9);

		// Caso 8: NOR (1100) -> A = 1 (0001), B = 6 (0110) -> Esperado: A = 8 (1000)
		opera(4'b1100, 4'd6);

		// Caso 9: Subtracao (0110) -> A = 8, B = 8 -> Esperado: A = 0 e Zero = 1
		opera(4'b0110, 4'd8);

		$stop; // Encerra a simulação
	end

endmodule
