library verilog;
use verilog.vl_types.all;
entity TRCUTwithMISR is
    port(
        CLK             : in     vl_logic;
        SE              : in     vl_logic;
        sign            : out    vl_logic
    );
end TRCUTwithMISR;
