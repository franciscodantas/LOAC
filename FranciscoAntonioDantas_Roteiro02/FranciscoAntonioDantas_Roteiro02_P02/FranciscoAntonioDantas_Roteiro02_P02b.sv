// Francisco Antonio Dantas de Sousa
module MUX(
  input logic [3:0] A, B, C, D,
  input logic [1:0] SEL,
  output logic [3:0] SAIDA
);
  always_comb
    /* Esse Case olha o estado do SEL, passando A para a saida caso seja 00 o sinal
    ,B caso seja 01,C caso seja 10 ou D caso seja 11.
    */
    case (SEL)
      2'b00: SAIDA <= A;
      2'b01: SAIDA <= B;
      2'b11: SAIDA <= D;
      2'b10: SAIDA <= C;
    endcase
endmodule