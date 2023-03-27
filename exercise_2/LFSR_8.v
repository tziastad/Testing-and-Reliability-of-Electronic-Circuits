module LFSR_8(
  input clk,
  output outLFSR,
  output reg [7:0] LFSR = 255
  
);
wire feedback = LFSR[7];
assign outLFSR=LFSR[3];
always @(posedge clk)
begin
  LFSR[0] <= feedback;
  LFSR[1] <= LFSR[0] ^ feedback;
  LFSR[2] <= LFSR[1];
  LFSR[3] <= LFSR[2];
  LFSR[4] <= LFSR[3];
  LFSR[5] <= LFSR[4];
  LFSR[6] <= LFSR[5];
  LFSR[7] <= LFSR[6];
end

endmodule