// Francisco Antonio Dantas de Sousa
// Criando as variaveis de tamanho e quantidade de endereços
parameter ADDR_W = 2;
parameter DATA_W = 4;

module RamRW(
  input logic clk, SEL, reset,
  input logic [DATA_W-1:0] Din,
  input logic [ADDR_W-1:0] Addr,
  output logic [DATA_W-1:0] Dout
);
  
  // Cria uma memoria
  logic [DATA_W-1:0] mem [0:(1<<ADDR_W)-1];
  
  // circuito sequencial que representa a memoria
  always_ff @ (posedge reset or posedge clk) begin
    // reset de todas as celulas de memoria para 0 quando ativo
    if (reset) begin
      for (int i = 0; i < (1<<ADDR_W); i++) begin
        mem[i] <= 0;
      end
    end
    else begin
      // Modo de escrita
      if (SEL) begin
        mem[Addr] <= Din;
      end
      // Modo de leitura
      else begin
        Dout <= mem[Addr];
      end
    end
  end
endmodule
