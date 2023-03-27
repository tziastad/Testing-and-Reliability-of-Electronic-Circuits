-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "06/30/2021 10:53:45"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	trcut IS
    PORT (
	CLK : IN std_logic;
	SE : IN std_logic;
	SI : IN std_logic;
	SO : OUT std_logic
	);
END trcut;

-- Design Ports Information
-- SO	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SI	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF trcut IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_SE : std_logic;
SIGNAL ww_SI : std_logic;
SIGNAL ww_SO : std_logic;
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SO~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \SI~input_o\ : std_logic;
SIGNAL \R_AJ|muxoutput~0_combout\ : std_logic;
SIGNAL \R_AJ|muxoutput~1_combout\ : std_logic;
SIGNAL \R_AJ|dffinstance|Q~q\ : std_logic;
SIGNAL \R_BI|muxoutput~0_combout\ : std_logic;
SIGNAL \R_BI|muxoutput~1_combout\ : std_logic;
SIGNAL \R_BI|dffinstance|Q~q\ : std_logic;
SIGNAL \SE~input_o\ : std_logic;
SIGNAL \R_D|muxoutput~0_combout\ : std_logic;
SIGNAL \R_C|muxoutput~0_combout\ : std_logic;
SIGNAL \R_C|dffinstance|Q~q\ : std_logic;
SIGNAL \R_D|muxoutput~1_combout\ : std_logic;
SIGNAL \R_D|dffinstance|Q~q\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_SE <= SE;
ww_SI <= SI;
SO <= ww_SO;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);

-- Location: IOOBUF_X22_Y31_N9
\SO~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \R_D|dffinstance|Q~q\,
	devoe => ww_devoe,
	o => \SO~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G17
\CLK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X24_Y31_N1
\SI~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SI,
	o => \SI~input_o\);

-- Location: LCCOMB_X24_Y30_N28
\R_AJ|muxoutput~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \R_AJ|muxoutput~0_combout\ = (\SE~input_o\ & (\SI~input_o\)) # (!\SE~input_o\ & ((\R_AJ|dffinstance|Q~q\ $ (\R_C|dffinstance|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SE~input_o\,
	datab => \SI~input_o\,
	datac => \R_AJ|dffinstance|Q~q\,
	datad => \R_C|dffinstance|Q~q\,
	combout => \R_AJ|muxoutput~0_combout\);

-- Location: LCCOMB_X24_Y30_N6
\R_AJ|muxoutput~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \R_AJ|muxoutput~1_combout\ = (\R_AJ|muxoutput~0_combout\) # ((!\SE~input_o\ & (\R_BI|dffinstance|Q~q\ $ (\R_D|dffinstance|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SE~input_o\,
	datab => \R_BI|dffinstance|Q~q\,
	datac => \R_D|dffinstance|Q~q\,
	datad => \R_AJ|muxoutput~0_combout\,
	combout => \R_AJ|muxoutput~1_combout\);

-- Location: FF_X24_Y30_N7
\R_AJ|dffinstance|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \R_AJ|muxoutput~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R_AJ|dffinstance|Q~q\);

-- Location: LCCOMB_X24_Y30_N18
\R_BI|muxoutput~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \R_BI|muxoutput~0_combout\ = (\R_AJ|dffinstance|Q~q\ & (!\R_BI|dffinstance|Q~q\ & (\R_D|dffinstance|Q~q\ $ (\R_C|dffinstance|Q~q\)))) # (!\R_AJ|dffinstance|Q~q\ & (\R_BI|dffinstance|Q~q\ & (\R_D|dffinstance|Q~q\ $ (\R_C|dffinstance|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R_AJ|dffinstance|Q~q\,
	datab => \R_BI|dffinstance|Q~q\,
	datac => \R_D|dffinstance|Q~q\,
	datad => \R_C|dffinstance|Q~q\,
	combout => \R_BI|muxoutput~0_combout\);

-- Location: LCCOMB_X24_Y30_N16
\R_BI|muxoutput~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \R_BI|muxoutput~1_combout\ = (\SE~input_o\ & (\R_AJ|dffinstance|Q~q\)) # (!\SE~input_o\ & ((\R_BI|muxoutput~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SE~input_o\,
	datac => \R_AJ|dffinstance|Q~q\,
	datad => \R_BI|muxoutput~0_combout\,
	combout => \R_BI|muxoutput~1_combout\);

-- Location: FF_X24_Y30_N17
\R_BI|dffinstance|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \R_BI|muxoutput~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R_BI|dffinstance|Q~q\);

-- Location: IOIBUF_X24_Y31_N8
\SE~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SE,
	o => \SE~input_o\);

-- Location: LCCOMB_X24_Y30_N0
\R_D|muxoutput~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \R_D|muxoutput~0_combout\ = (\R_AJ|dffinstance|Q~q\ & ((\R_BI|dffinstance|Q~q\ $ (\R_D|dffinstance|Q~q\)) # (!\R_C|dffinstance|Q~q\))) # (!\R_AJ|dffinstance|Q~q\ & ((\R_C|dffinstance|Q~q\) # (\R_BI|dffinstance|Q~q\ $ (\R_D|dffinstance|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R_AJ|dffinstance|Q~q\,
	datab => \R_BI|dffinstance|Q~q\,
	datac => \R_D|dffinstance|Q~q\,
	datad => \R_C|dffinstance|Q~q\,
	combout => \R_D|muxoutput~0_combout\);

-- Location: LCCOMB_X24_Y30_N2
\R_C|muxoutput~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \R_C|muxoutput~0_combout\ = (\SE~input_o\ & (\R_BI|dffinstance|Q~q\)) # (!\SE~input_o\ & ((\R_D|muxoutput~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R_BI|dffinstance|Q~q\,
	datac => \SE~input_o\,
	datad => \R_D|muxoutput~0_combout\,
	combout => \R_C|muxoutput~0_combout\);

-- Location: FF_X24_Y30_N3
\R_C|dffinstance|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \R_C|muxoutput~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R_C|dffinstance|Q~q\);

-- Location: LCCOMB_X24_Y30_N4
\R_D|muxoutput~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \R_D|muxoutput~1_combout\ = (\SE~input_o\ & (\R_C|dffinstance|Q~q\)) # (!\SE~input_o\ & ((\R_D|muxoutput~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SE~input_o\,
	datac => \R_C|dffinstance|Q~q\,
	datad => \R_D|muxoutput~0_combout\,
	combout => \R_D|muxoutput~1_combout\);

-- Location: FF_X24_Y30_N5
\R_D|dffinstance|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \R_D|muxoutput~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R_D|dffinstance|Q~q\);

ww_SO <= \SO~output_o\;
END structure;


