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

-- DATE "06/05/2021 11:36:27"

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

ENTITY 	tap_controller IS
    PORT (
	TCK : IN std_logic;
	TMS : IN std_logic;
	TRST : IN std_logic;
	state : OUT std_logic_vector(3 DOWNTO 0)
	);
END tap_controller;

-- Design Ports Information
-- state[0]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[1]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[2]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[3]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TMS	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TCK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TRST	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF tap_controller IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_TCK : std_logic;
SIGNAL ww_TMS : std_logic;
SIGNAL ww_TRST : std_logic;
SIGNAL ww_state : std_logic_vector(3 DOWNTO 0);
SIGNAL \TRST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TCK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TCK~input_o\ : std_logic;
SIGNAL \TCK~inputclkctrl_outclk\ : std_logic;
SIGNAL \state[0]~output_o\ : std_logic;
SIGNAL \state[1]~output_o\ : std_logic;
SIGNAL \state[2]~output_o\ : std_logic;
SIGNAL \state[3]~output_o\ : std_logic;
SIGNAL \TMS~input_o\ : std_logic;
SIGNAL \current_state~26_combout\ : std_logic;
SIGNAL \TRST~input_o\ : std_logic;
SIGNAL \TRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \current_state.Capture_DR~q\ : std_logic;
SIGNAL \WideOr6~1_combout\ : std_logic;
SIGNAL \current_state.Shift_DR~q\ : std_logic;
SIGNAL \WideOr6~0_combout\ : std_logic;
SIGNAL \current_state.Exit1_DR~feeder_combout\ : std_logic;
SIGNAL \current_state.Exit1_DR~q\ : std_logic;
SIGNAL \WideOr2~0_combout\ : std_logic;
SIGNAL \current_state.Pause_DR~feeder_combout\ : std_logic;
SIGNAL \current_state.Pause_DR~q\ : std_logic;
SIGNAL \current_state~25_combout\ : std_logic;
SIGNAL \current_state.Exit2_DR~q\ : std_logic;
SIGNAL \WideOr9~0_combout\ : std_logic;
SIGNAL \current_state.Update_DR~q\ : std_logic;
SIGNAL \WideOr11~0_combout\ : std_logic;
SIGNAL \current_state.Shift_IR~q\ : std_logic;
SIGNAL \WideOr1~1_combout\ : std_logic;
SIGNAL \current_state.Exit1_IR~q\ : std_logic;
SIGNAL \WideOr2~1_combout\ : std_logic;
SIGNAL \current_state.Pause1_IR~q\ : std_logic;
SIGNAL \current_state~27_combout\ : std_logic;
SIGNAL \current_state.Exit2_IR~q\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \current_state.Update_IR~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \current_state.Test_Logic_Reset~q\ : std_logic;
SIGNAL \WideOr10~0_combout\ : std_logic;
SIGNAL \current_state.Run_Test_Idle~q\ : std_logic;
SIGNAL \WideOr5~0_combout\ : std_logic;
SIGNAL \current_state.Select_DR_Scan~q\ : std_logic;
SIGNAL \current_state~28_combout\ : std_logic;
SIGNAL \current_state.Select_IR_Scan~q\ : std_logic;
SIGNAL \current_state~24_combout\ : std_logic;
SIGNAL \current_state.Capture_IR~q\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL \WideOr3~combout\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \WideOr2~combout\ : std_logic;
SIGNAL \WideOr1~combout\ : std_logic;
SIGNAL \WideOr0~1_combout\ : std_logic;
SIGNAL \WideOr0~combout\ : std_logic;
SIGNAL \ALT_INV_TRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_TMS~input_o\ : std_logic;
SIGNAL \ALT_INV_WideOr0~combout\ : std_logic;
SIGNAL \ALT_INV_WideOr1~combout\ : std_logic;
SIGNAL \ALT_INV_WideOr2~combout\ : std_logic;
SIGNAL \ALT_INV_WideOr3~combout\ : std_logic;

BEGIN

ww_TCK <= TCK;
ww_TMS <= TMS;
ww_TRST <= TRST;
state <= ww_state;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\TRST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \TRST~input_o\);

\TCK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \TCK~input_o\);
\ALT_INV_TRST~inputclkctrl_outclk\ <= NOT \TRST~inputclkctrl_outclk\;
\ALT_INV_TMS~input_o\ <= NOT \TMS~input_o\;
\ALT_INV_WideOr0~combout\ <= NOT \WideOr0~combout\;
\ALT_INV_WideOr1~combout\ <= NOT \WideOr1~combout\;
\ALT_INV_WideOr2~combout\ <= NOT \WideOr2~combout\;
\ALT_INV_WideOr3~combout\ <= NOT \WideOr3~combout\;

-- Location: IOIBUF_X16_Y0_N15
\TCK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TCK,
	o => \TCK~input_o\);

-- Location: CLKCTRL_G17
\TCK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TCK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TCK~inputclkctrl_outclk\);

-- Location: IOOBUF_X24_Y0_N2
\state[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr3~combout\,
	devoe => ww_devoe,
	o => \state[0]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\state[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr2~combout\,
	devoe => ww_devoe,
	o => \state[1]~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\state[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr1~combout\,
	devoe => ww_devoe,
	o => \state[2]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\state[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr0~combout\,
	devoe => ww_devoe,
	o => \state[3]~output_o\);

-- Location: IOIBUF_X24_Y0_N8
\TMS~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TMS,
	o => \TMS~input_o\);

-- Location: LCCOMB_X24_Y1_N26
\current_state~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current_state~26_combout\ = (!\TMS~input_o\ & \current_state.Select_DR_Scan~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TMS~input_o\,
	datad => \current_state.Select_DR_Scan~q\,
	combout => \current_state~26_combout\);

-- Location: IOIBUF_X16_Y0_N22
\TRST~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TRST,
	o => \TRST~input_o\);

-- Location: CLKCTRL_G19
\TRST~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TRST~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TRST~inputclkctrl_outclk\);

-- Location: FF_X24_Y1_N27
\current_state.Capture_DR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \current_state~26_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Capture_DR~q\);

-- Location: LCCOMB_X23_Y1_N28
\WideOr6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr6~1_combout\ = (\current_state.Exit2_DR~q\) # ((\current_state.Shift_DR~q\) # (\current_state.Capture_DR~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Exit2_DR~q\,
	datac => \current_state.Shift_DR~q\,
	datad => \current_state.Capture_DR~q\,
	combout => \WideOr6~1_combout\);

-- Location: FF_X23_Y1_N29
\current_state.Shift_DR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr6~1_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Shift_DR~q\);

-- Location: LCCOMB_X24_Y1_N10
\WideOr6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr6~0_combout\ = (\current_state.Capture_DR~q\) # (\current_state.Shift_DR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.Capture_DR~q\,
	datad => \current_state.Shift_DR~q\,
	combout => \WideOr6~0_combout\);

-- Location: LCCOMB_X24_Y1_N28
\current_state.Exit1_DR~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current_state.Exit1_DR~feeder_combout\ = \WideOr6~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \WideOr6~0_combout\,
	combout => \current_state.Exit1_DR~feeder_combout\);

-- Location: FF_X24_Y1_N29
\current_state.Exit1_DR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \current_state.Exit1_DR~feeder_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \ALT_INV_TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Exit1_DR~q\);

-- Location: LCCOMB_X23_Y1_N12
\WideOr2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr2~0_combout\ = (\current_state.Pause_DR~q\) # (\current_state.Exit1_DR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.Pause_DR~q\,
	datad => \current_state.Exit1_DR~q\,
	combout => \WideOr2~0_combout\);

-- Location: LCCOMB_X23_Y1_N8
\current_state.Pause_DR~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current_state.Pause_DR~feeder_combout\ = \WideOr2~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \WideOr2~0_combout\,
	combout => \current_state.Pause_DR~feeder_combout\);

-- Location: FF_X23_Y1_N9
\current_state.Pause_DR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \current_state.Pause_DR~feeder_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Pause_DR~q\);

-- Location: LCCOMB_X24_Y1_N20
\current_state~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current_state~25_combout\ = (\TMS~input_o\ & \current_state.Pause_DR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TMS~input_o\,
	datad => \current_state.Pause_DR~q\,
	combout => \current_state~25_combout\);

-- Location: FF_X24_Y1_N21
\current_state.Exit2_DR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \current_state~25_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Exit2_DR~q\);

-- Location: LCCOMB_X24_Y1_N30
\WideOr9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr9~0_combout\ = (\current_state.Exit1_DR~q\) # (\current_state.Exit2_DR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.Exit1_DR~q\,
	datac => \current_state.Exit2_DR~q\,
	combout => \WideOr9~0_combout\);

-- Location: FF_X24_Y1_N31
\current_state.Update_DR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr9~0_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \ALT_INV_TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Update_DR~q\);

-- Location: LCCOMB_X23_Y1_N14
\WideOr11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr11~0_combout\ = (\current_state.Capture_IR~q\) # ((\current_state.Shift_IR~q\) # (\current_state.Exit2_IR~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Capture_IR~q\,
	datac => \current_state.Shift_IR~q\,
	datad => \current_state.Exit2_IR~q\,
	combout => \WideOr11~0_combout\);

-- Location: FF_X23_Y1_N15
\current_state.Shift_IR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr11~0_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Shift_IR~q\);

-- Location: LCCOMB_X24_Y1_N6
\WideOr1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr1~1_combout\ = (\current_state.Capture_IR~q\) # (\current_state.Shift_IR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.Capture_IR~q\,
	datad => \current_state.Shift_IR~q\,
	combout => \WideOr1~1_combout\);

-- Location: FF_X24_Y1_N7
\current_state.Exit1_IR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr1~1_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \ALT_INV_TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Exit1_IR~q\);

-- Location: LCCOMB_X23_Y1_N10
\WideOr2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr2~1_combout\ = (\current_state.Pause1_IR~q\) # (\current_state.Exit1_IR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.Pause1_IR~q\,
	datad => \current_state.Exit1_IR~q\,
	combout => \WideOr2~1_combout\);

-- Location: FF_X23_Y1_N11
\current_state.Pause1_IR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr2~1_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Pause1_IR~q\);

-- Location: LCCOMB_X24_Y1_N22
\current_state~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current_state~27_combout\ = (\TMS~input_o\ & \current_state.Pause1_IR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TMS~input_o\,
	datad => \current_state.Pause1_IR~q\,
	combout => \current_state~27_combout\);

-- Location: FF_X24_Y1_N23
\current_state.Exit2_IR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \current_state~27_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Exit2_IR~q\);

-- Location: LCCOMB_X24_Y1_N24
\WideOr3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = (\current_state.Exit2_IR~q\) # (\current_state.Exit1_IR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.Exit2_IR~q\,
	datad => \current_state.Exit1_IR~q\,
	combout => \WideOr3~0_combout\);

-- Location: FF_X24_Y1_N25
\current_state.Update_IR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr3~0_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \ALT_INV_TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Update_IR~q\);

-- Location: LCCOMB_X23_Y1_N22
\Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ((\current_state.Test_Logic_Reset~q\ & !\current_state.Select_IR_Scan~q\)) # (!\TMS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TMS~input_o\,
	datac => \current_state.Test_Logic_Reset~q\,
	datad => \current_state.Select_IR_Scan~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X23_Y1_N23
\current_state.Test_Logic_Reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Test_Logic_Reset~q\);

-- Location: LCCOMB_X23_Y1_N24
\WideOr10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr10~0_combout\ = (\current_state.Update_DR~q\) # (((\current_state.Run_Test_Idle~q\) # (\current_state.Update_IR~q\)) # (!\current_state.Test_Logic_Reset~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Update_DR~q\,
	datab => \current_state.Test_Logic_Reset~q\,
	datac => \current_state.Run_Test_Idle~q\,
	datad => \current_state.Update_IR~q\,
	combout => \WideOr10~0_combout\);

-- Location: FF_X23_Y1_N25
\current_state.Run_Test_Idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr10~0_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Run_Test_Idle~q\);

-- Location: LCCOMB_X24_Y1_N12
\WideOr5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr5~0_combout\ = (\current_state.Update_DR~q\) # ((\current_state.Update_IR~q\) # (\current_state.Run_Test_Idle~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.Update_DR~q\,
	datac => \current_state.Update_IR~q\,
	datad => \current_state.Run_Test_Idle~q\,
	combout => \WideOr5~0_combout\);

-- Location: FF_X24_Y1_N13
\current_state.Select_DR_Scan\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \WideOr5~0_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	sclr => \ALT_INV_TMS~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Select_DR_Scan~q\);

-- Location: LCCOMB_X24_Y1_N18
\current_state~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current_state~28_combout\ = (\TMS~input_o\ & \current_state.Select_DR_Scan~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TMS~input_o\,
	datad => \current_state.Select_DR_Scan~q\,
	combout => \current_state~28_combout\);

-- Location: FF_X24_Y1_N19
\current_state.Select_IR_Scan\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \current_state~28_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Select_IR_Scan~q\);

-- Location: LCCOMB_X24_Y1_N2
\current_state~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \current_state~24_combout\ = (!\TMS~input_o\ & \current_state.Select_IR_Scan~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TMS~input_o\,
	datad => \current_state.Select_IR_Scan~q\,
	combout => \current_state~24_combout\);

-- Location: FF_X24_Y1_N3
\current_state.Capture_IR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TCK~inputclkctrl_outclk\,
	d => \current_state~24_combout\,
	clrn => \ALT_INV_TRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Capture_IR~q\);

-- Location: LCCOMB_X24_Y1_N4
\WideOr0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = (!\current_state.Capture_DR~q\ & (\current_state.Test_Logic_Reset~q\ & (!\current_state.Exit2_DR~q\ & !\current_state.Exit1_DR~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Capture_DR~q\,
	datab => \current_state.Test_Logic_Reset~q\,
	datac => \current_state.Exit2_DR~q\,
	datad => \current_state.Exit1_DR~q\,
	combout => \WideOr0~0_combout\);

-- Location: LCCOMB_X24_Y1_N16
WideOr3 : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr3~combout\ = (\current_state.Capture_IR~q\) # ((\WideOr3~0_combout\) # ((\current_state.Run_Test_Idle~q\) # (!\WideOr0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Capture_IR~q\,
	datab => \WideOr3~0_combout\,
	datac => \WideOr0~0_combout\,
	datad => \current_state.Run_Test_Idle~q\,
	combout => \WideOr3~combout\);

-- Location: LCCOMB_X24_Y1_N0
\WideOr1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = (!\current_state.Select_IR_Scan~q\ & (\current_state.Test_Logic_Reset~q\ & (!\current_state.Run_Test_Idle~q\ & !\current_state.Select_DR_Scan~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Select_IR_Scan~q\,
	datab => \current_state.Test_Logic_Reset~q\,
	datac => \current_state.Run_Test_Idle~q\,
	datad => \current_state.Select_DR_Scan~q\,
	combout => \WideOr1~0_combout\);

-- Location: LCCOMB_X23_Y1_N18
WideOr2 : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr2~combout\ = ((\current_state.Pause1_IR~q\) # ((\WideOr2~0_combout\) # (\current_state.Exit1_IR~q\))) # (!\WideOr1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr1~0_combout\,
	datab => \current_state.Pause1_IR~q\,
	datac => \WideOr2~0_combout\,
	datad => \current_state.Exit1_IR~q\,
	combout => \WideOr2~combout\);

-- Location: LCCOMB_X23_Y1_N20
WideOr1 : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr1~combout\ = ((\WideOr6~0_combout\) # ((\current_state.Shift_IR~q\) # (\current_state.Capture_IR~q\))) # (!\WideOr1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr1~0_combout\,
	datab => \WideOr6~0_combout\,
	datac => \current_state.Shift_IR~q\,
	datad => \current_state.Capture_IR~q\,
	combout => \WideOr1~combout\);

-- Location: LCCOMB_X24_Y1_N8
\WideOr0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~1_combout\ = (\current_state.Select_DR_Scan~q\) # ((\current_state.Update_DR~q\) # ((\current_state.Shift_DR~q\) # (\current_state.Pause_DR~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Select_DR_Scan~q\,
	datab => \current_state.Update_DR~q\,
	datac => \current_state.Shift_DR~q\,
	datad => \current_state.Pause_DR~q\,
	combout => \WideOr0~1_combout\);

-- Location: LCCOMB_X24_Y1_N14
WideOr0 : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~combout\ = (\current_state.Capture_DR~q\) # (((\WideOr9~0_combout\) # (\WideOr0~1_combout\)) # (!\current_state.Test_Logic_Reset~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Capture_DR~q\,
	datab => \current_state.Test_Logic_Reset~q\,
	datac => \WideOr9~0_combout\,
	datad => \WideOr0~1_combout\,
	combout => \WideOr0~combout\);

ww_state(0) <= \state[0]~output_o\;

ww_state(1) <= \state[1]~output_o\;

ww_state(2) <= \state[2]~output_o\;

ww_state(3) <= \state[3]~output_o\;
END structure;


