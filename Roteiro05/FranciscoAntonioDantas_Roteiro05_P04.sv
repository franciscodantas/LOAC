// Francisco Antonio Dantas de Sousa

parameter NBITS = 2;
parameter tamanho = 2;
module detectorSequencia(
  input clk, reset,
  input [NBITS-1:0] lampadas,
  output alarme
);
  
  // cria os estados desse sistema
  enum logic [tamanho-1:0] {RESET,UM, DOIS, TRES} state;
  
  // Parte sequencial para verificar se a sequencia 123 existe. 
  always_ff @(posedge clk)
    if (reset) begin
      state <= RESET;
    end
    else begin
      unique case (state)
        // verifica se 1 foi passado
        RESET:
          if (lampadas == 2'b01)
            state <= UM;
          else
            state <= RESET;
        // dado que 1 foi passado verifica se 2 foi passado
        UM:
          if (lampadas == 2'b10)
            state <= DOIS;
          else
            state <= UM;
        // dado que 1 e 2 foram passados verifica se 3 também foi
        DOIS:
          if (lampadas == 2'b11)
            state <= TRES;
          else
            state <= UM;
        // dado que 1,2 e 3 foram passados liga o alarme e reseta a contagem
        TRES:
          if (lampadas == 2'b01)
            state <= UM;
          else
            state <= RESET;
      endcase
    end
  
  // acende o alarme caso a sequencia seja verificada
  always_comb
    alarme = (state == TRES);
endmodule
