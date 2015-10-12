module Multiplier_hd (
x_value,
y_value,
p_value,
clk,
asyn_reset,
data_x_vld,
data_x_rdy,
data_y_vld,
data_y_rdy,
data_out_vld,
data_out_rdy);

parameter RAM_ADDR_WIDTH=7;
parameter UNROLL_WIDTH = 4;

input [1:0] x_value,y_value;
output [1:0] p_value;
input clk;
input asyn_reset; 

// input handshake config
input data_x_vld,data_y_vld;
output data_x_rdy,data_y_rdy;
input data_out_rdy;
output data_out_vld;

wire [RAM_ADDR_WIDTH+2-1:0] master_cnt;
wire [RAM_ADDR_WIDTH-1:0] comp_cycle;
wire [UNROLL_WIDTH-1:0] x_plus, x_minus, y_plus, y_minus;
wire enable_all,wr_enable;
wire [2:0] STATE;
wire [1:0] x_value_reg,y_value_reg;

computation_control_hd FSM(x_value,y_value,master_cnt,clk,comp_cycle,wr_enable,STATE,enable_all,asyn_reset,data_x_vld,data_x_rdy,data_y_vld,data_y_rdy,data_out_vld,data_out_rdy,x_value_reg,y_value_reg);

generate_CA_reg_hd CA_reg(comp_cycle,x_value_reg,y_value_reg,x_plus,x_minus,y_plus,y_minus,clk,master_cnt,enable_all,wr_enable);

SDVM SDVM1(clk,x_plus, x_minus, y_value_reg, x_plus_sel, x_minus_sel, enable, asyn_reset);

SDVM SDVM2(clk,y_plus, y_minus, x_value_reg, y_plus_sel, y_minus_sel, enable, asyn_reset);

counter master_counter(enable_all,clk,master_cnt,asyn_reset);



endmodule
