library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity status_pulldown is
    Port ( status : inout std_logic_vector(2 downto 0));
end status_pulldown;

architecture Behavioral of status_pulldown is
   component PULLUP 
	   port (O: out std_logic);
   end component;

attribute box_type : string;
attribute box_type of pullup : component is "black_box";

begin

   U1: PULLUP port map (O=>status(0));
   U2: PULLUP port map (O=>status(1));
   U3: PULLUP port map (O=>status(2));

end Behavioral;
