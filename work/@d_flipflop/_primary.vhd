library verilog;
use verilog.vl_types.all;
entity D_flipflop is
    port(
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        \in\            : in     vl_logic;
        \out\           : out    vl_logic
    );
end D_flipflop;
