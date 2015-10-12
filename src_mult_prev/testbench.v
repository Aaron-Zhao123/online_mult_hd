`timescale 1ns/1ps  
module testbench();

reg clk;
reg[8:0] cnt;
reg write_enable;
wire[3:0] residue_plus,residue_minus;
wire[1:0] data_out;
reg [1:0] x_value,y_value;
wire read_indicator;
wire[3:0]x_plus_dis,x_minus_dis,y_plus_dis,y_minus_dis;
wire[6:0] computation_cycle_dis;
wire[8:0] cnt_dis;
wire we_dis;
wire[1:0] STATE;
wire[8:0] v_plus,v_minus;
wire[3:0] x_plus_sel_dis,x_minus_sel_dis,y_plus_sel_dis,y_minus_sel_dis;
wire[2:0] sample_V_dis;
wire[1:0] cout_four_bits_dis_one,cout_four_bits_dis_two,cin_four_bits_dis_one,cin_four_bits_dis_two;
wire[8:0]w_plus_dis,w_minus_dis;
wire[3:0] sum_plus,sum_minus;
wire[3:0] z_plus,z_minus;
wire[6:0] write_addr,read_addr;
wire enable_shift_dis,enable_adder_dis;
//wire[8:0] z_plus_dis,z_minus_dis;
integer data_in_file;
integer scan_file;
integer data_out_file;

Multiplier	multiplier(x_value,x_value,data_out,clk,read_indicator,x_plus_dis,x_minus_dis,y_plus_dis,y_minus_dis,computation_cycle_dis,cnt_dis,we_dis,STATE,v_plus,v_minus,x_plus_sel_dis,x_minus_sel_dis,y_plus_sel_dis,y_minus_sel_dis,sample_V_dis,residue_plus,residue_minus,cout_four_bits_dis_one,cout_four_bits_dis_two,cin_four_bits_dis_one,cin_four_bits_dis_two,w_plus_dis,w_minus_dis,sum_plus,sum_minus,z_plus,z_minus,enable_shift_dis,enable_adder_dis,write_addr,read_addr,write_enable);
initial begin
	clk=0;

	write_enable=1'b1;
	cnt=9'b0;
	
	while(1) begin
		#10 clk=~clk;
		cnt=cnt+1;
		/*if(cnt<=9'b1111) begin
		  write_enable=1'b1;  
		end
		else begin
		  write_enable=1'b0;
		end
		*/
  end
end
// clock module, 50Mhz clk



initial begin
  data_in_file=$fopen("H:/UROP research/verilog/Online_multiplier_arbitary_precision_new/newton.txt","r");
  data_out_file=$fopen("H:/UROP research/verilog/Online_multiplier_arbitary_precision_new/output.dat","w");
  scan_file=$fscanf(data_in_file,"%b %b",x_value,y_value);
end

always@(posedge clk) begin
	if(read_indicator)
		scan_file=$fscanf(data_in_file,"%b %b",x_value,y_value);
	 
	if(STATE==2'b11||(STATE==2'b00&&cnt_dis!=9'b0000&&computation_cycle_dis!=7'b1))
		$fwrite(data_out_file,"%b\n",data_out);
end

endmodule
