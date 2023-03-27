module MyDFFtb();

  reg CLKtb, Dtb;
  wire Qtb;


  MyDFF dffinstance(CLKtb, Dtb, Qtb);

  //Block for clock generation  
  initial begin
    CLKtb=0;
    #20
    forever begin
      #10 CLKtb=!CLKtb;
    end
  end
  
  
  
  initial begin
    #60
    Dtb<=0;
    #60
    Dtb<=1;
  end
  
  
  
endmodule



