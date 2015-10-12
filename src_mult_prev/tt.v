module tt(
	output reg[7:0] q,
	input[7:0] d,
	input[6:0] w,r,
	input we,clk
);

reg[7:0] mem[127:0];
integer i;

initial begin
	for (i=0;i<128;i=i+1) begin
		mem[i]<=8'b0;
	end
end

always@(posedge clk) begin
	if(we)
		mem[w]=d;
	q= mem[r];
end
endmodule