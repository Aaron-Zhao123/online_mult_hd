module five_bits_parallel_adder(x_plus,x_minus,y_plus,y_minus,residue_plus,residue_minus,results_plus,results_minus,cin,cout);
// Parallel adder module with three inputs in signed representation 


parameter bits=5;
input[bits-1:0] x_plus,x_minus,y_plus,y_minus;
input[bits-1:0] residue_minus,residue_plus;


input[1:0] cin;
output[1:0] cout;
output[bits-1:0] results_plus,results_minus;

wire[1:0] c_temp;


wire[bits:0] z_plus_temp,z_minus_temp;




four_bits_adder	adder1(x_plus,x_minus,y_plus,y_minus,z_plus_temp,z_minus_temp,cin,c_temp);



four_bits_adder	adder2(z_plus_temp,z_minus_temp,residue_plus,residue_minus,results_plus,results_minus,c_temp,cout);


endmodule


