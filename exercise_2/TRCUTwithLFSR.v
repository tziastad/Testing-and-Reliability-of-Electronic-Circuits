module TRCUTwithLFSR(CLK,SE,SO);
	input CLK,SE;
	output SO;
	wire [7:0] out;
	LFSR_8 LFSRinstance(CLK,lfsrout3,out);
	
	trcut trcutinstance(CLK,SE,lfsrout3,SO);
	
endmodule