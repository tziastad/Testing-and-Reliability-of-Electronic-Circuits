library verilog;
use verilog.vl_types.all;
entity MyDFF is
    port(
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end MyDFF;
