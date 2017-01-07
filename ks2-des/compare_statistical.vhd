library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- synopsys translate_off
library UNISIM;
use UNISIM.VComponents.all;
-- synopsys translate_on

entity compare_statistical_fast is
    Port ( clk : in std_logic;
		   valid : in std_logic;
           trial : in std_logic_vector(63 downto 0);
		   ptext : in std_logic_vector(63 downto 0);
           match : out std_logic);
end compare_statistical_fast;

architecture Behavioral of compare_statistical_fast is

----- Component RAMB4_S8_S8 -----
component RAMB4_S8_S8
  generic (
       INIT_00 : bit_vector := X"0000000000000000000000000000000000000500000500000000000000000000";
       INIT_01 : bit_vector := X"01000000000000000000000000000000000d010e0000000008000000000000fe";
       INIT_02 : bit_vector := X"0000000000000000020000030000000000000100000004010000000001010100";
       INIT_03 : bit_vector := X"00000000000116011a0a216a433f0112544b17300b014a3f1918872f1a115d01";
       INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000");

  port (DIA    : in STD_LOGIC_VECTOR (7 downto 0);
        DIB    : in STD_LOGIC_VECTOR (7 downto 0);
        ENA    : in STD_logic;
        ENB    : in STD_logic;
        WEA    : in STD_logic;
        WEB    : in STD_logic;
        RSTA   : in STD_logic;
        RSTB   : in STD_logic;
        CLKA   : in STD_logic;
        CLKB   : in STD_logic;
        ADDRA  : in STD_LOGIC_VECTOR (8 downto 0);
        ADDRB  : in STD_LOGIC_VECTOR (8 downto 0);
        DOA    : out STD_LOGIC_VECTOR (7 downto 0);
        DOB    : out STD_LOGIC_VECTOR (7 downto 0)); 
end component;

signal score : std_logic_vector(10 downto 0);
signal score0a, score0b, score0c, score0d : std_logic_vector(8 downto 0);
signal score1a, score1b : std_logic_vector(9 downto 0);
signal threshold : std_logic_vector(10 downto 0);

signal ra0, ra1, ra2, ra3, ra4, ra5, ra6, ra7 : std_logic_vector(8 downto 0);
signal rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7 : std_logic_vector(7 downto 0);

signal a0, a1, a2, a3, a4, a5, a6, a7 : std_logic_vector(7 downto 0) := x"00";
signal d0, d1, d2, d3, d4, d5, d6, d7 : std_logic_vector(7 downto 0);
signal va, vd, vs : std_logic := '0';

begin

ra0 <= "0" & a0; ra1 <= "0" & a1; ra2 <= "0" & a2; ra3 <= "0" & a3;
ra4 <= "0" & a4; ra5 <= "0" & a5; ra6 <= "0" & a6; ra7 <= "0" & a7; 
threshold <= ptext(10 downto 0);

process (clk) begin
	-- for each byte of the trial plaintext, sum the coefficients in the RAM
	-- if the sum is over the threshold (specified in ptext), flag a match

	if rising_edge(clk) then
		a0 <= trial(7 downto 0);
		a1 <= trial(15 downto 8);
		a2 <= trial(23 downto 16);
		a3 <= trial(31 downto 24);
		a4 <= trial(39 downto 32);
		a5 <= trial(47 downto 40);
		a6 <= trial(55 downto 48);
		a7 <= trial(63 downto 56);
		va <= valid;

		vd <= va;

		d0 <= rd0; d1 <= rd1; d2 <= rd2; d3 <= rd3; d4 <= rd4; d5 <= rd5; d6 <= rd6; d7 <= rd7;

		vs <= vd;

		if vs = '1' then
			score0a <= ("0" & d0) + ("0" & d1);
			score0b <= ("0" & d2) + ("0" & d3);
			score0c <= ("0" & d4) + ("0" & d5);
			score0d <= ("0" & d6) + ("0" & d7);
		end if;

		score1a <= ("0" & score0a) + ("0" & score0b);
		score1b <= ("0" & score0c) + ("0" & score0d);
		score <= ("0" & score1a) + ("0" & score1b);

		if score(10 downto 8) > threshold(10 downto 8) then
		--if score > threshold then
			match <= '1';
		else
			match <= '0';
		end if;
	end if;
end process;

ram0 : RAMB4_S8_S8
  port map (
        ENA => '1',
        ENB => '1',
        WEA => '0',
        WEB => '0',
		DIA => "00000000",
		DIB => "00000000",
        RSTA => '0',
        RSTB => '0',
        CLKA => clk,
        CLKB => clk,
        ADDRA => ra0,
        ADDRB => ra1,
        DOA => rd0,
        DOB => rd1); 

ram1 : RAMB4_S8_S8
  port map (
        ENA => '1',
        ENB => '1',
        WEA => '0',
        WEB => '0',
		DIA => "00000000",
		DIB => "00000000",
        RSTA => '0',
        RSTB => '0',
        CLKA => clk,
        CLKB => clk,
        ADDRA => ra2,
        ADDRB => ra3,
        DOA => rd2,
        DOB => rd3); 

ram2 : RAMB4_S8_S8
  port map (
        ENA => '1',
        ENB => '1',
        WEA => '0',
        WEB => '0',
		DIA => "00000000",
		DIB => "00000000",
        RSTA => '0',
        RSTB => '0',
        CLKA => clk,
        CLKB => clk,
        ADDRA => ra4,
        ADDRB => ra5,
        DOA => rd4,
        DOB => rd5); 

ram3 : RAMB4_S8_S8
  port map (
        ENA => '1',
        ENB => '1',
        WEA => '0',
        WEB => '0',
		DIA => "00000000",
		DIB => "00000000",
        RSTA => '0',
        RSTB => '0',
        CLKA => clk,
        CLKB => clk,
        ADDRA => ra6,
        ADDRB => ra7,
        DOA => rd6,
        DOB => rd7); 


end Behavioral;
