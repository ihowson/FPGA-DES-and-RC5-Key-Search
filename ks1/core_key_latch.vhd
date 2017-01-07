library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity core_key_latch is
    Port ( key : in std_logic_vector(63 downto 0);
           write : in std_logic;
           clk : in std_logic;
           read : in std_logic;
		   set : out std_logic := '0';
           data : inout std_logic_vector(63 downto 0));
end core_key_latch;

architecture Behavioral of core_key_latch is
constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
signal val : std_logic_vector(63 downto 0);
begin

process (clk) begin
	if rising_edge(clk) then
		if read = '1' then
			data <= val;
			set <= '0';
		elsif write = '1' then
			data <= HZ;
			val <= key;
			set <= '1';
		else
			data <= HZ;
		end if;

	end if;
end process;

end Behavioral;
