library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keygen is
    Port ( nextkey : in std_logic;
           clk : in std_logic;
           count : out std_logic_vector(71 downto 0);
           data : in std_logic_vector(39 downto 0);
		   set : out std_logic := '0';
		   write : in std_logic);
end keygen;

architecture rc5_72 of keygen is

constant ZERO32 : std_logic_vector(31 downto 0) := x"00000000";
constant ZERO40 : std_logic_vector(39 downto 0) := x"0000000000";

signal val : std_logic_vector(31 downto 0) := ZERO32;
signal blk : std_logic_vector(39 downto 0) := ZERO40;

begin

count <= blk & val;


process (clk) begin
	if rising_edge(clk) then
		if write = '1' then
			-- only the lower 40 bits of the input data are used
			blk <= data;
			val <= ZERO32;
			set <= '1';
		elsif nextkey = '1' then
			val <= val + 1;

			if val = x"FFFFFFFF" then
				set <= '0';
			else
			end if;
		end if;
	end if;
end process;

end rc5_72;
