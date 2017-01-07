library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rol_3_32 is
    Port ( x : in std_logic_vector(31 downto 0);
           y : out std_logic_vector(31 downto 0));
end rol_3_32;

architecture Behavioral of rol_3_32 is

begin

	y(31 downto 3) <= x(28 downto 0);
	y(2 downto 0) <= x(31 downto 29);

end Behavioral;
