library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unused_terminate is
    Port ( clkdiv : in std_logic;
			reset : in std_logic;
           dmask : in std_logic_vector(63 downto 0);
           extin : in std_logic_vector(25 downto 0);
           extout : out std_logic_vector(25 downto 0);
           extctrl : out std_logic_vector(25 downto 0));
end unused_terminate;

architecture Behavioral of unused_terminate is

begin

	extout <= "00000000000000000000000000";

end Behavioral;
