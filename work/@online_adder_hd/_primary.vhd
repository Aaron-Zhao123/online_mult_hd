library verilog;
use verilog.vl_types.all;
entity Online_adder_hd is
    generic(
        START           : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        COMP            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        \END\           : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        x_plus          : in     vl_logic;
        x_minus         : in     vl_logic;
        y_plus          : in     vl_logic;
        y_minus         : in     vl_logic;
        clk             : in     vl_logic;
        z               : out    vl_logic_vector(1 downto 0);
        asyn_reset      : in     vl_logic;
        data_x_vld      : in     vl_logic;
        data_x_rdy      : out    vl_logic;
        data_y_vld      : in     vl_logic;
        data_y_rdy      : out    vl_logic;
        data_out_vld    : out    vl_logic;
        data_out_rdy    : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of START : constant is 1;
    attribute mti_svvh_generic_type of COMP : constant is 1;
    attribute mti_svvh_generic_type of \END\ : constant is 1;
end Online_adder_hd;
