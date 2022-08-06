module part3 (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [9:0] SW;
	output [9:0] LEDR;
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
	output [0:6] HEX4;
	output [0:6] HEX5;
		
	FA_4_bit_ripple four_bit_ripple (SW[8], SW[7:4], SW[3:0], LEDR[3:0], LEDR[4]);
		
endmodule

module FA_4_bit_ripple(Cin, A, B, S, Cout);
	input [3:0] A, B;
	input Cin;
	output [3:0] S, Cout;
	wire [3:1] C;
	
	FA FA0 (Cin, A[0], B[0], S[0], C[1]);
	FA FA1 (C[1], A[1], B[1], S[1], C[2]);
	FA FA2 (C[2], A[2], B[2], S[2], C[3]);
	FA FA3 (C[3], A[3], B[3], S[3], Cout);

endmodule

module FA(Ci, A, B, S, Co);
	input Ci, A, B;
	output S, Co;
	wire a_xor_b;
	
	assign a_xor_b = A^B;
	
	mux_1bit_2to1 adder_mux(a_xor_b, B, Ci, Co);
	
	assign S = Ci^a_xor_b;
	
endmodule
