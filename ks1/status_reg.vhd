library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity status_reg is
    Port ( din : in std_logic_vector(63 downto 0);
           dout : out std_logic_vector(63 downto 0);
           read : in std_logic;
           write : in std_logic;
		   clk : in std_logic;
		   buf_full : in std_logic;
           addr : in std_logic_vector(2 downto 0);
		   corestatus : in std_logic_vector(2 downto 0);
           latch : in std_logic;
           dvalid : in std_logic;
		   buf_empty : in std_logic);
end status_reg;

architecture Behavioral of status_reg is

signal val : std_logic_vector(63 downto 0);
constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

begin
	val(3 downto 0) <= "0001";
	val(4) <= buf_full;
	val(5) <= dvalid;
	--val(6) <= corepresent (reminder)
	--val(7) <= corerunning (reminder)
	val(8) <= buf_empty;
	val(63 downto 9) <= "0000000000000000000000000000000000000000000000000000000";

	process (clk) begin
		if rising_edge(clk) then
			if addr = "000" and read = '1' then
				dout <= val;
			else
				dout <= HZ;
			end if;
			
			if latch = '1' then
				val(7) <= corestatus(1);
				val(6) <= not(corestatus(0)); -- COREPRESENT is active low
			end if;
		end if;
	end process;

end Behavioral;
