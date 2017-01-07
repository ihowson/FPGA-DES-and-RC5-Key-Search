library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg5 is
    Port ( clk : in std_logic;
           en : in std_logic;
		   reset : in std_logic;
           d : in std_logic_vector(4 downto 0);
           q : out std_logic_vector(4 downto 0));
end reg5;

architecture Behavioral of reg5 is

begin

process (clk) begin
	if rising_edge(clk) and en = '1' then
		if reset = '1' then
			q <= "00000";
		else
			q <= d;
		end if;
	end if;
end process;

end Behavioral;
