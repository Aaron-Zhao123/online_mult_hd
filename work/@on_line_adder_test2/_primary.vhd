library verilog;
use verilog.vl_types.all;
entity On_line_adder_test2 is
    port(
        x_plus          : in     vl_logic;
        x_minus         : in     vl_logic;
        y_plus          : in     vl_logic;
        y_minus         : in     vl_logic;
        clk             : in     vl_logic;
        z               : out    vl_logic_vector(1 downto 0)
    );
end On_line_adder_test2;
