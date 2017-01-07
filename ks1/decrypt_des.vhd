library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrypt is
    Port ( trial_key : in std_logic_vector(63 downto 0);
           run : in std_logic;
           ptext : out std_logic_vector(63 downto 0);
           ctext : in std_logic_vector(63 downto 0);
           clk : in std_logic);
 );
end decrypt;

architecture decrypt_des of decrypt is

begin


end decrypt_des;
