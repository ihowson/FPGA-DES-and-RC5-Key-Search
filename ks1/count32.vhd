--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2002 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file count32.vhd when simulating
-- the core, count32. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "Coregen Users Guide".

-- The synopsys directives "translate_off/translate_on" specified
-- below are supported by XST, FPGA Express, Exemplar and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

-- synopsys translate_off
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Library XilinxCoreLib;
ENTITY count32 IS
	port (
	Q: OUT std_logic_VECTOR(31 downto 0);
	CLK: IN std_logic;
	LOAD: IN std_logic;
	L: IN std_logic_VECTOR(31 downto 0);
	SSET: IN std_logic);
END count32;

ARCHITECTURE count32_a OF count32 IS

component wrapped_count32
	port (
	Q: OUT std_logic_VECTOR(31 downto 0);
	CLK: IN std_logic;
	LOAD: IN std_logic;
	L: IN std_logic_VECTOR(31 downto 0);
	SSET: IN std_logic);
end component;

-- Configuration specification 
	for all : wrapped_count32 use entity XilinxCoreLib.C_COUNTER_BINARY_V6_0(behavioral)
		generic map(
			c_count_mode => 0,
			c_has_aset => 0,
			c_load_enable => 1,
			c_load_low => 0,
			c_count_to => "1111111111111111",
			c_sync_priority => 1,
			c_has_iv => 0,
			c_has_sclr => 0,
			c_restrict_count => 0,
			c_width => 32,
			c_has_q_thresh1 => 0,
			c_has_q_thresh0 => 0,
			c_thresh1_value => "1111111111111111",
			c_enable_rlocs => 1,
			c_has_load => 1,
			c_has_up => 0,
			c_thresh_early => 1,
			c_has_thresh1 => 0,
			c_has_thresh0 => 0,
			c_ainit_val => "11111111111111111111111111111111",
			c_has_ce => 0,
			c_pipe_stages => 0,
			c_has_aclr => 0,
			c_sync_enable => 0,
			c_has_ainit => 0,
			c_sinit_val => "0",
			c_has_sset => 1,
			c_has_sinit => 0,
			c_count_by => "0001",
			c_has_l => 1,
			c_thresh0_value => "1111111111111111");
BEGIN

U0 : wrapped_count32
		port map (
			Q => Q,
			CLK => CLK,
			LOAD => LOAD,
			L => L,
			SSET => SSET);
END count32_a;

-- synopsys translate_on

