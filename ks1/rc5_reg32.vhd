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
-- You must compile the wrapper file rc5_reg32.vhd when simulating
-- the core, rc5_reg32. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "Coregen Users Guide".

-- The synopsys directives "translate_off/translate_on" specified
-- below are supported by XST, FPGA Express, Exemplar and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

-- synopsys translate_off
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Library XilinxCoreLib;
ENTITY rc5_reg32 IS
	port (
	D: IN std_logic_VECTOR(31 downto 0);
	Q: OUT std_logic_VECTOR(31 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic;
	SCLR: IN std_logic;
	SSET: IN std_logic);
END rc5_reg32;

ARCHITECTURE rc5_reg32_a OF rc5_reg32 IS

component wrapped_rc5_reg32
	port (
	D: IN std_logic_VECTOR(31 downto 0);
	Q: OUT std_logic_VECTOR(31 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic;
	SCLR: IN std_logic;
	SSET: IN std_logic);
end component;

-- Configuration specification 
	for all : wrapped_rc5_reg32 use entity XilinxCoreLib.C_REG_FD_V6_0(behavioral)
		generic map(
			c_width => 32,
			c_has_sinit => 0,
			c_has_ce => 1,
			c_sinit_val => "00000000000000000000000000000000",
			c_ainit_val => "11111111111111111111111111111111",
			c_sync_enable => 1,
			c_has_aset => 0,
			c_enable_rlocs => 1,
			c_has_aclr => 0,
			c_has_sset => 1,
			c_sync_priority => 1,
			c_has_ainit => 0,
			c_has_sclr => 1);
BEGIN

U0 : wrapped_rc5_reg32
		port map (
			D => D,
			Q => Q,
			CLK => CLK,
			CE => CE,
			SCLR => SCLR,
			SSET => SSET);
END rc5_reg32_a;

-- synopsys translate_on

