library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keygen_reg is
    Port ( read : in std_logic;
           data : inout std_logic_vector(63 downto 0);
           key : in std_logic_vector(71 downto 0);
           clk : in std_logic);
end keygen_reg;

architecture Behavioral of keygen_reg is
constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
begin

process (clk) begin
	if rising_edge(clk) then
		if read = '1' then
			data <= key(63 downto 0);
		else
			data <= HZ;
		end if;
	end if;
end process;
end Behavioral;
