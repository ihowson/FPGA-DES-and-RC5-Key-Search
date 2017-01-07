library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( clk : in std_logic;
           run : in std_logic;
           valid : out std_logic := '0';
           count : out std_logic_vector(79 downto 0);
           load : in std_logic;
           data : in std_logic_vector(47 downto 0);
           nextkey : in std_logic);
end counter;

architecture split_counter80 of counter is

signal msv : std_logic_vector(47 downto 0);
signal lsv : std_logic_vector(31 downto 0) := x"00000001";

signal prevmsb : std_logic := '0';

begin

count <= msv & lsv;

process (clk) begin
	if rising_edge(clk) then
		if load = '1' then
			valid <= '1';
			msv <= data;
			--lsv <= x"00000001";
			prevmsb <= '0';
		elsif run = '1' and nextkey = '1' then
			prevmsb <= lsv(31);
			lsv <= lsv + 1;
			if lsv(31) = '0' and lsv(31) /= prevmsb then
				valid <= '0';
			end if;
		end if;
	end if;
end process;

end split_counter80;
