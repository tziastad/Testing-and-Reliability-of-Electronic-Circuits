module MISRwithLFSR(CLK,sign);
	input CLK;
	output sign;
	wire [7:0] out;
	
	LFSR_8 lfsrinstance(CLK,lfsr3);
	misr_16 misrinstance(CLK,lfsr3,sign);
	
endmodule