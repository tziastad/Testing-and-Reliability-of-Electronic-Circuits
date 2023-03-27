`timescale 1ns/1ps	

module MyDFF(CLK, D, Q);
  
  input CLK, D;
  output Q;
  
  wire CLK, D;
  reg Q;
  
  initial begin
	Q<=0;
  end
  always @ (posedge CLK)
  begin
    Q<=D;
  end
  
endmodule
  
  
