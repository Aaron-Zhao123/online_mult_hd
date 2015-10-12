library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        RAM_ADDR_WIDTH  : integer := 7;
        initial_state   : vl_logic := Hi0;
        start_state     : vl_logic := Hi1
    );
    port(
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        cnt             : out    vl_logic_vector;
        asyn_reset      : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RAM_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of initial_state : constant is 1;
    attribute mti_svvh_generic_type of start_state : constant is 1;
end counter;
