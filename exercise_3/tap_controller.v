`timescale 1ns/1ps	

module tap_controller(TCK,TMS,TRST,state);

	input TCK,TMS,TRST;
	output state;
	wire TCK,TMS,TRST;
	wire [3:0] state;
	
	//states
	parameter [3:0] Test_Logic_Reset= 4'b0000;//0
	parameter [3:0] Run_Test_Idle= 4'b1000;//8
	parameter [3:0] Select_DR_Scan= 4'b0001;//1
	parameter [3:0] Capture_DR= 4'b0010;//2
	parameter [3:0] Shift_DR= 4'b0011;//3
	parameter [3:0] Exit1_DR= 4'b0100;//4
	parameter [3:0] Pause_DR= 4'b0101;//5
	parameter [3:0] Exit2_DR= 4'b0110;//6
	parameter [3:0] Update_DR= 4'b0111;//7
	parameter [3:0] Select_IR_Scan= 4'b1001;//9
	parameter [3:0] Capture_IR= 4'b1010;//10
	parameter [3:0] Shift_IR= 4'b1011;//11
	parameter [3:0] Exit1_IR= 4'b1100;//12
	parameter [3:0] Pause1_IR= 4'b1101;//13
	parameter [3:0] Exit2_IR= 4'b1110;//14
	parameter [3:0] Update_IR= 4'b1111;//15
	
	
	reg [3:0] current_state;
	assign state=current_state;
	always @(posedge TCK,posedge TRST)
	
	begin
		
		//asynchronous reset
		if(TRST==1'b1) begin
			current_state<=Test_Logic_Reset;
			end
		else begin
			current_state<=Test_Logic_Reset; //initailize the state
			case(current_state)
				Test_Logic_Reset:
					case(TMS)
						0: current_state<=Run_Test_Idle;
						1: current_state<=Test_Logic_Reset;
					endcase
				Run_Test_Idle:
					case(TMS)
						0:current_state<= Run_Test_Idle;
						1:current_state<=Select_DR_Scan;
					endcase
				Select_DR_Scan:
					case(TMS)
						0:current_state<= Capture_DR;
						1:current_state<=Select_IR_Scan;
					endcase
				Capture_DR:
					case(TMS)
						0:current_state<= Shift_DR;
						1:current_state<=Exit1_DR;
					endcase
				Shift_DR:
					case(TMS)
						0:current_state<= Shift_DR;
						1:current_state<=Exit1_DR;
					endcase
				Exit1_DR:
					case(TMS)
						0:current_state<= Pause_DR;
						1:current_state<=Update_DR;
					endcase
				Pause_DR:
					case(TMS)
						0:current_state<= Pause_DR;
						1:current_state<=Exit2_DR;
					endcase
				Exit2_DR:
					case(TMS)
						0:current_state<= Shift_DR;
						1:current_state<=Update_DR;
					endcase
				Update_DR:
						case(TMS)
						0:current_state<= Run_Test_Idle;
						1:current_state<=Select_DR_Scan;
					endcase
				
				Select_IR_Scan:
					case(TMS)
						0:current_state<= Capture_IR;
						1:current_state<=Test_Logic_Reset;
					endcase
				Capture_IR:
					case(TMS)
						0:current_state<= Shift_IR;
						1:current_state<=Exit1_IR;
					endcase
				Shift_IR:
					case(TMS)
						0:current_state<= Shift_IR;
						1:current_state<=Exit1_IR;
					endcase
				Exit1_IR:
					case(TMS)
						0:current_state<= Pause1_IR;
						1:current_state<=Update_IR;
					endcase
				Pause1_IR:
					case(TMS)
						0:current_state<= Pause1_IR;
						1:current_state<=Exit2_IR;
					endcase
				Exit2_IR:
					case(TMS)
						0:current_state<= Shift_IR;
						1:current_state<=Update_IR;
					endcase
				Update_IR:
					case(TMS)
						0:current_state<= Run_Test_Idle;
						1:current_state<=Select_DR_Scan;
					endcase
			endcase
		end
	end
endmodule