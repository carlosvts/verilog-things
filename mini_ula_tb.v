`timescale 1ns/1ns

module tb_ula_4bit();

    reg [9:0] SW;
    wire [3:0] LEDR;
    wire [6:0] HEX0;

    // Instancia o módulo principal (DUT - Device Under Test)
    DE10_LITE_Golden_Top uut (
        .SW(SW),
        .LEDR(LEDR),
        .HEX0(HEX0)
    );

    initial begin
        // Caso 1: Soma (00) -> A = 5 (0101), B = 3 (0011) -> Esperado: 8 (1000)
        SW = {2'b00, 4'b0011, 4'b0101}; 
        #20;

        // Caso 2: AND (01) -> A = 5 (0101), B = 3 (0011) -> Esperado: 1 (0001)
        SW = {2'b01, 4'b0011, 4'b0101}; 
        #20;

        // Caso 3: OR (10) -> A = 5 (0101), B = 3 (0011) -> Esperado: 7 (0111)
        SW = {2'b10, 4'b0011, 4'b0101}; 
        #20;

        // Caso 4: XOR (11) -> A = 5 (0101), B = 3 (0011) -> Esperado: 6 (0110)
        SW = {2'b11, 4'b0011, 4'b0101}; 
        #20;

        // Caso 5: Soma com estouro (Overflow) -> A = 15 (1111), B = 2 (0010) -> Esperado: 1 (0001)
        SW = {2'b00, 4'b0010, 4'b1111}; 
        #20;

        $stop; // Encerra a simulação
    end

endmodule