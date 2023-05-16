// Francisco Antonio Dantas de Sousa
module Umidade(
  input logic [1:0] U,
  output logic [1:0]SAIDA,
  output logic a,b,c,d,e,f,g
);
  always_comb
    begin
      /* Esse caso representa a saida, sem o display a Saida = U */
      SAIDA <= U;
      
      /*
      Nessa Parte é feito a representação da saida se fosse um display de 7 segmentos.
      */
      a <= U[0];
      b <= U[1] | U[0];
      c <= U[1] ^ U[0];
      d <= U[0];
      e <= U[0];
      g <= U[1] & U[0];
      f <= U[0] & ~U[1];
    end
endmodule