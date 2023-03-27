module SDFFtb();
  
  reg CLKtb,SItb,SEtb;
  wire SOtb,DI_OP;
  
  reg CUT;
  
  assign DI_OP=CUT;
   
  
  SDFF SDFFinstance(CLKtb,DI_OP,SItb,SEtb,SOtb);
  //Block for clock generation
  initial begin
    CLKtb=0;
    #20
    forever begin
      #10 CLKtb=!CLKtb; 
    end
  end
  
  //testing of SE=0 input data from DI
  initial begin
    SEtb=0;
    CUT=0; 
    #60
    CUT=1;
    #60
    //testing of SE=1 input data from SI
    SEtb=1;
    #60
    SItb=1;
    #60
    SItb=0;
    
    
  end
  
    
  
endmodule;
