
module part5(SW, LEDR, HEX0, HEX1, HEX3, HEX5);
	input [9:0] SW;
	// A  = SW[7:4] and B = SW[3:0] Cin = SW[8]
	output [9:0] LEDR;
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX3;
	output [0:6] HEX5;

	reg [4:0] Z, T, S0, S1;
	reg C1;
	
	always @ (SW[8:0]) begin
		T = SW[7:4] + SW[3:0] + SW[8];
		if (T > 9) begin
			Z = 10;
			C1 = 1;
		end
		else begin
			Z = 0;
			C1 = 0;
		end
		S0 = T - Z;
		S1 = C1;
	end
	
	HEX_4_button HOUTA (HEX5, SW[7:4]);
	HEX_4_button HOUTB (HEX3, SW[3:0]);
	HEX_4_button HOUTC (HEX1, S1);
	HEX_4_button HOUTD (HEX0, S0);
	assign HEX2 = 7'b1111111;
	assign HEX4 = 7'b1111111;

endmodule
