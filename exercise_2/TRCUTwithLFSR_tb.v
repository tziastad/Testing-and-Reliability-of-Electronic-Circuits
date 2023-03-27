`timescale 1ns/1ps
module TRCUTwithLFSR_tb();
	reg CLK,SE;
	wire SO;
	integer i;
	
	TRCUTwithLFSR myinstance(CLK,SE,SO);
	
	//Block for clock generation  
	initial begin
		CLK=0;
		#20
		forever begin
			#10 CLK=!CLK;
		end
	end
	
	initial begin
		i=0;
		SE=0;
		for(i=0;i<32;i=i+1)begin
			repeat(4) @(posedge CLK)
				SE=1;//scan mode
						
			repeat (1)@(posedge CLK)
				SE=0;//capture mode

		end
	end
				
	
endmodule