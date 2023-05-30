//Francisco Antonio Dantas de Sousa

parameter tamanho = 1;

module detectorParidade(
  input clk,
  input reset,
  input Entrada_serial,
  output Saida
);
  
  // Define os estados possiveis PAR ou IMPAR.
  enum logic [tamanho-1:0] {PAR, IMPAR} state;
  
  //Parte sequencial, para fazer as trocas de estados.
  always_ff @(posedge clk)
    if (reset) 
      state <= PAR;
    else begin
      unique case (state)
        PAR:
          if (Entrada_serial == 0)
            state <= PAR;
          else
            state <= IMPAR;
        IMPAR:
          if (Entrada_serial == 0)
            state <= IMPAR;
          else
            state <= PAR;
      endcase
    end
  
  // detecta a paridade PAR na sequencia.
  always_comb
    Saida = (state == PAR);
  
endmodule
