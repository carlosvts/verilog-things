# Prática 9 - Circuitos Contadores

Contador de segundos de 00 a 99 em HEX1/HEX0, com reset em KEY[0].

- `DE10_LITE_Golden_Top.v`: instancia os componentes (sincronizador -> divisor -> contador -> displays).
- `counter.v`, `divisor.v`, `SEG7_LUT.v`, `AsyncInputSynchronizer.v`, `Pratica9.sdc`: arquivos do professor.
  O sincronizador vem do GitHub como `InputSynchronizer`; foi renomeado para `AsyncInputSynchronizer`, como no PDF.
- `pratica9_tb.v`: testbench (usa `MOD = 10` no divisor para a simulação ser rápida).

## Falta testar no Quartus / ModelSim

- [ ] Abrir `Pratica9.qpf` e compilar (o `.qsf` foi escrito à mão a partir do `aula_0109.qsf`).
- [ ] Conferir no TimeQuest que os falsos caminhos de `KEY*` e `HEX*` do `Pratica9.sdc` foram aplicados.
- [ ] Programar o kit e verificar a contagem e o reset.
- [ ] Simular `pratica9_tb.v` no ModelSim.
