module part4 (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [9:0] SW;
	output [9:0] LEDR;
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
	output [0:6] HEX4;
	output [0:6] HEX5;
	
	wire [4:0] W;
	
	//FA_4_bit_ripple four_bit_ripple (SW[8], SW[7:4], SW[3:0], LEDR[3:0], LEDR[4]);

	FA_4_bit_ripple four_bit_ripple (SW[8], SW[7:4], SW[3:0], W[3:0], W[4]);
	
	part2_general P2 (W, HEX0, HEX1);
	
	HEX_4_button HOUTA (HEX5, SW[7:4]);
	HEX_4_button HOUTB (HEX3, SW[3:0]);
	assign HEX2 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	


		
endmodule


module part2_general (W, D0, D1);
	input [4:0] W;
	output [0:6] D0;
	output [0:6] D1;
	
	wire [4:0] comparator_5bit_out, A_out_5bit, mux_S_5bit, mux_5bit_out;
	
	Comparator_5bit COMP5(W[4:0], comparator_5bit_out);
	Circuit_A_5bit U100(W[4:0], A_out_5bit);
	
	assign mux_S_5bit = comparator_5bit_out;
	
	mux_5bit_2to1 u4(mux_S_5bit, W[4:0], A_out_5bit, mux_5bit_out);
	
	HEX_4_button H0 (D1, comparator_5bit_out);

	HEX_4_button H1 (D0, mux_5bit_out);

	
endmodule

module Comparator_5bit(V, Z);
	input [4:0] V;
	output Z;
	
	assign Z = (V[4])|(V[3]&V[1])|(V[3]&V[2]);
endmodule


module mux_5bit_2to1(S, X, Y, m);
	input S;
	input [4:0] X, Y;
	output [4:0] m;
	
	mux_1bit_2to1 mux1(S,X[0],Y[0],m[0]);
	mux_1bit_2to1 mux2(S,X[1],Y[1],m[1]);
	mux_1bit_2to1 mux3(S,X[2],Y[2],m[2]);
	mux_1bit_2to1 mux4(S,X[3],Y[3],m[3]);
	mux_1bit_2to1 mux5(S,X[4],Y[4],m[4]);
	
endmodule


module Circuit_A_5bit(V, A);
	input [4:0] V;
	output [4:0] A;
	
	assign A[4] = 0;
	assign A[3] = ~V[3]|V[1];
	assign A[2] = (~V[3]&~V[1])|(V[2]&V[1]);
	assign A[1] = ~V[1];
	assign A[0] = V[0];
	
endmodule

