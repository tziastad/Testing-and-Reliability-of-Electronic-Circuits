`timescale 1ns/1ps

module tap_controller_tb();
	reg TCK,TMS,TRST;
	wire state;
	integer counter;
	reg [4:0] inputVector;
	
	tap_controller tap_controller_instance(TCK,TMS,TRST,state);
	
	initial begin
		TCK=0;
		#20
		forever begin
			#10 TCK=!TCK;
		end
	end
	
	initial begin
		inputVector=5'b10010;
		counter=0;
		TRST=0;
	end
	
	initial begin 
		repeat(6) @ (posedge TCK)
			if(counter<5) begin
				TMS<=inputVector[counter];
				counter<=counter+1;
			end
		repeat(1) @(posedge TCK)
			TRST=1;
	end
endmodule