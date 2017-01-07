library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrypt is
    Port ( trial_key : in std_logic_vector(63 downto 0);
           run : in std_logic;
           ptext : out std_logic_vector(63 downto 0);
           ctext : in std_logic_vector(63 downto 0);
           clk : in std_logic);
end decrypt;

architecture decrypt_a5 of decrypt is

component a5subunit
    Port ( clk : in std_logic;
		   run : in std_logic;
           sel : in std_logic;
           state : in std_logic_vector(63 downto 0);
           keystream : out std_logic_vector(15 downto 0));
end component;

signal unitsel : std_logic_vector(16 downto 0) := "00000000000000001";
signal stream : std_logic_vector(15 downto 0);

begin

ptext(63 downto 16) <= x"000000000000";

process (clk) begin
	if rising_edge(clk) and run = '1' then
		unitsel(16 downto 1) <= unitsel(15 downto 0);
		unitsel(0) <= unitsel(16);

		ptext(15 downto 0) <= stream xor ctext(15 downto 0);
	end if;
end process;

G0: for I in 0 to 16 generate
unit: a5subunit
   port map (
       clk => clk,
       run => run,
	   sel => unitsel(I),
	   state => trial_key,
	   keystream => stream
           );
end generate;

end decrypt_a5;
