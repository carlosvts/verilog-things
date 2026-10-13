# Prática - Arquitetura Registrador-Acumulador + Memória ROM

Processador de 8 bits da Figura 16: o contador endereça a ROM 32x12, que fornece a operação (bits 11..8)
e o valor de B (bits 7..0). O programa em `prog.mif` soma dez números e divide por 10.

- `DE10_LITE_Golden_Top.v`: ligações da Figura 16 (já instancia `rom`, com as portas `address`, `clock` e `q`).
- `prog.mif`: conteúdo da Figura 5.
- `Register.v`, `ALU.v`, `Counter.v`, `SEG7_LUT.v`: arquivos do GitHub do professor, sem alteração.
- `acumulador_rom_tb.v`: testbench.

Na placa: KEY[1] é o reset e cada toque em KEY[0] executa um passo. HEX1 HEX0 = RegA e HEX3 HEX2 = RegB, em decimal.
A instrução do endereço n é executada no toque n + 2, então o resultado **06** aparece no 12º toque
(antes disso, 60). No 13º a ROM entrega `000000000000` (AND com 0) e o acumulador volta para 00.

## Falta fazer e testar no Quartus / ModelSim

O `rom.v` é gerado pelo Quartus, então o projeto **não compila** até o primeiro item ser feito:

- [ ] Abrir `PraticaAcumuladorROM.qpf` e criar a memória pelo IP Catalog (Seção 3 do PDF, Figuras 6 a 13):
      ROM: 1-PORT, nome `rom`, Verilog, 12 bits x 32 palavras, single clock, saída `q` não registrada,
      arquivo de inicialização `prog.mif`. Aceitar quando o Quartus oferecer adicionar o `rom.qip` ao projeto.
- [ ] Assignments -> Device -> Device and Pin Options -> Configuration -> Configuration mode:
      **Single Uncompressed Image with Memory Initialization (512 Kbits UFM)** (Figuras 14 e 15).
- [ ] Compilar e conferir o circuito no RTL Viewer.
- [ ] Programar o kit e verificar o resultado.
- [ ] Simular `acumulador_rom_tb.v` no ModelSim (precisa do `rom.v` gerado e da biblioteca `altera_mf`).
