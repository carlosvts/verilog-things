# Prática - Arquitetura Registrador-Acumulador

Processador de 4 bits da Figura 1: RegB carrega SW[3:0] ao pressionar KEY[0], RegA (acumulador)
carrega o resultado da ALU ao soltar. KEY[1] é o reset, SW[9:6] é a operação, HEX0 = RegA, HEX1 = RegB,
LEDR[1] = Ovr, LEDR[0] = Zero.

- `DE10_LITE_Golden_Top.v`: ligações da Figura 1.
- `Register.v`, `ALU.v`, `SEG7_LUT.v`: arquivos do professor, sem alteração.
- `acumulador_tb.v`: testbench.

## Falta testar no Quartus / ModelSim

- [ ] Abrir `PraticaAcumulador.qpf` e compilar (o `.qsf` foi escrito à mão a partir do `aula_0109.qsf`).
- [ ] Conferir o circuito no RTL Viewer.
- [ ] Programar o kit e testar soma, subtração etc.
- [ ] Simular `acumulador_tb.v` no ModelSim.
