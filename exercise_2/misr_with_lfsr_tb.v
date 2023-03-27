`timescale 1ns/1ps
module misr_with_lfsr_tb();
	reg CLK;
	wire sign;
	
	MISRwithLFSR myinstance(CLK,sign);
	
	//Block for clock generation  
	initial begin
		CLK=0;
		#20
		forever begin
			#10 CLK=!CLK;
		end
	end
endmodule
	
	