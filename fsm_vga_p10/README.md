# Prática 10 - Máquinas de Estados (VGA)

Projeto restaurado do `Pratica10.qar` do professor, com duas alterações:

- `DirectionController.v`: máquina de Moore completada (saídas e transições dos estados F, B, T, C).
- `Square.v`: etapa 3.2 do PDF, linha 26 trocada pela ROM da bola 8x8 e `SQUARE_SIZE = 8`.

`DirectionController_tb.v` é o testbench da máquina de estados (não faz parte do `.qsf`).

Na placa: SW[0] é o reset, KEY[0] vira à direita e KEY[1] vira à esquerda.

## Falta testar no Quartus / ModelSim

- [ ] Abrir `Pratica10.qpf` e compilar.
- [ ] Tools -> Netlist Viewers -> RTL Viewer -> PixGen -> Square -> DirectionController -> `state_reg` e conferir o diagrama de estados.
- [ ] Programar o kit e verificar a bola no monitor VGA.
- [ ] Simular `DirectionController_tb.v` no ModelSim.
