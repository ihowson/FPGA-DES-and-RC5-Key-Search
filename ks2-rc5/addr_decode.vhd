library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addr_decode is
    Port ( addr : in std_logic_vector(3 downto 0);
           readin : in std_logic;
           writein : in std_logic;
           id : in std_logic_vector(3 downto 0);
		   readout : out std_logic;
		   writeout : out std_logic);
end addr_decode;

architecture Behavioral of addr_decode is

signal sel : std_logic;

begin

process(addr, id) begin
	if addr = id then
		sel <= '1';
	else
		sel <= '0';
	end if;
end process;

readout <= sel and readin;
writeout <= sel and writein;


end Behavioral;
