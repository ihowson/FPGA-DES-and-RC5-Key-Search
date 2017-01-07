library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity core_controller is
    Port ( din : in std_logic_vector(63 downto 0);
           dout : out std_logic_vector(63 downto 0);
           read : in std_logic;
           write : in std_logic;
		   clk : in std_logic;
		   buf_full : in std_logic;    
           addr : in std_logic_vector(2 downto 0);
           status : in std_logic_vector(2 downto 0);
           data : inout std_logic_vector(63 downto 0);
           coreaddr : out std_logic_vector(3 downto 0);
           cmd : out std_logic_vector(1 downto 0);
           dvalid : out std_logic;
		   status_write : out std_logic;
		   ctext : out std_logic_vector(63 downto 0);
		   ptext : out std_logic_vector(63 downto 0);
		   iv : out std_logic_vector(63 downto 0);
		   buf_write : out std_logic);
end core_controller;

architecture Behavioral of core_controller is

constant STATE_INIT : std_logic_vector(3 downto 0) := x"0";
constant STATE_POLL_ADDR : std_logic_vector(3 downto 0) := x"1";
constant STATE_POLL_WAIT1 : std_logic_vector(3 downto 0) := x"b";
constant STATE_POLL_WAIT2 : std_logic_vector(3 downto 0) := x"2";
constant STATE_POLL_STAT : std_logic_vector(3 downto 0) := x"3";
constant STATE_POLL_RWAIT : std_logic_vector(3 downto 0) := x"4";
constant STATE_POLL_BUFWRITE : std_logic_vector(3 downto 0) := x"9";
constant STATE_CMD_SEND : std_logic_vector(3 downto 0) := x"5";
constant STATE_CMD_WAIT : std_logic_vector(3 downto 0) := x"6";
constant STATE_CMD_LATCH : std_logic_vector(3 downto 0) := x"7";
constant STATE_CMD_WRITE : std_logic_vector(3 downto 0) := x"8";
constant STATE_CMD_WAIT2 : std_logic_vector(3 downto 0) := x"a";

constant ADDR_CTEXT: std_logic_vector(2 downto 0) := "010";
constant ADDR_PTEXT: std_logic_vector(2 downto 0) := "011";
constant ADDR_CORESEL: std_logic_vector(2 downto 0) := "100";
constant ADDR_COREKEY: std_logic_vector(2 downto 0) := "101";
constant ADDR_IV: std_logic_vector(2 downto 0) := "110";

constant CMD_NOP : std_logic_vector(1 downto 0) := "00";
constant CMD_RKEY : std_logic_vector(1 downto 0) := "01";
constant CMD_WKEY : std_logic_vector(1 downto 0) := "10";
constant CMD_RESTART : std_logic_vector(1 downto 0) := "11";

constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

constant ZERO8 : std_logic_vector(7 downto 0) := x"00";
constant ZERO4 : std_logic_vector(3 downto 0) := x"0";

signal state : std_logic_vector(3 downto 0) := STATE_INIT;
signal val : std_logic_vector(63 downto 0);
signal currentcore : std_logic_vector(3 downto 0) := x"0";
signal core_present : std_logic;
signal core_haskey : std_logic;
signal core_paused : std_logic;
signal pending_cmd : std_logic := '0';
signal pending_data : std_logic_vector(63 downto 0) := x"0000000000000000";
signal pending_addr : std_logic_vector(2 downto 0) := "000";

signal coresel : std_logic_vector(3 downto 0) := x"0";

begin

core_present <= not(status(0));
core_haskey <= status(1);
core_paused <= status(2);

process (clk) begin
	if rising_edge(clk) then
		if read = '1' and addr = ADDR_COREKEY then
			dout <= val;
		else
			dout <= HZ;
		end if;

		if write = '1' and (addr = ADDR_CTEXT or addr = ADDR_PTEXT or addr = ADDR_IV or addr = ADDR_CORESEL or addr = ADDR_COREKEY) then
			pending_data <= din;
			pending_addr <= addr;
			pending_cmd <= '1';
			dvalid <= '0';
		end if;

		-- procedure for polling a core:
		-- INIT check if there are any commands waiting to execute. If not, and if the buffer is not full:
		-- POLL_ADDR set the core address
		-- POLL_WAIT wait one cycle for the core to respond
		-- POLL_STAT if core is present AND core is paused AND core has been initialised set Read Latch command, otherwise return to start
		-- POLL_RWAIT wait one cycle for the core to respond, tell the buffer to latch on the next cycle, restart the core

		-- signals to control:
		-- data coreaddr cmd dvalid status_write buf_write state val 
		-- currentcore pending_cmd pending_data pending_addr

		case state is
			when STATE_INIT =>
				data <= HZ;
				coreaddr <= ZERO4;
				cmd <= CMD_NOP;
				-- dvalid
				status_write <= '0';
				buf_write <= '0';
				currentcore <= currentcore + 1;				

				if pending_cmd = '1' then
					state <= STATE_CMD_SEND;
				elsif buf_full = '0' then
					state <= STATE_POLL_ADDR;
				else
					state <= STATE_INIT;
				end if;

			when STATE_POLL_ADDR =>
				coreaddr <= currentcore;
				state <= STATE_POLL_WAIT1;
				
			when STATE_POLL_WAIT1 =>
				state <= STATE_POLL_WAIT2;

			when STATE_POLL_WAIT2 =>
				state <= STATE_POLL_STAT;

			when STATE_POLL_STAT =>
				if core_present = '1' and core_haskey = '1' and core_paused = '1' then
					cmd <= CMD_RKEY;
					state <= STATE_POLL_RWAIT;
				else
					state <= STATE_INIT;
				end if;

			when STATE_POLL_RWAIT =>
				cmd <= CMD_RESTART;
				state <= STATE_POLL_BUFWRITE;

			when STATE_POLL_BUFWRITE =>
				cmd <= CMD_NOP;
				buf_write <= '1';
				state <= STATE_INIT;

			when STATE_CMD_SEND =>
				pending_cmd <= '0';
				case pending_addr is
					when ADDR_CTEXT =>
						state <= STATE_INIT;
						dvalid <= '1';
						ctext <= pending_data;
					when ADDR_PTEXT =>
						dvalid <= '1';
						state <= STATE_INIT;
						ptext <= pending_data;
					when ADDR_IV =>
						dvalid <= '1';
						state <= STATE_INIT;
						iv <= pending_data;
					when ADDR_CORESEL =>
						data <= HZ;
						coreaddr <= pending_data(3 downto 0);
						coresel <= pending_data(3 downto 0);
						cmd <= CMD_RKEY;
						state <= STATE_CMD_WAIT;
					when ADDR_COREKEY =>
						cmd <= CMD_WKEY;
						state <= STATE_CMD_WRITE;
						coreaddr <= coresel;
					when others =>
						null;
				end case;

			when STATE_CMD_WRITE =>
				data <= pending_data;
				cmd <= CMD_NOP;
				dvalid <= '1';
				state <= STATE_INIT;

			when STATE_CMD_WAIT =>
				state <= STATE_CMD_WAIT2;
				cmd <= CMD_NOP;

			when STATE_CMD_WAIT2 =>
				status_write <= '1';
				state <= STATE_CMD_LATCH;

			when STATE_CMD_LATCH =>
				status_write <= '0';
				val <= data;
				dvalid <= '1';
				state <= STATE_INIT;

			when others =>
				state <= STATE_INIT;

		end case;
	end if;
end process;

end Behavioral;
