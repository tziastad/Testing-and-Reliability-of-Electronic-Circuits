module LFSR_8tb();

  reg CLKtb;
  wire out3;
  wire out;
  reg data_in;
  LFSR_8 LFSRinstance(CLKtb,out3,out);
    
    
    
  //Block for clock generation  
  initial begin
    CLKtb=0;
    #20
    forever begin
      #10 CLKtb=!CLKtb;
		
    end
  end	
  //Block for clock generation  
//  initial 
//  begin
    ////Testing of SE=0 (input path from DI)
//    SEtb=0;
//    CUT=0;
//    #60
//    CUT=1;
//    #60
    ////Testing of SE=1 (input path from SI)    
//    SEtb=1;
//    #60
//    SItb=1;
//    #60
//    SItb=0;
//  end  
  
endmodule
