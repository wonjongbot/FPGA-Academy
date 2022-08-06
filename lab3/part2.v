//

module part2 (LEDR, SW);
	input [9:0] SW;
	output [9:0] LEDR;
	
	wire S_g, R_g, Qa, Qb /* synthesis keep */;
	
	nand(S_g, SW[0], SW[1]);
	nand(R_g, SW[1], ~SW[0]);
	
	nand(Qa, S_g, Qb);
	nand(Qb, Qa, R_g);
	
	assign LEDR[0] = Qa;

endmodule

// symbolic implementation of gated D latch
module part2_sym (Clk, D, Q);
	input Clk, D;
	output Q;
	
	wire S_g, R_g, Qa, Qb /* synthesis keep */;
	
	nand(S_g, D, Clk);
	nand(R_g, Clk, ~D);
	
	nand(Qa, S_g, Qb);
	nand(Qb, Qa, R_g);
	
	assign Q = Qa;

endmodule
