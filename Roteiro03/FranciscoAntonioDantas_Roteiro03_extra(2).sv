// Francisco Antonio Dantas de Sousa
parameter NUMBITS = 8;
module comparator(
  input logic signed [NUMBITS-1:0] A,B,
  output logic S
);
  always_comb S <= & (~(A ^ B));
 
endmodule