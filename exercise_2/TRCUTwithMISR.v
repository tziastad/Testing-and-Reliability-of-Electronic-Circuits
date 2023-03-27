
module TRCUTwithMISR(CLK,SE,sign);
	input CLK,SE;
	output sign;
	
	
	TRCUTwithLFSR myinstance(CLK,SE,out);
	
	misr_16 misrinstance(CLK,out,sign,out_misr);
	
endmodule