module part6(SW, LEDR, HEX0, HEX1);
	input [9:0] SW;
	output [9:0] LEDR;
	output [0:6] HEX0;
	output [0:6] HEX1;
	
	reg [5:0] T,Z;
	reg [3:0] S0, S1;
	reg [3:0] C1;
	
	always @ (SW[5:0]) begin
		T = SW[5:0];
		if (T > 9 && T < 20) begin
			Z = 10;
			C1 = 1;
		end
		
		else if (T > 19 && T < 30) begin
			Z = 20;
			C1 = 2;
		end
		
		else if (T > 29 && T < 40) begin
			Z = 30;
			C1 = 3;
		end
	
		else if (T > 39 && T < 50) begin
			Z = 40;
			C1 = 4;
		end
		
		else if (T > 49 && T < 60) begin
			Z = 50;
			C1 = 5;
		end
		
		else if (T > 59 && T < 70) begin
			Z = 60;
			C1 = 6;
		end
		
		else begin
			Z = 0;
			C1 = 0;
		end
		
		S0 = T - Z;
		S1 = C1;
	end
	HEX_4_button HS0 (HEX0, S0);
	HEX_4_button HS1 (HEX1, S1);

endmodule
