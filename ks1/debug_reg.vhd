library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debug_reg is
    Port ( read : in std_logic;
           write : in std_logic;
           din : in std_logic_vector(63 downto 0);
		   addr : in std_logic_vector(2 downto 0);
           dout : out std_logic_vector(63 downto 0);
		   clk : in std_logic;

		   line0 : in std_logic);
end debug_reg;

architecture Behavioral of debug_reg is

constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

signal val : std_logic_vector(63 downto 0) := HZ;

begin

dout(63 downto 32) <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
dout(28 downto 1) <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

process (clk) begin
	if rising_edge(clk) then
		if read = '1' and addr = "111" then
			dout <= val;
		else
			dout <= HZ;
			val(31 downto 29) <= addr;
		end if;

		if line0 = '1' then
			val(0) <= '1';
		elsif write = '1' then
			val(0) <= '0';
		end if;
	end if;
end process;

end Behavioral;
