library verilog;
use verilog.vl_types.all;
entity comb_logic is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        i               : out    vl_logic;
        j               : out    vl_logic
    );
end comb_logic;
