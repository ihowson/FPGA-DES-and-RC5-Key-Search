library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compare_exact is
    Port ( clk : in std_logic;
		   valid : in std_logic;
           trial : in std_logic_vector(63 downto 0);
           ptext : in std_logic_vector(63 downto 0);
           match : out std_logic);
end compare_exact;

architecture Behavioral of compare_exact is
begin
process (clk) begin
	if rising_edge(clk) then
		if trial = ptext then
			match <= valid;
		else
			match <= '0';
		end if;	
	end if;
end process;

end Behavioral;
