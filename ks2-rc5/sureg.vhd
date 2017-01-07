library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sureg is
    Port ( read : in std_logic;
		   keyvalid : in std_logic;
		   match : in std_logic;
		   run : in std_logic;
		   selwrite : in std_logic;
           data : inout std_logic_vector(47 downto 0);
           key : in std_logic_vector(31 downto 0);
           clk : in std_logic);
end sureg;

architecture Behavioral of sureg is
constant HZ : std_logic_vector(47 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

signal hadmatch : std_logic := '0';
begin

process (clk) begin
	if rising_edge(clk) then
		if match = '1' then
			hadmatch <= '1';
		end if;
		--elsif run = '1' then
		--	hadmatch <= '0';
		--end if;

		if read = '1' then
			data <= key & "000000000000" & selwrite & hadmatch & run & keyvalid;
		else
			data <= HZ;
		end if;
	end if;
end process;
end Behavioral;
