`timescale 1ns/1ps
module TRCUTwithMISR_tb();
	reg CLK,SE;
	wire sign;
	integer i;
	reg [15:0] signature;
	TRCUTwithMISR  myinstance(CLK,SE,sign);
	
	//Block for clock generation  
	initial begin
		CLK=0;
		#100
		forever begin
			#10 CLK=!CLK;
		end
	end
	initial begin
		i=0;
		SE=1;
		for(i=0;i<32;i=i+1)begin
			repeat(4) @(posedge CLK)
				SE=1;//scan mode
						
			repeat (1)@(posedge CLK)
				SE=0;//capture mode
		end
		for(i=0;i<16;i=i+1)@(posedge CLK)begin
			signature[i]<=sign;
		end
	end
	
	
endmodule