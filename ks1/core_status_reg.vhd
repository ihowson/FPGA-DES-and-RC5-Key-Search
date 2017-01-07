library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

-- status(0): set if core is present
-- status(1): set if core has been initialised
-- status(2): set if core is paused

entity core_status_reg is
    Port ( clk : in std_logic;
           read : in std_logic;
		   initialised : in std_logic;
		   paused : in std_logic;
           status : out std_logic_vector(2 downto 0));
end core_status_reg;

architecture Behavioral of core_status_reg is

signal val : std_logic_vector(2 downto 0);

begin

val(0) <= '0';
val(1) <= initialised;
val(2) <= paused;

process (clk) begin
	if rising_edge(clk) then
		if read = '1' then
			status <= val;
		else
			status <= "ZZZ";
		end if;
	end if;
end process;

end Behavioral;
