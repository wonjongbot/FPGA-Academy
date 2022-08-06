module part2 (SW, LEDR, HEX0, HEX1);
	input [9:0] SW;
	output [9:0] LEDR;
	output [0:6] HEX0;
	output [0:6] HEX1;
	
	wire [3:0] comparator_out, A_out, mux_S, mux_4bit_out;
	
	Comparator U_COMP(SW[3:0], comparator_out);
	Circuit_A U_(SW[3:0], A_out);
	
	assign mux_S = comparator_out;
	
	mux_4bit_2to1 u4(mux_S, SW[3:0], A_out, mux_4bit_out);
	
	HEX_4_button H0 (HEX1, comparator_out);

	HEX_4_button H1 (HEX0, mux_4bit_out);

	
	
endmodule

module Circuit_A(V, A);
	input [3:0] V;
	output [3:0] A;
	
	assign A[3] = 0;
	assign A[2] = V[3]&V[2]&V[1];
	assign A[1] = V[3]&V[2]&~V[1];
	assign A[0] = (V[3]&V[1]&V[0]) | (V[3]&V[2]&V[0]);
	
endmodule

module Comparator(V, Z);
	input [3:0] V;
	output Z;
	
	assign Z = (V[3]&V[2])|(V[3]&V[1]);
endmodule


module mux_1bit_2to1(S, X, Y, m);
	input S,X,Y;
	output m;
	assign m = (~S & X) | (S & Y);
endmodule

module mux_4bit_2to1(S, X, Y, m);
	input S;
	input [3:0] X, Y;
	output [3:0] m;
	
	mux_1bit_2to1 mux1(S,X[0],Y[0],m[0]);
	mux_1bit_2to1 mux2(S,X[1],Y[1],m[1]);
	mux_1bit_2to1 mux3(S,X[2],Y[2],m[2]);
	mux_1bit_2to1 mux4(S,X[3],Y[3],m[3]);

endmodule

