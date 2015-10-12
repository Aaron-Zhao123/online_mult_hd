module single_clk_ram_tmp(
	output reg[7:0] q,
	input[7:0] d,
	input[6:0] w,r,
	input we,clk
);

reg[7:0] mem[127:0];

always@(posedge clk) begin
	if(we)
		mem[w]<=d;
	q<= mem[r];
end
endmodule
