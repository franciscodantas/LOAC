// Francisco Antonio Dantas de Sousa

parameter NBITS = 4;

module contador (
  input logic clk, reset, Entrada_de_Selecao,
  output logic [NBITS-1:0] Saida
);
  
  
  always_ff @(posedge clk) begin
    if (reset) begin
      // reseta para zero em caso de contagem crescente Entrada_de_Selecao = 1
      if (Entrada_de_Selecao)
        Saida <= 0;
      // reseta para o maximo quando a contagem é decrecente.
      else
        Saida <= (1 << NBITS) - 1;
    end
    else begin
      // caso seja crescente adiciona 1 ao resultado já existente
      if (Entrada_de_Selecao)
        Saida <= Saida + 1;
      // caso seja decrescente subtrai 1 ao resultado já existente
      else
        Saida <= Saida - 1;
    end
  end
endmodule
