// Francisco Antonio Dantas de Sousa
parameter NBITS_DATA = 4;
module registrador(
  input logic [NBITS_DATA-1:0] Din,
  input logic clk,reset,Din_serie,SEL,
  output logic [NBITS_DATA-1:0] Dout
);

// Cria um registrador com reset assicrono, que pode ser serial ou paralelo
  always_ff @ (posedge reset or posedge clk) begin
    if(reset)
      Dout <= 0;
    else
      if(SEL == 0)
      	Dout <= Din;
      else begin
        Dout <= {Din_serie, Dout[NBITS_DATA-1:1]};
      end
  end
   
endmodule