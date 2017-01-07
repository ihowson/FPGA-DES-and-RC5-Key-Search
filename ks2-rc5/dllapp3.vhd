library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity DLLAPP3 is
	port ( CLKIN_P, RST_P : in std_logic;
		   CLK1_OUT, CLK2, LOCKED_P : out std_logic);
end DLLAPP3;


architecture XILINX of DLLAPP3 is
	signal CLKIN, CLK1, RST, CLK0, CLK2X, LOCKED : std_logic;

component CLKDLL
	port ( CLKIN, CLKFB, RST : in std_logic;
		   CLK0, CLK90, CLK180, CLK270, CLK2X, CLKDV, LOCKED : out std_logic);
end component;

component BUFGIO
	port (I : in std_logic; O : out std_logic);
end component;

component BUFG
	port (I : in std_logic; O : out std_logic);
end component;

component IBUF
	port (I : in std_logic; O : out std_logic);
end component;

component OBUF
	port (I : in std_logic; O : out std_logic);
end component;

begin

	bufgio0 : BUFGIO port map (I=>CLKIN_P, O=>CLKIN);
	ibuf0 : IBUF port map (I=>RST_P, O=>RST);
	dll0 : CLKDLL port map (CLKIN=>CLKIN, CLKFB=>CLK1, RST=>RST, CLK0=>CLK0, CLK2X=>CLK2X, LOCKED=>LOCKED);
	bufg0 : BUFG port map (I=>CLK0, O=>CLK1);
	bufg1 : BUFG port map (I=>CLK2X, O=>CLK2);
	obuf0 : OBUF port map (I=>LOCKED, O=>LOCKED_P);

	CLK1_OUT <= CLK1;
end XILINX;
