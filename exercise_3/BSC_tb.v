`timescale 1ns/1ps

module BSC_tb();

	reg DataIn,ShiftIn,ShiftDR,ClockDR,Mode;
	wire ShiftOut,DataOut;
	BSC BSCinstance(DataIn,ShiftIn,ShiftDR,ClockDR,ClockDR,Mode,ShiftOut,DataOut);
	
	initial begin
		ClockDR=0;
		#20
		forever begin
			#10 ClockDR=!ClockDR;
		end
	end
	
	
	initial begin
		Mode=0; // normal mode on 
		ShiftDR=1;// store in CAP FF shiftin data
		repeat(4)@(posedge ClockDR)
			ShiftIn<=0;
			DataIn<=1;
			
			
		ShiftDR=0; // store in CAP FF internal logic data
		repeat(4)@(posedge ClockDR)
			ShiftIn<=0;
			DataIn<=1;
			
		
		
		Mode=1; // test mode on
		ShiftDR=1;// store in CAP FF shiftin data
		repeat(4)@(posedge ClockDR)
			
			DataIn<=1;
			ShiftIn<=0;
			
		ShiftDR=0;// store in CAP FF internal logic data
		repeat(4)@(posedge ClockDR)
			
			DataIn<=1;
			ShiftIn<=0;
		
		

	end
endmodule
		