module 	MISR_16tb();

  reg CLKtb;
  wire sign;
  wire out;
  reg data_in;
  MISR_16 MISRinstance(CLKtb,data_in,sign,out);
    
    
    
  //Block for clock generation  
  initial begin
    CLKtb=0;
    #20
    forever begin
      #10 CLKtb=!CLKtb;
		
    end
  end	

  
endmodule
