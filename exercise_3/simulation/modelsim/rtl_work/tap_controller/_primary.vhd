library verilog;
use verilog.vl_types.all;
entity tap_controller is
    generic(
        Test_Logic_Reset: vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi0);
        Run_Test_Idle   : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi0);
        Select_DR_Scan  : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        Capture_DR      : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        Shift_DR        : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi1);
        Exit1_DR        : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        Pause_DR        : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi1);
        Exit2_DR        : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi0);
        Update_DR       : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi1);
        Select_IR_Scan  : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi1);
        Capture_IR      : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi0);
        Shift_IR        : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi1);
        Exit1_IR        : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi0, Hi0);
        Pause1_IR       : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi0, Hi1);
        Exit2_IR        : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi1, Hi0);
        Update_IR       : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi1, Hi1)
    );
    port(
        TCK             : in     vl_logic;
        TMS             : in     vl_logic;
        TRST            : in     vl_logic;
        state           : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Test_Logic_Reset : constant is 2;
    attribute mti_svvh_generic_type of Run_Test_Idle : constant is 2;
    attribute mti_svvh_generic_type of Select_DR_Scan : constant is 2;
    attribute mti_svvh_generic_type of Capture_DR : constant is 2;
    attribute mti_svvh_generic_type of Shift_DR : constant is 2;
    attribute mti_svvh_generic_type of Exit1_DR : constant is 2;
    attribute mti_svvh_generic_type of Pause_DR : constant is 2;
    attribute mti_svvh_generic_type of Exit2_DR : constant is 2;
    attribute mti_svvh_generic_type of Update_DR : constant is 2;
    attribute mti_svvh_generic_type of Select_IR_Scan : constant is 2;
    attribute mti_svvh_generic_type of Capture_IR : constant is 2;
    attribute mti_svvh_generic_type of Shift_IR : constant is 2;
    attribute mti_svvh_generic_type of Exit1_IR : constant is 2;
    attribute mti_svvh_generic_type of Pause1_IR : constant is 2;
    attribute mti_svvh_generic_type of Exit2_IR : constant is 2;
    attribute mti_svvh_generic_type of Update_IR : constant is 2;
end tap_controller;
