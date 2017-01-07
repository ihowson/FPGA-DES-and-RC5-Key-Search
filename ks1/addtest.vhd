library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addtest is
    Port ( 
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		c : in std_logic_vector(31 downto 0);
		x : out std_logic_vector(31 downto 0);
		clk : in std_logic);
end addtest;

architecture Behavioral of addtest is

begin
process (clk) begin 
	x <= a + b + c;
end process;

end Behavioral;
