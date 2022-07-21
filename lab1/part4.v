module part4(SW, HEX0);
	input [9:0] SW;
	output[6:0] HEX0;
	
	// decoder for HEX0[0]
	assign HEX0[0] = ~(SW[0]);
	
	// decoder for HEX0[1]
	assign HEX0[1] = ~(~SW[0] | SW[1]);
	
	// decoder for HEX0[2]
	assign HEX0[2] = ~(~SW[0] | SW[1]);
	
	// decoder for HEX0[3]
	assign HEX0[3] = ~(SW[0] | ~SW[1]);
	
	// decoder for HEX0[4]
	assign HEX0[4] = ~(SW[0] | ~SW[1]);
	
	// decoder for HEX0[5]
	assign HEX0[5] = ~(SW[0]);
	
	// decoder for HEX0[6]
	assign HEX0[6] = ~(~SW[1]);
endmodule
