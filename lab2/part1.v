module part1 (SW, LEDR, HEX0, HEX1);
	input [9:0] SW;
	output [9:0] LEDR;
	output [0:6] HEX0;
	output [0:6] HEX1;
	
	HEX_4_button U0 (HEX0, SW[3:0]);
	HEX_4_button U1 (HEX1, SW[7:4]);
	
endmodule

module HEX_4_button (Display, S);
	input [3:0] S;
	output [0:6] Display;
	
	assign Display[0] = (S[2]&~S[1]&~S[0])|(~S[3]&~S[2]&~S[1]&S[0]);
	assign Display[1] = (S[2]&~S[1]&S[0])|(S[2]&S[1]&~S[0]);
	assign Display[2] = ~S[2]&S[1]&~S[0];
	assign Display[3] = (S[2]&~S[1]&~S[0])|(S[2]&S[1]&S[0])|(~S[3]&~S[2]&~S[1]&S[0]);
	assign Display[4] = S[0]|(S[2]&~S[1]);
	assign Display[5] = (~S[2]&S[1])|(~S[3]&~S[2]&S[0]);
	assign Display[6] = (~S[3]&~S[2]&~S[1])|(S[2]&S[1]&S[0]);
	
endmodule
