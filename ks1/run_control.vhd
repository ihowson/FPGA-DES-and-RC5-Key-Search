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
		   paused : out std_logic;
		   initialised : out std_logic;
           key_write : in std_logic;
		   match : in std_logic;
		   keyset : in std_logic;
           restart : in std_logic);
end run_control;

architecture Behavioral of run_control is
													
constant STATE_STOPPED : std_logic_vector(1 downto 0) := "00";
constant STATE_RUNNING : std_logic_vector(1 downto 0) := "01";
constant STATE_PAUSED : std_logic_vector(1 downto 0) := "10";

signal state : std_logic_vector(1 downto 0) := STATE_STOPPED;

begin

	process (clk) begin
		if rising_edge(clk) then
			case state is
				when STATE_STOPPED =>
					initialised <= '0';
					paused <= '0';
					run <= '0';

					if key_write = '1' then
						state <= STATE_RUNNING;
					else
						state <= STATE_STOPPED;
					end if;
				when STATE_RUNNING =>
					initialised <= '1';
					paused <= '0';
					run <= '1';

					if match = '1' then
						state <= STATE_PAUSED;
					elsif keyset = '0' then
						state <= STATE_STOPPED;
					else
						state <= STATE_RUNNING;
					end if;
				when STATE_PAUSED =>
					initialised <= '1';
					paused <= '1';
					run <= '0';

					if (key_write = '1') or (restart = '1') then
						state <= STATE_RUNNING;
					else
						state <= STATE_PAUSED;
					end if;

				when others =>
					state <= STATE_STOPPED;
			end case;
		end if;
	end process;
end Behavioral;
