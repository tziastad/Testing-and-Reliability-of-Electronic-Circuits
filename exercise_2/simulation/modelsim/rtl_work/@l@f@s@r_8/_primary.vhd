library verilog;
use verilog.vl_types.all;
entity LFSR_8 is
    port(
        clk             : in     vl_logic;
        outLFSR         : out    vl_logic;
        LFSR            : out    vl_logic_vector(7 downto 0)
    );
end LFSR_8;
