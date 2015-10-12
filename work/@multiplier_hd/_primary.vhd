library verilog;
use verilog.vl_types.all;
entity Multiplier_hd is
    generic(
        RAM_ADDR_WIDTH  : integer := 7;
        UNROLL_WIDTH    : integer := 4
    );
    port(
        x_value         : in     vl_logic_vector(1 downto 0);
        y_value         : in     vl_logic_vector(1 downto 0);
        p_value         : out    vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        asyn_reset      : in     vl_logic;
        data_x_vld      : in     vl_logic;
        data_x_rdy      : out    vl_logic;
        data_y_vld      : in     vl_logic;
        data_y_rdy      : out    vl_logic;
        data_out_vld    : out    vl_logic;
        data_out_rdy    : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RAM_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of UNROLL_WIDTH : constant is 1;
end Multiplier_hd;
