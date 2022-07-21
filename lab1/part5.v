module part5(SW, HEX0, HEX1, HEX2, HEX3);

	input [9:0] SW;
	output[0:6] HEX0, HEX1, HEX2, HEX3;
	wire [1:0]M0;
	wire [1:0]M1;
	wire [1:0]M2;
	wire [1:0]M3;
	
	mux_2bit_4to1 U0(SW[9:8], SW[7:6], SW[5:4], SW[3:2], SW[1:0], M0);
	//decoder for HEX0
	char_7seg H0(M0, HEX3);
	
	mux_2bit_4to1 U1(SW[9:8], SW[5:4], SW[3:2], SW[1:0], SW[7:6], M1);
	//decoder for HEX1
	char_7seg H1(M1, HEX2);
	
	mux_2bit_4to1 U2(SW[9:8], SW[3:2], SW[1:0], SW[7:6], SW[5:4], M2);
	//decoder for HEX2
	char_7seg H2(M2, HEX1);
	
	mux_2bit_4to1 U3(SW[9:8], SW[1:0], SW[7:6], SW[5:4], SW[3:2], M3);
	//decoder for HEX3
	char_7seg H3(M3, HEX0);
	
endmodule

module char_7seg(C, Display);

	input[1:0] C;
	output[0:6] Display;
	
	// decoder for HEX3[0]
	assign Display[0] = ~(C[0]);
	// decoder for HEX3[1]
	assign Display[1] = ~(~C[0] | C[1]);
	// decoder for HEX3[2]
	assign Display[2] = ~(~C[0] | C[1]);
	// decoder for HEX3[3]
	assign Display[3] = ~(C[0] | ~C[1]);
	// decoder for HEX3[4]
	assign Display[4] = ~(C[0] | ~C[1]);
	// decoder for HEX[5]
	assign Display[5] = ~(C[0]);
	// decoder for HEX3[6]
	assign Display[6] = ~(~C[1]);
endmodule	

module mux_2bit_4to1(S, U, V, W, X ,M);

	input [1:0] S, U, V, W, X;
	output [1:0] M;
	wire mux_UV0, mux_UV1, mux_WX0, mux_WX1;
	
	mux muxUV0(U[0],V[0],S[0],mux_UV0);
	mux muxWX0(W[0],X[0],S[0],mux_WX0);
	
	mux muxUV1(U[1],V[1],S[0],mux_UV1);
	mux muxWX1(W[1],X[1],S[0],mux_WX1);
	
	mux muxM0(mux_UV0, mux_WX0, S[1],M[0]);
	mux muxM1(mux_UV1, mux_WX1, S[1],M[1]);
	
	
endmodule
