module scan_chain(SI,SE,CLK,j_ob,a_cp,i_ob,b_cp,c_cp,d_cp,x_value);
	input CLK,SE,j_ob,i_ob,x_value;
	input SI;
	output a_cp,b_cp,c_cp,d_cp;
	
	
	SDFF R_AJ(CLK, j_ob, SI, SE, a_cp);
	SDFF R_BI(CLK, i_ob, a_cp, SE, b_cp);
	SDFF R_C(CLK, x_value, b_cp, SE, c_cp);
	SDFF R_D(CLK, x_value, c_cp, SE, d_cp);
endmodule
	  