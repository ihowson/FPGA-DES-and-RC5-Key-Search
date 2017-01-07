library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity core_address_decode is
    Port ( addr : in std_logic_vector(7 downto 0);
           id : in std_logic_vector(7 downto 0);
           cs : out std_logic);
end core_address_decode;

architecture Behavioral of core_address_decode is

begin
process (addr, id) begin
	if addr = id then
		cs <= '1';
	else
		cs <= '0';
	end if;
end process;

end Behavioral;
