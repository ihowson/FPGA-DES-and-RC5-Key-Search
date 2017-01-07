library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keygen_count is
    Port ( run : in std_logic;
           clk : in std_logic;
           count : out std_logic_vector(63 downto 0);
           data : in std_logic_vector(63 downto 0);
		   write : in std_logic);
end keygen_count;

architecture Behavioral of keygen_count is

constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
constant ZERO64 : std_logic_vector(63 downto 0) := x"0000000000000000";

signal val : std_logic_vector(63 downto 0) := ZERO64;
signal wval : std_logic_vector(63 downto 0) := ZERO64;
signal wsel : std_logic := '0';

begin

count <= val;


process (clk) begin
	if rising_edge(clk) then
		if wsel = '1' then
			val <= wval;
		elsif run = '1' then
			val <= val + 1;
		end if;
		
		if write = '1' then
			wsel <= '1';
			wval <= data;
		else
			wsel <= '0';
		end if;
	end if;
end process;

end Behavioral;
