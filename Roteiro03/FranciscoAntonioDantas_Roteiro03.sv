// Francisco Antonio Dantas de Sousa
parameter NBITS = 8;
parameter NSELECT = 2;
module ULA(
  input logic signed [NBITS-1:0] A, B, input logic [NSELECT-1:0] F,
  output logic signed [NBITS-1:0] SAIDA, output logic FLAG_O
);
  always_comb
      case(F)
        // Faz um AND bit a bit
        'b00:begin
          SAIDA <= A & B;
          FLAG_O <= 0;
        end
        // Faz um OR bit a bit
        'b01:begin
          SAIDA <= A | B;
          FLAG_O <= 0;
        end
        /* Faz a soma de A e B, A Flag é ativada caso dois números somados 
        tenham o mesmo sinal(positivo ou negativo) e o resultado dê um sinal diferente.
        */
        'b10: begin
          SAIDA <= A + B;
          if(SAIDA < 0)
            if(A >=0 && B >=0)
              FLAG_O <= 1;
          	else
              FLAG_O <= 0;
          else
            if(A < 0 && B < 0)
              FLAG_O <= 1;
            else
              FLAG_O <= 0;
        end
        /* Faz a subtração de A e B. A Flag é ativa caso os dois números
        tenham sinais diferentes e na subtração de um positivo com um
        negativo a SAÍDA seja negativa ou na subtração de um negativo por
        um positivo e a SAÍDA seja positiva.
        */
        'b11:begin
          SAIDA <= A - B;
          if(SAIDA < 0)
            if(A > 0 && B < 0)
              FLAG_O <= 1;
          	else
              FLAG_O <= 0;
          else
            if(A < 0 && B > 0)
              FLAG_O <= 1;
          	else
              FLAG_O <= 0;
        end
      endcase
endmodule