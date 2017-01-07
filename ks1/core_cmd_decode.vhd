library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity core_cmd_decode is
    Port ( cmd : in std_logic_vector(1 downto 0);
           addr : in std_logic_vector(3 downto 0);
		   id : in std_logic_vector(3 downto 0);
		   clk : in std_logic;

           status_read : out std_logic;
           keygen_read : out std_logic;
           keygen_write : out std_logic;
           restart : out std_logic);
end core_cmd_decode;

architecture Behavioral of core_cmd_decode is

constant CMD_NOP : std_logic_vector(1 downto 0) := "00";
constant CMD_RKEY : std_logic_vector(1 downto 0) := "01";
constant CMD_WKEY : std_logic_vector(1 downto 0) := "10";
constant CMD_RESTART : std_logic_vector(1 downto 0) := "11";

begin
process (clk) begin
	if rising_edge(clk) then
		if addr = id then
			status_read <= '1';

			if cmd = CMD_RKEY then
				keygen_read <= '1';
			else
				keygen_read <= '0';
			end if;

			if cmd = CMD_WKEY then
				keygen_write <= '1';
			else
				keygen_write <= '0';
			end if;

			if cmd = CMD_RESTART then
				restart <= '1';
			else
				restart <= '0';
			end if;
		else
			status_read <= '0';
			restart <= '0';
			keygen_read <= '0';
			keygen_write <= '0';
		end if;
	end if;
end process;

end Behavioral;
