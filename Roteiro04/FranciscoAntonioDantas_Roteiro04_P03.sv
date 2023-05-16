// Francisco Antonio Dantas de Sousa
// Criando as variaveis de tamanho e quantidade de endereços
parameter ADDR_W = 2;
parameter DATA_W = 4;
module RamRom(
  input logic [ADDR_W-1:0] Addr,
  output logic [DATA_W-1:0] Dout
);
  // circuito comb que representa uma memoria ROM
  always_comb 
    case (Addr)
      2'b00: Dout = 4'b0100;
      2'b01: Dout = 4'b1100;
      2'b10: Dout = 4'b0110;
      2'b11: Dout = 4'b0111;
    endcase
  
endmodule