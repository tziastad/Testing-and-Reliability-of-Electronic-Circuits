library verilog;
use verilog.vl_types.all;
entity misr_16 is
    port(
        clk             : in     vl_logic;
        SI              : in     vl_logic;
        sign            : out    vl_logic;
        MISR            : out    vl_logic_vector(15 downto 0)
    );
end misr_16;
