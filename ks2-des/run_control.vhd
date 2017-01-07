library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity run_control is
    Port ( clk : in std_logic;
		   run : out std_logic;
           keywrite : in std_logic;
		   match : in std_logic;
		   keyvalid : in std_logic);
end run_control;

architecture Behavioral of run_control is
													
signal running : std_logic := '0';

begin

run <= running;

	process (clk) begin
		if rising_edge(clk) then
			case running is
				when '0' =>
					if keywrite = '1' then
						running <= '1';
					end if;
				when '1' =>
					if match = '1' or keyvalid = '0' then
						running <= '0';
					end if;
				when others =>
					running <= '0';
			end case;
		end if;
	end process;
end Behavioral;
