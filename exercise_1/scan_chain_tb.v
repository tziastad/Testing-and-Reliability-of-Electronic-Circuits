`timescale 1ns/1ps	
module scan_chain_tb();

	reg CLK,SEtb,j_ob_tb,i_ob_tb,x_value_tb;
	reg [3:0]SItb;
	wire a_cp_tb,b_cp_tb,c_cp_tb,d_cp_tb;
	reg data_in;
	integer counter;
	
	
	scan_chain sc_instatate(data_in,SEtb,CLK,j_ob_tb,a_cp_tb,i_ob_tb,b_cp_tb,c_cp_tb,d_cp_tb,x_value_tb);
	
	
  //Block for clock generation  
	initial begin
		CLK=0;
		#20
		forever begin
			#10 CLK=!CLK;
		end
	end
	
	initial begin
		SEtb=1;
		SItb=4'b1001;
		counter=0;
	end

	always @(posedge CLK)
		if(counter<5) begin
			data_in<=SItb[counter];
			counter<=counter+1;
		end
		
		
	  
	  
endmodule
	    
	   
	   

	 
	