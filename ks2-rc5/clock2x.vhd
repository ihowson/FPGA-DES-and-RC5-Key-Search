library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity dll_standard is
    port (CLKIN : in  std_logic;
          CLK2X : out std_logic);
end dll_standard;

architecture structural of dll_standard is

signal CLK2Xs, CLK2X_g : std_logic;

begin 

--clkpad : IBUFG  port map (I=>CLKIN, O=>CLKIN_w);

dll2x  : CLKDLL port map (CLKIN=>CLKIN, RST=>'0',
                          CLK2X=>CLK2Xs, CLKFB=>CLK2Xs);
clk2xg : BUFG   port map (I=>CLK2Xs,   O=>CLK2X_g);

clk2x <= clk2x_g;

end structural;



