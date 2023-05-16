// Francisco Antonio Dantas de Sousa
module elevator(
  input logic M, A1, A2, A3,
  output logic P
);

// IMPLEMENTAÇÃO DA LOGICA DO PROBLEMA, PORTA ABRE SE NÃO ESTIVER EM MOVIMENTO E EM ALGUM ANDAR.
  always_comb P <= ~M & (A1 | A2 | A3);
endmodule
