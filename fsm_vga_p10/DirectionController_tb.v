`timescale 1ns/1ns

module DirectionController_tb;

	reg clk, rstn, turn_right, turn_left;
	wire [3:0] data_out;

	DirectionController dut (
		.clk(clk),
		.rstn(rstn),
		.turn_right(turn_right),
		.turn_left(turn_left),
		.data_out(data_out)
	);

	always #10 clk = ~clk;

	// pulso de 1 ciclo de clock, como o gerado pelo EdgeDetector
	task vira_direita;
	begin
		@(negedge clk) turn_right = 1;
		@(negedge clk) turn_right = 0;
	end
	endtask

	task vira_esquerda;
	begin
		@(negedge clk) turn_left = 1;
		@(negedge clk) turn_left = 0;
	end
	endtask

	initial
	begin
		$monitor("time = %d \t turn_right = %b \t turn_left = %b \t data_out = %b", $time, turn_right, turn_left, data_out);

		// Reset -> Esperado: FRENTE (0011)
		clk = 0;
		turn_right = 0;
		turn_left = 0;
		rstn = 0;
		#25 rstn = 1;

		// Sem comando -> Esperado: continua em FRENTE (0011)
		#40;

		// Direita 4x -> Esperado: BAIXO (1100), TRAS (0001), CIMA (0100), FRENTE (0011)
		vira_direita;
		vira_direita;
		vira_direita;
		vira_direita;

		// Esquerda 4x -> Esperado: CIMA (0100), TRAS (0001), BAIXO (1100), FRENTE (0011)
		vira_esquerda;
		vira_esquerda;
		vira_esquerda;
		vira_esquerda;

		// Reset fora do estado inicial -> Esperado: BAIXO (1100) e depois FRENTE (0011)
		vira_direita;
		#20 rstn = 0;
		#20 rstn = 1;

		#20 $stop; // Encerra a simulação
	end

endmodule
