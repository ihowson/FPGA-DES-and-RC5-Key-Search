library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addr_terminate is
    Port ( addr : in std_logic_vector(13 downto 0);
			addr_out : out std_logic_vector(2 downto 0));
end addr_terminate;

architecture Behavioral of addr_terminate is

begin

addr_out <= addr(2 downto 0);

end Behavioral;
