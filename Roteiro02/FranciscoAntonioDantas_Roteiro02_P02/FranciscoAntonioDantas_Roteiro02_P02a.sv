module MUX(
  input logic [3:0] A, B,
  input logic SEL,
  output logic [3:0] SAIDA
);
  always_comb
    /* Esse Case olha o estado do SEL, passando A ou B;
    */
    if(SEL)
      SAIDA <= A;
    else
      SAIDA <= B;
        
endmodule