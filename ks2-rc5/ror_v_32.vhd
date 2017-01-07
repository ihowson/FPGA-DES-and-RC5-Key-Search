library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ror_v_32 is
    Port ( clk : in std_logic;
		   run : in std_logic;
		   x : in std_logic_vector(31 downto 0);
           amt : in std_logic_vector(4 downto 0);
           y : out std_logic_vector(31 downto 0));
end ror_v_32;

architecture Behavioral of ror_v_32 is

signal a0 : std_logic_vector(1 downto 0);
signal a1 : std_logic_vector(1 downto 0);
signal a2 : std_logic;

signal c1 : std_logic_vector(31 downto 0);
signal c2 : std_logic_vector(31 downto 0);

begin

a0 <= amt(1 downto 0);
a1 <= amt(3 downto 2);
a2 <= amt(4);

process (a0, x) begin
		case a0 is -- ror by 0/1/2/3
			when "00" =>
				c1 <= x;
			when "01" =>
				c1 <= x(0) & x(31 downto 1);
			when "10" =>
				c1 <= x(1 downto 0) & x(31 downto 2);
			when "11" =>
				c1 <= x(2 downto 0) & x(31 downto 3);
			when others =>
				c1 <= x;
		end case;
end process;

process (clk) begin
	if rising_edge(clk) and run = '1' then
--process (a1, c1) begin
		case a1 is -- ror by 0/4/8/12
			when "00" =>
				c2 <= c1;
			when "01" =>
				c2 <= c1(3 downto 0) & c1(31 downto 4);
			when "10" =>
				c2 <= c1(7 downto 0) & c1(31 downto 8);
			when "11" =>
				c2 <= c1(11 downto 0) & c1(31 downto 12);
			when others =>
				c2 <= c1;
		end case;
	end if;
end process;

process (a2, c2) begin
	if a2 = '0' then
		y <= c2;
	else
		y <= c2(15 downto 0) & c2(31 downto 16);
	end if;
end process;

end Behavioral;
