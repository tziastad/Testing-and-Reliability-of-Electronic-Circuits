`timescale 1ns/1ps

module BSC(DataIn,ShiftIn,ShiftDR,ClockDR,UpdateDR,Mode,ShiftOut,DataOut);

	input DataIn,ShiftIn,ShiftDR,ClockDR,UpdateDR,Mode;
	output ShiftOut,DataOut;
	wire DataIn,ShiftIn,ShiftDR,ClockDR,UpdateDR,Mode,DfromMux,DataOut;
	reg SRFFQ, LFFQ;
	
	assign ShiftOut=SRFFQ;
	assign D1fromLFFQ=LFFQ;
	assign DfromMux=(ShiftDR)?ShiftIn:DataIn;
	assign DataOut=(Mode)?LFFQ:DataIn;
	
	
	
	//here we create the SRFF
  always @ (posedge ClockDR)
  begin
    SRFFQ<=DfromMux;
  end
  
  //here we create the LFF
  always @ (posedge UpdateDR)
  begin
    LFFQ<=SRFFQ;
  end
  
endmodule