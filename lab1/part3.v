/* Without using MUX module
module part3 (SW, LEDR);
	input [9:0] SW;
	output [9:0] LEDR;
	
	// U = SW[1:0]; V = SW[3:2]; W = SW[5:4]; X = SW[7:6]
	// S0 = SW[8] S1 = SW[9]
	
	// multiplexer that takes u, v and controlled by S0
	// multiplexer that takes w, x and controlled by S0
	// these two outputs are MUX'ed into LEDR[1:0]
	// mux template assign m = (∼s & x) | (s & y);
	
	// MUX for U0 and V0 ((~SW[8] & SW[0]) | (SW[8] & SW[2]))
	// MUX for W0 and X0 ((~SW[8] & SW[4]) | (SW[8] & SW[6]))
	// Combining two MUX with a MUX
	assign LEDR[0] = (~SW[9] & ((~SW[8] & SW[0]) | (SW[8] & SW[2]))) | (SW[9] & ((~SW[8] & SW[4]) | (SW[8] & SW[6])));
	assign LEDR[1] = (~SW[9] & ((~SW[8] & SW[1]) | (SW[8] & SW[3]))) | (SW[9] & ((~SW[8] & SW[5]) | (SW[8] & SW[7])));
endmodule
*/

// with use of MUX module
module part3(SW, LEDR);
	input [9:0] SW;
	output [9:0] LEDR;
	wire w1, w2, w3, w4;
	
	// w1 mux output from u0, v0 and w2 mux output from w0, x0
	
	// mux for u0, v0, s0
	mux MUX1(SW[0], SW[2], SW[8], w1);
	// mux for w0, x0, s0
	mux MUX2(SW[4], SW[6], SW[8], w2);
	// mux where w1 and w2 goes in
	mux MUX3(w1, w2, SW[9], LEDR[0]);
	
	
	// w3 mux output from u1, v1 and w4 mux output from w1, x1
	
	// mux for u0, v0, s0
	mux MUX4(SW[1], SW[3], SW[8], w3);
	// mux for w0, x0, s0
	mux MUX5(SW[5], SW[7], SW[8], w4);
	// mux where w1 and w2 goes in
	mux MUX6(w3, w4, SW[9], LEDR[1]);
endmodule

	