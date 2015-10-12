module adder_test(x_plus,x_minus,y_plus,y_minus,residue_plus,residue_minus,results_plus,results_minus,cin_x,cin_y);

parameter bits=4;
parameter delay=5;
input[bits-1:0] x_plus,x_minus,y_plus,y_minus;
input[bits+delay-1:0]residue_minus,residue_plus;


input[1:0] cin_x,cin_y;
output[bits+delay-1:0] results_plus,results_minus;

wire[bits:0] z_plus_temp,z_minus_temp;
wire[bits+delay:0] z_plus,z_minus;
//output[bits:0] z_plus_dis,z_minus_dis;





four_bits_adder	adder1(x_plus,x_minus,y_plus,y_minus,z_plus_temp,z_minus_temp,cin_x);

assign z_plus={1'b0,1'b0,1'b0,z_plus_temp};
assign z_minus={1'b0,1'b0,1'b0,z_minus_temp};

nine_bits_adder	adder2(z_plus,z_minus,residue_plus,residue_minus,results_plus,results_minus,cin_y);

//assign z_plus_dis=z_plus_temp;
//assign z_minus_dis=z_minus_temp;

endmodule


