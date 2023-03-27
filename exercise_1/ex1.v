`timescale 1ns/1ps
module trcut_tb();

	reg CLK,SEtb,data_in;
	wire SO;
	integer counter;
	reg [3:0]SItb;
	reg [3:0]sec_si;
	
	trcut trcut_instance(CLK,SEtb,data_in,SO);
	
	//Block for clock generation  
	initial begin
		CLK=0;
		#20
		forever begin
			#10 CLK=!CLK;
		end
	end
	
	initial begin
		SItb=4'b0101; // 1 is the LSB
		sec_si=4'b1001;
		counter=0;
	end
	
	initial begin
		//shift SItb=4'b0101
		repeat(4) @(posedge CLK)
			if(counter<4) begin
				SEtb=1;	//scan mode
				data_in<=SItb[counter]; //shift each bit of the test vector
				counter<=counter+1;
			end
		repeat (1)@(posedge CLK)
			SEtb=0;	//capture mode
			
		//shift sec_si=4'b1001
		//SO take the captured data
		counter=0;
		repeat(4) @(posedge CLK)
			if(counter<4) begin
				SEtb=1;//scan mode
				data_in<=sec_si[counter];//shift 1001
				counter<=counter+1;
			end
		repeat (1)@(posedge CLK)
			SEtb=0; //capture mode
		repeat (1)@(posedge CLK)
			SEtb=1;//scan mode
		
	end
	
endmodule
