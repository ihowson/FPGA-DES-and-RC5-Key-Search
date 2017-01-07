library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rol_v_32 is
    Port ( clk : in std_logic;
		   run : in std_logic;
		   x : in std_logic_vector(31 downto 0);
           amt : in std_logic_vector(4 downto 0);
           y : out std_logic_vector(31 downto 0));
end rol_v_32;

architecture Behavioral of rol_v_32 is

signal a0 : std_logic_vector(1 downto 0);
signal a1 : std_logic_vector(1 downto 0);
signal a2 : std_logic;

signal c1 : std_logic_vector(31 downto 0);
signal c2 : std_logic_vector(31 downto 0);

begin

a0 <= amt(1 downto 0);
a1 <= amt(3 downto 2);
a2 <= amt(4);

--process (a0, x) begin
process (clk) begin
	if rising_edge(clk) and run = '1' then
		case a0 is -- rol by 0/1/2/3
			when "00" =>
				c1 <= x;
			when "01" =>
				c1 <= x(30 downto 0) & x(31);
			when "10" =>
				c1 <= x(29 downto 0) & x(31 downto 30);
			when "11" =>
				c1 <= x(28 downto 0) & x(31 downto 29);
			when others =>
				c1 <= x;
		end case;
	end if;
end process;

process (a1, c1) begin
	case a1 is -- rol by 0/4/8/12
		when "00" =>
			c2 <= c1;
		when "01" =>
			c2 <= c1(27 downto 0) & c1(31 downto 28);
		when "10" =>
			c2 <= c1(23 downto 0) & c1(31 downto 24);
		when "11" =>
			c2 <= c1(19 downto 0) & c1(31 downto 20);
		when others =>
			c2 <= c1;
	end case;
end process;

process (a2, c2) begin
	case a2 is -- rol by 0/16
		when '0' =>
			y <= c2;
		when '1' =>
			y <= c2(15 downto 0) & c2(31 downto 16);
		when others =>
			y <= c2;
	end case;
end process;

end Behavioral;
