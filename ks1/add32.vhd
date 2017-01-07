library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add32 is
    Port ( a : in std_logic_vector(31 downto 0);
           b : in std_logic_vector(31 downto 0);
           x : out std_logic_vector(31 downto 0));
end add32;

architecture Behavioral of add32 is

begin
x <= a + b;

end Behavioral;
