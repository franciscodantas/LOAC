// Francisco Antonio Dantas de Sousa
parameter BIT = 8;
module somador(
  input logic signed [BIT-1:0] A,B,
  output logic signed [BIT-1:0] sum,
  output logic negativo,par,zero
);
  always_comb begin
    //Faz a soma de forma abstrata, sem a implementação do full adder aqui.
    sum <= A + B;
    
    /*Olha se MSB é 1(negativo usando complemento de 2) ou 0
    (positivo usando complemento de 2).
    */
    if(sum[BIT-1]) negativo <= 1;
    else negativo <= 0;
    
    /*Olha se LSB é 1(impar) ou 0(par).
    */
    if(sum[0]) par <= 0;
    else par <= 1;
    
    /*Olha se o resultado é 0.
    */
    if(!sum) zero <= 1;
    else zero <= 0;
  end
endmodule
