library verilog;
use verilog.vl_types.all;
entity trcut is
    port(
        CLK             : in     vl_logic;
        SE              : in     vl_logic;
        SI              : in     vl_logic;
        SO              : out    vl_logic
    );
end trcut;
