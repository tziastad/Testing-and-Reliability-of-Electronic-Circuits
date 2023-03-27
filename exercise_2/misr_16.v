module misr_16(
  input clk,
  input SI,
  output sign,
  output reg [15:0] MISR = 65535
  
);

wire feedback = MISR[15];
assign sign=MISR[15];
always @(posedge clk)
begin
  MISR[0] <= feedback;
  MISR[1] <= MISR[0];
  MISR[2] <= MISR[1] ^ feedback;
  MISR[3] <= MISR[2] ^ feedback;
  MISR[4] <= MISR[3];
  MISR[5] <= MISR[4] ^ feedback;
  MISR[6] <= MISR[5];
  MISR[7] <= MISR[6];
  MISR[8] <= MISR[7];
  MISR[9] <= MISR[8];
  MISR[10] <= MISR[9];
  MISR[11] <= MISR[10]^SI;
  MISR[12] <= MISR[11];
  MISR[13] <= MISR[12];
  MISR[14] <= MISR[13];
  MISR[15] <= MISR[14];
end
endmodule
