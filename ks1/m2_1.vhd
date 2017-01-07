library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity m2_1 is
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end m2_1;

architecture Behavioral of m2_1 is 
begin 
process (D0,D1,S0) 
begin 
case S0 is 
when '0' => O <= D0; 
when '1' => O <= D1; 
when others => NULL; 
end case; 
end process; 
end Behavioral; 
