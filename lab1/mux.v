module mux(a, b, c, m);
	input a, b, c;
	output m;
	assign m = (~c & a) | (c & b);
endmodule