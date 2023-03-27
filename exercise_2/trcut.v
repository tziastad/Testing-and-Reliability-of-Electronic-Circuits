module trcut(CLK,SE,SI,SO);
	input CLK,SE,SI;
	output SO;
	wire a_cp,b_cp,c_cp,d_cp; //connection combinational logic with scan chain
	assign SO=d_cp;
	
	comb_logic CLinstance(a_cp,b_cp,c_cp,d_cp,i,j);
	
	//scan chain
	SDFF R_AJ(CLK, j, SI, SE, a_cp);
	SDFF R_BI(CLK, i, a_cp, SE, b_cp);
	SDFF R_C(CLK, j, b_cp, SE, c_cp);
	SDFF R_D(CLK, j, c_cp, SE, d_cp);  
	
	  
endmodule

