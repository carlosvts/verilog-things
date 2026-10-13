# verilog-things

Atividades de GCC260 - Laboratório de Circuitos Digitais (UFLA), feitas em Verilog para o kit DE10-Lite.

| Pasta | Atividade |
|---|---|
| `full_adder_2508/` | Somador completo |
| `aula_0109/` | Chaves para display de sete segmentos |
| `mini_ula/` | Mini ULA de 4 bits |
| `contador_p9/` | Prática 9 - Circuitos Contadores |
| `fsm_vga_p10/` | Prática 10 - Máquinas de Estados (VGA) |
| `acumulador/` | Prática - Arquitetura Registrador-Acumulador |
| `acumulador_rom/` | Prática - Arquitetura Registrador-Acumulador + Memória ROM |

## O que falta testar no Quartus e no ModelSim

As quatro últimas pastas foram escritas sem Quartus nem ModelSim: nada foi compilado no Quartus nem gravado na placa.
Os testbenches já passaram no Icarus Verilog (o de `acumulador_rom/` com um modelo simples de ROM no lugar do `rom.v` do IP Catalog).
Os `.qsf` de `contador_p9/`, `acumulador/` e `acumulador_rom/` foram escritos à mão a partir do `aula_0109.qsf`.
Os testbenches não fazem parte dos `.qsf`; os valores esperados estão nos comentários de cada um.

### contador_p9

Quartus (`Pratica9.qpf`):

- [ ] Compilar.
- [ ] Conferir no TimeQuest que os falsos caminhos de `KEY*` e `HEX*` do `Pratica9.sdc` foram aplicados.
- [ ] Na placa: HEX1 HEX0 contam de 00 a 99, um por segundo, e voltam para 00.
- [ ] Na placa: KEY[0] zera a contagem a qualquer momento.

ModelSim (`pratica9_tb.v`, usa `MOD = 10` no divisor):

- [ ] `count` vai de 0 a 99 e volta para 0.
- [ ] O reset no meio da contagem volta `count` para 0.

### fsm_vga_p10

Quartus (`Pratica10.qpf`):

- [ ] Compilar.
- [ ] RTL Viewer -> PixGen -> Square -> DirectionController -> `state_reg`: conferir o diagrama de estados com a Figura 2 do PDF.
- [ ] Na placa, com monitor VGA: a bola 8x8 aparece e se move para a direita.
- [ ] Na placa: KEY[0] vira à direita (FRENTE -> BAIXO -> TRÁS -> CIMA), KEY[1] vira à esquerda e SW[0] reseta.

ModelSim (`DirectionController_tb.v`):

- [ ] Após o reset, `data_out` = 0011.
- [ ] Quatro pulsos em `turn_right`: 1100, 0001, 0100, 0011.
- [ ] Quatro pulsos em `turn_left`: 0100, 0001, 1100, 0011.

### acumulador

Quartus (`PraticaAcumulador.qpf`):

- [ ] Compilar.
- [ ] RTL Viewer: conferir com a Figura 1 do PDF.
- [ ] Na placa: valor em SW[3:0], operação em SW[9:6]; ao pressionar KEY[0] o valor aparece em HEX1 e ao soltar o resultado aparece em HEX0.
- [ ] Na placa: testar soma (0010), subtração (0110), AND (0000), OR (0001), menor que (0111) e NOR (1100).
- [ ] Na placa: com KEY[0] pressionado, LEDR[1] acende no estouro e LEDR[0] acende com resultado zero.
      Ao soltar, o RegA muda e a ALU recalcula, então os LEDs passam a mostrar a conta seguinte.
- [ ] Na placa: KEY[1] zera os dois displays.

ModelSim (`acumulador_tb.v`):

- [ ] `A` segue a sequência 5, 8, 6, 2, 14, 1, 1, 8, 0.

### acumulador_rom

Quartus (`PraticaAcumuladorROM.qpf`), **o projeto não compila até o primeiro item ser feito**:

- [ ] Criar a memória pelo IP Catalog (Seção 3 do PDF): ROM: 1-PORT, nome `rom`, Verilog, 12 bits x 32 palavras,
      single clock, saída `q` não registrada, arquivo de inicialização `prog.mif`. Adicionar o `rom.qip` ao projeto.
- [ ] Assignments -> Device -> Device and Pin Options -> Configuration -> Configuration mode:
      Single Uncompressed Image with Memory Initialization (512 Kbits UFM).
- [ ] Compilar.
- [ ] RTL Viewer: conferir com a Figura 16 do PDF.
- [ ] Na placa: KEY[1] reseta e cada toque em KEY[0] executa um passo; HEX3 HEX2 mostram os valores lidos da ROM.
- [ ] Na placa: HEX1 HEX0 mostram 60 no 11º toque e a média **06** no 12º (no 13º voltam para 00).

ModelSim (`acumulador_rom_tb.v`, precisa do `rom.v` gerado e da biblioteca `altera_mf`):

- [ ] `A` segue a sequência 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 60, 6.
