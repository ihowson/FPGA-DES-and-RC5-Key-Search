library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decryptxor is
    Port ( trial_key : in std_logic_vector(63 downto 0);
           run : in std_logic;
           ptext : out std_logic_vector(63 downto 0);
           ctext : in std_logic_vector(63 downto 0);
           clk : in std_logic);
end decryptxor;

architecture decrypt_xor of decryptxor is

begin
process (clk) begin
	if rising_edge(clk) and run = '1' then
		ptext <= ctext xor trial_key;
	end if;
end process;

end decrypt_xor;
