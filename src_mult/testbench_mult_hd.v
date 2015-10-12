`timescale 1ns/1ps
module testbench_mult_hd();

reg clk;
reg asyn_reset;
reg [1:0] x_value, y_value;
wire [1:0] p_value; 

reg data_x_vld,data_y_vld,data_out_rdy;
wire data_x_rdy,data_y_rdy,data_out_vld;

integer data_in_file_x,data_in_file_y;
integer scan_file_x,scan_file_y;
integer cnt = 0;

Multiplier_hd test(x_value, y_value, p_value, clk, asyn_reset,
 data_x_vld, data_x_rdy, data_y_vld, data_y_rdy, data_out_vld, data_out_rdy);

initial begin
	clk=1;
	while(1) begin
		#10 clk=~clk;
		cnt = cnt + 1;
	end
end




initial begin
  data_in_file_x=$fopen("C:/Aaron_documents/Newton_method_hd/Online_mult_hd/x_value.txt","r");
  
  data_in_file_y=$fopen("C:/Aaron_documents/Newton_method_hd/Online_mult_hd/y_value.txt","r");
  
end

initial begin
	scan_file_x=$fscanf(data_in_file_x,"%b",x_value);
	scan_file_y=$fscanf(data_in_file_y,"%b",y_value);
	data_x_vld <= 1;
	data_y_vld <= 1;
	data_out_rdy <= 1;
	asyn_reset = 1;

end

always@(negedge clk) begin
	//if (cnt > 15) begin
	//	data_x_vld <= 0;
//	end
	asyn_reset = 0;
	if(data_x_rdy && data_x_vld) begin
		scan_file_x=$fscanf(data_in_file_x,"%b",x_value);
	end
	if (data_y_rdy && data_y_vld) begin
		scan_file_y=$fscanf(data_in_file_y,"%b",y_value);
	end
end

endmodule

