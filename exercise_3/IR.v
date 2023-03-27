`timescale 1ns/1ps	

module IR(Data, TDI, ShiftIR, ClockIR, UpdateIR, ParallelOut, TDO);
  
  input Data, TDI, ShiftIR, ClockIR, UpdateIR;
  output ParallelOut, TDO;
  
  wire Data, TDI, ShiftIR, ClockIR, UpdateIR, ParallelOut,TDO;
  reg SRFFQ, LFFQ;
  wire DfromMux;
  
  
  //here we create the Mux 
  assign DfromMux=(ShiftIR)?TDI:Data;
  
  assign TDO=SRFFQ;
  assign ParallelOut=LFFQ;
  
  //here we create the SRFF
  always @ (posedge ClockIR)
  begin
    SRFFQ<=DfromMux;
  end
  
  //here we create the LFF
  always @ (posedge UpdateIR)
  begin
    LFFQ<=SRFFQ;
  end
  
endmodule
  
  
