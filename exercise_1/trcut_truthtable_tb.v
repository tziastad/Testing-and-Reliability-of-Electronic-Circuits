`timescale 1ns/1ps
module trcut_truthtable_tb();
	
	reg CLK,SEtb,data_in,confirmed_output;
	wire SO;
	integer counter,i,j,output_counter;
	reg[7:0] truth_table [0:15];
	
	trcut trcut_instance(CLK,SEtb,data_in,SO);
	
	//Block for clock generation  
	initial begin
		CLK=0;
		#20
		forever begin
			#10 CLK=!CLK;
		end
	end
	
	initial begin
	//                    out in
	//                     |   |
	//                     \/  \/
		truth_table[0]=8'b00xx0000;
		truth_table[1]=8'b10xx0001;
		truth_table[2]=8'b10xx0010;
		truth_table[3]=8'b10xx0011;
		truth_table[4]=8'b10xx0100;
		truth_table[5]=8'b01xx0101;
		truth_table[6]=8'b11xx0110;
		truth_table[7]=8'b10xx0111;
		truth_table[8]=8'b10xx1000;
		truth_table[9]=8'b11xx1001;
		truth_table[10]=8'b01xx1010;
		truth_table[11]=8'b10xx1011;
		truth_table[12]=8'b10xx1100;
		truth_table[13]=8'b10xx1101;
		truth_table[14]=8'b10xx1110;
		truth_table[15]=8'b00xx1111;
		counter=0;
		output_counter=4;
		i=0;
		j=0;
		SEtb=1;
	end

		
	initial begin
		for(i=0;i<16;i=i+1)begin
			repeat(4) @(posedge CLK)
				if(counter<4)begin
					SEtb=1;//scan mode
					data_in<=truth_table[i][counter];//shift each bit of the truth table's vactor
					counter<=counter+1;
				end		
			repeat (1)@(posedge CLK)
				SEtb=0;//capture mode
				
//this code made to confime the output data but
//adds 4 clock cycles at every interation 

			repeat (1)@(posedge CLK)
				SEtb=1;
								
			repeat (4)@(posedge CLK)
				if(output_counter<8)begin
					
					if(SO===truth_table[i][output_counter])begin
						confirmed_output<=1;
					end
					else begin
						confirmed_output<=0;
					end
					output_counter<=output_counter+1;
				end			
				
		counter=0;
		output_counter=4;
		end
	end
	
	
	
	
endmodule