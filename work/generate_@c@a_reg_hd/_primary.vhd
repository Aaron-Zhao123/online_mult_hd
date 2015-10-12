library verilog;
use verilog.vl_types.all;
entity generate_CA_reg_hd is
    generic(
        Num_bits        : integer := 4;
        RAM_ADDR_WIDTH  : integer := 7
    );
    port(
        comp_cycle      : in     vl_logic_vector;
        x_value         : in     vl_logic_vector(1 downto 0);
        y_value         : in     vl_logic_vector(1 downto 0);
        x_plus          : out    vl_logic_vector;
        x_minus         : out    vl_logic_vector;
        y_plus          : out    vl_logic_vector;
        y_minus         : out    vl_logic_vector;
        clk             : in     vl_logic;
        master_cnt      : in     vl_logic_vector;
        enable_all      : in     vl_logic;
        wr_enable       : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Num_bits : constant is 1;
    attribute mti_svvh_generic_type of RAM_ADDR_WIDTH : constant is 1;
end generate_CA_reg_hd;
