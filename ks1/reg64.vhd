library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg64 is
    Port ( d : inout std_logic_vector(63 downto 0);
           q : out std_logic_vector(63 downto 0);
           clk : in std_logic;
           en : in std_logic);
end reg64;

architecture Behavioral of reg64 is

begin

	d <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

	process (clk) begin
		if rising_edge(clk) and en = '1' then
			q <= d;
		end if;
	end process;

end Behavioral;
