library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity a5subunit is
    Port ( clk : in std_logic;
		   run : in std_logic;
           sel : in std_logic;
           state : in std_logic_vector(63 downto 0);
           keystream : out std_logic_vector(15 downto 0));
end a5subunit;

architecture Behavioral of a5subunit is

signal r1 : std_logic_vector(18 downto 0);
signal r2 : std_logic_vector(21 downto 0);
signal r3 : std_logic_vector(22 downto 0);

signal output : std_logic;

signal sh1, sh2, sh3 : std_logic; -- shift enable bits for the registers
signal f1, f2, f3 : std_logic; -- feedback bits for the registers
signal c1, c2, c3 : std_logic; -- clock bits from registers used for inverse majority function

signal ks : std_logic_vector(15 downto 0) := x"0000";

signal imajority : std_logic;

begin

c1 <= r1(8);
c2 <= r2(10);
c3 <= r3(10);

-- FIXME: make sure this is implemented as a single LUT!
imajority <= (not(c1) and not(c2) and not(c3)) or
			 (not(c1) and not(c2) and c3) or
			 (not(c1) and c2 and not(c3)) or
			 (c1 and not(c2) and not(c3));

sh1 <= imajority xor c1;
sh2 <= imajority xor c2;
sh3 <= imajority xor c3;

output <= r1(18) xor r2(21) xor r3(22);

f1 <= r1(13) xor r1(16) xor r1(17) xor r1(18);
f2 <= r2(20) xor r2(21);
f3 <= r3(7) xor r3(20) xor r3(21) xor r3(22);

process (clk) begin
	if rising_edge(clk) and run = '1' then
		if sel = '1' then
			-- load next trial key
			r1 <= state(18 downto 0);
			r2 <= state(40 downto 19);
			r3 <= state(63 downto 41);
			keystream <= ks;
		else
			if sh1 = '1' then
				r1(18 downto 1) <= r1(17 downto 0);
				r1(0) <= f1;
			end if;

			if sh2 = '1' then
				r2(21 downto 1) <= r2(20 downto 0);
				r2(0) <= f2;
			end if;

			if sh3 = '1' then
				r3(22 downto 1) <= r3(21 downto 0);
				r3(0) <= f3;
			end if;

			ks(15 downto 1) <= ks(14 downto 0);
			ks(0) <= output;

			keystream <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end if;
end process;
end Behavioral;
