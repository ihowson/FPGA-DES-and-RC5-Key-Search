library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity core_addr00 is
    Port ( addr : out std_logic_vector(7 downto 0));
end core_addr00;

architecture Behavioral of core_addr00 is

begin

addr <= x"00";
end Behavioral;
