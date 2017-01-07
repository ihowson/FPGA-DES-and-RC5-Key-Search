library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg32 is
    Port ( d : in std_logic_vector(31 downto 0);
           q : out std_logic_vector(31 downto 0);
           en : in std_logic;
           clk : in std_logic);
end reg32;

architecture Behavioral of reg32 is

begin

process (clk) begin
	if rising_edge(clk) and en = '1' then
		q <= d;
	end if;
end process;

end Behavioral;
