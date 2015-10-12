library verilog;
use verilog.vl_types.all;
entity computation_control_hd is
    generic(
        RAM_ADDR_WIDTH  : integer := 7;
        START           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        WRITE_IN        : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        READ_OUT        : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        READ_OUT_LAST_LINE: vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        \END\           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0)
    );
    port(
        x_value         : in     vl_logic_vector(1 downto 0);
        y_value         : in     vl_logic_vector(1 downto 0);
        cnt_master      : in     vl_logic_vector;
        clk             : in     vl_logic;
        computation_cycle: out    vl_logic_vector(6 downto 0);
        write_enable    : out    vl_logic;
        STATE           : out    vl_logic_vector(2 downto 0);
        enable_all      : out    vl_logic;
        asyn_reset      : in     vl_logic;
        data_x_vld      : in     vl_logic;
        data_x_rdy      : out    vl_logic;
        data_y_vld      : in     vl_logic;
        data_y_rdy      : out    vl_logic;
        data_out_vld    : out    vl_logic;
        data_out_rdy    : in     vl_logic;
        x_value_reg     : out    vl_logic_vector(1 downto 0);
        y_value_reg     : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RAM_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of START : constant is 1;
    attribute mti_svvh_generic_type of WRITE_IN : constant is 1;
    attribute mti_svvh_generic_type of READ_OUT : constant is 1;
    attribute mti_svvh_generic_type of READ_OUT_LAST_LINE : constant is 1;
    attribute mti_svvh_generic_type of \END\ : constant is 1;
end computation_control_hd;
