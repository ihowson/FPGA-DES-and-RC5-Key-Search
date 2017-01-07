library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keybuffer is
    Port ( dout : out std_logic_vector(63 downto 0);
           read : in std_logic;
           addr : in std_logic_vector(2 downto 0);
           clk : in std_logic;
		   latch : in std_logic;
           write : in std_logic;
		   full : out std_logic;
		   empty : out std_logic;
           data : inout std_logic_vector(63 downto 0));
end keybuffer;

architecture Behavioral of keybuffer is

component keyfifo
	port (
	clk: IN std_logic;
	sinit: IN std_logic;
	din: IN std_logic_VECTOR(63 downto 0);
	wr_en: IN std_logic;
	rd_en: IN std_logic;
	dout: OUT std_logic_VECTOR(63 downto 0);
	full: OUT std_logic;
	empty: OUT std_logic);
end component;

signal val : std_logic_vector(63 downto 0);
signal sinit : std_logic;
signal rsel : std_logic;
constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

begin

data <= HZ;

process (clk) begin
	if rising_edge(clk) then

		rsel <= not(addr(2)) and not(addr(1)) and addr(0) and read;
		
		if addr = "001" then
			if read = '1' then			
				dout <= val;
			else
				dout <= HZ;
			end if;
			
			if write = '1' then
				sinit <= '1';
			else
				sinit <= '0';
			end if;
		end if;
	end if;
end process;

fifo: keyfifo
   port map (
       clk => clk,
	   din => data,
	   wr_en => latch,
	   rd_en => rsel,
	   dout => val,
	   full => full,
	   sinit => sinit,
	   empty => empty
           );

end Behavioral;
