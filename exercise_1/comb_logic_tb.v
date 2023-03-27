module comb_logic_tb();
  reg atb ,btb,ctb,dtb;
  wire itb,jtb;
  
  
  comb_logic  comb_logic_instatate(atb,btb,ctb,dtb,itb,jtb);
  initial begin
    atb=1;
    btb=0;
    ctb=0;
    dtb=1;
  end
    

endmodule