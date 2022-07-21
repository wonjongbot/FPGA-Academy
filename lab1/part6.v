module part6(SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [9:0] SW; // slide switches
	output [9:0] LEDR; // red lights
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // 7-seg display
	wire [2:0] H0,H1,H2,H3,H4,H5,HOUT0,HOUT1,HOUT2,HOUT3,HOUT4,HOUT5;
	
	assign H5[0] = 0;
	assign H5[1] = 0;
	assign H5[2] = 0;
	
	assign H4[0] = 1;
	assign H4[1] = 0;
	assign H4[2] = 0;
	
	assign H3[0] = 0;
	assign H3[1] = 1;
	assign H3[2] = 0;
	
	assign H2[0] = 1;
	assign H2[1] = 1;
	assign H2[2] = 0;
	
	assign H1[0] = 0;
	assign H1[1] = 0;
	assign H1[2] = 1;
	
	assign H0[0] = 1;
	assign H0[1] = 0;
	assign H0[2] = 1;
	
	mux_3bit_6to1 mux0(SW[9:7],H5,H4,H3,H2,H1,H0,HOUT0);
	
	three_bit_decoder(HOUT0, HEX5);
	
	
	mux_3bit_6to1 mux1(SW[9:7],H4,H3,H2,H1,H0,H5,HOUT1);
	
	three_bit_decoder(HOUT1, HEX4);
	
	
	mux_3bit_6to1 mux2(SW[9:7],H3,H2,H1,H0,H5,H4,HOUT2);
	
	three_bit_decoder(HOUT2, HEX3);
	
	
	mux_3bit_6to1 mux3(SW[9:7],H2,H1,H0,H5,H4,H3,HOUT3);
	
	three_bit_decoder(HOUT3, HEX2);
	
	
	mux_3bit_6to1 mux4(SW[9:7],H1,H0,H5,H4,H3,H2,HOUT4);
	
	three_bit_decoder(HOUT4, HEX1);
	
	
	mux_3bit_6to1 mux5(SW[9:7],H0,H5,H4,H3,H2,H1,HOUT5);
	
	three_bit_decoder(HOUT5, HEX0);
	
	
endmodule

module mux_3bit_6to1(S,U,V,W,X,Y,Z,M);
	
	input [2:0] S,U,V,W,X,Y,Z;
	output [2:0] M;
	wire [2:0] UV, WX, YZ, UVWX;
	
	mux U0_0(U[0],V[0],S[0],UV[0]);
	mux U0_1(U[1],V[1],S[0],UV[1]);
	mux U0_2(U[2],V[2],S[0],UV[2]);
	
	mux U1_0(W[0],X[0],S[0],WX[0]);
	mux U1_1(W[1],X[1],S[0],WX[1]);
	mux U1_2(W[2],X[2],S[0],WX[2]);
	
	mux U2_0(Y[0],Z[0],S[0],YZ[0]);
	mux U2_1(Y[1],Z[1],S[0],YZ[1]);
	mux U2_2(Y[2],Z[2],S[0],YZ[2]);
	
	mux U3_0(UV[0],WX[0],S[1],UVWX[0]);
	mux U3_1(UV[1],WX[1],S[1],UVWX[1]);
	mux U3_2(UV[2],WX[2],S[1],UVWX[2]);
	
	mux u4_0(UVWX[0],YZ[0],S[2],M[0]);
	mux u4_1(UVWX[1],YZ[1],S[2],M[1]);
	mux u4_2(UVWX[2],YZ[2],S[2],M[2]);
	

endmodule

module three_bit_decoder(C, Display);
	input [2:0] C;
	output [0:6] Display;
	
	assign Display[0] = ~C[0] | (~C[1] & ~C[2]);
	assign Display[1] = (~C[1] & ~C[2]) | (C[1] & C[0]);
	assign Display[2] = (~C[1] & ~C[2]) | (C[1] & C[0]);
	assign Display[3] = (~C[1] & ~C[2]) | (~C[1] & ~C[0]);
	assign Display[4] = (~C[1] & ~C[2]) | (~C[1] & ~C[0]);
	assign Display[5] = ~C[0] | (~C[1] & ~C[2]);
	assign Display[6] = ~C[1];
endmodule


/*
module HEX_D(Display);

	output [0:6]Display;
	
	assign Display[0] = 1;
	assign Display[1] = 0;
	assign Display[2] = 0;
	assign Display[3] = 0;
	assign Display[4] = 0;
	assign Display[5] = 1;
	assign Display[6] = 0;

endmodule

module HEX_E(Display);

	output [0:6]Display;
	
	assign Display[0] = 0;
	assign Display[1] = 1;
	assign Display[2] = 1;
	assign Display[3] = 0;
	assign Display[4] = 0;
	assign Display[5] = 0;
	assign Display[6] = 0;

endmodule

module HEX_1(Display);

	output [0:6]Display;
	
	assign Display[0] = 1;
	assign Display[1] = 0;
	assign Display[2] = 0;
	assign Display[3] = 1;
	assign Display[4] = 1;
	assign Display[5] = 1;
	assign Display[6] = 1;

endmodule

module HEX_0(Display);

	output [0:6]Display;
	
	assign Display[0] = 0;
	assign Display[1] = 0;
	assign Display[2] = 0;
	assign Display[3] = 0;
	assign Display[4] = 0;
	assign Display[5] = 0;
	assign Display[6] = 1;

endmodule

module HEX_SP(Display);

	output [0:6]Display;
	
	assign Display[0] = 1;
	assign Display[1] = 1;
	assign Display[2] = 1;
	assign Display[3] = 1;
	assign Display[4] = 1;
	assign Display[5] = 1;
	assign Display[6] = 1;

endmodule

*/