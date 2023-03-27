module comb_logic(a,b,c,d,i,j);
  input a,b,c,d;
  output i,j;
  
  wire e,f,g,h;
  
  xor(e,a,b);
  xor(f,c,d);
  xor(g,a,c);
  xor(h,b,d);
  
  and(i,e,f);
  or(j,g,h);
  
  
endmodule
