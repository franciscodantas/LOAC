// Francisco Antonio Dantas de Sousa

parameter NBITS = 4;
module circuit2(
  input logic clk,reset,Entrada_paralela,
  output logic [NBITS-1:0] Saida
);
  
  // Gera a sequencia 1 -> 2 -> 4 -> 8 e repete
  always_ff @ (posedge clk) begin
    if(reset)
      Saida <= 0;
    else if(Entrada_paralela)
      Saida <= 1;
    else
      // Quando a saida é 1000 acontece o reset para 0001.
      if(Saida[NBITS-1]) Saida <= 1;
    // Desloca os bits para a esquerda.
    else Saida <= Saida << 1;
  end
endmodule