library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ramtest is
    Port ( clk : in std_logic;
           run : in std_logic);
end ramtest;


architecture Behavioral of ramtest is

signal di : std_logic_vector(15 downto 0);
signal we : std_logic;
signal addr : std_logic_vector(7 downto 0);
signal do : std_logic_vector(15 downto 0);

----- Component RAMB4_S16 -----
component RAMB4_S16
--
  generic (
       INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000");

--
  port (DI     : in STD_LOGIC_VECTOR (15 downto 0);
        EN     : in STD_logic;
        WE     : in STD_logic;
        RST    : in STD_logic;
        CLK    : in STD_logic;
        ADDR   : in STD_LOGIC_VECTOR (7 downto 0);
        DO     : out STD_LOGIC_VECTOR (15 downto 0)); 
end component;

begin

di <= x"0000";
we <= '0';

process (clk) begin

	if rising_edge(clk) and run = '1' then

		addr <= do(7 downto 0);

	end if;

end process;
 
ram: ramb4_s16
   port map (
       di => di,
       en => '1',
	   we => we,
	   rst => '0',
	   clk => clk,
	   addr => addr,
	   do => do
           );
 



end Behavioral;
