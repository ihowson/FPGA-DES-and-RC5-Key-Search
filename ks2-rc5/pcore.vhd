library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pcore is
port (
	clk: in std_logic;
	clkdiv: in std_logic;
	clk133: in std_logic;
	reset: in std_logic;
	read: in std_logic;
	write: in std_logic;
	addr: in std_logic_vector(13 downto 0);
	din: in std_logic_vector(63 downto 0);
	dout: out std_logic_vector(63 downto 0);
	dmask: in std_logic_vector(63 downto 0);
	extin: in std_logic_vector(25 downto 0);
	extout: out std_logic_vector(25 downto 0);
	extctrl: out std_logic_vector(25 downto 0) );
end pcore;

architecture ks2 of pcore is
	COMPONENT search_units
	PORT(
		clk : IN std_logic;
		addr : IN std_logic_vector(7 downto 0);
		cmd : IN std_logic;
		ctext : IN std_logic_vector(63 downto 0);
		iv : IN std_logic_vector(63 downto 0);
		ptext : IN std_logic_vector(63 downto 0);
		master : IN std_logic;    
		data : INOUT std_logic_vector(47 downto 0);      
		slave : OUT std_logic
		);
	END COMPONENT;

signal pt, ct, iv : std_logic_vector(63 downto 0);

signal dvalid : std_logic := '1';

constant ADDR_BUF : std_logic_vector(1 downto 0) := "00";
constant ADDR_CT : std_logic_vector(1 downto 0) := "01";
constant ADDR_PT : std_logic_vector(1 downto 0) := "10";
constant ADDR_IV : std_logic_vector(1 downto 0) := "11";

constant STATE_WAIT : integer := 0;
constant STATE_WRITE : integer := 1;
constant STATE_W1 : integer := 2;
constant STATE_W2 : integer := 3;
constant STATE_READ : integer := 4;
constant STATE_R1 : integer := 5;
constant STATE_R2 : integer := 6;
constant STATE_R2b : integer := 7;

constant CMD_READ : std_logic := '0';
constant CMD_WRITE : std_logic := '1';

constant HZbus : std_logic_vector(47 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

signal state : integer := STATE_WAIT;

signal dw : std_logic_vector(63 downto 0);
signal dr : std_logic_vector(47 downto 0);
signal dwreq, drreq : std_logic := '0';
signal master, slave : std_logic;
signal busd : std_logic_vector(47 downto 0);
signal busa : std_logic_vector(7 downto 0);
signal busrw : std_logic;

signal suclk : std_logic;

begin

dout <= dr & x"00" & "000" & dvalid & "0010";

suclk <= clk;

process (clk) begin
	if rising_edge(clk) then
		--dtemp <= din;

		dwreq <= write and not(addr(0)) and not(addr(1)) and din(6);
		drreq <= write and not(addr(0)) and not(addr(1)) and not(din(6));
		if write = '1' and addr(1 downto 0) = ADDR_BUF then
			dw <= din;

			--if din(6) = '1' then
				--null;
			--	dwreq <= '1';
			--else
			--	drreq <= '1';
			--end if;
		end if;

		if write = '1' and addr(1 downto 0) = ADDR_CT then
			ct <= din;
		end if;

		if write = '1' and addr(1 downto 0) = ADDR_PT then
			pt <= din;
		end if;

		if write = '1' and addr(1 downto 0) = ADDR_IV then
			iv <= din;
		end if;

--		if write = '1' then
--			case addr(1 downto 0) is 
--				when ADDR_BUF =>
--					dw <= din(63 downto 0);
  --
	--				if din(6) = '1' then
	--					dwreq <= '1';
	--				else
	--					drreq <= '1';
	--				end if;
	--			when ADDR_CT =>
	--				ct <= din;
	--			when ADDR_PT =>
	--				pt <= din;
	--			when ADDR_IV =>
	--				iv <= din;
	--			when others =>
	--				null;
	--		end case;
	--	end if;

		case state is
			when STATE_WAIT =>
				if dwreq = '1' then
					state <= STATE_WRITE;
					dvalid <= '0';
					--dw <= dtemp;
				elsif drreq = '1' then
					state <= STATE_READ;
					dvalid <= '0';
					--dw <= dtemp;
				else
					dvalid <= '1';
				end if;

				master <= '0';

			when STATE_WRITE =>
				busd <= dw(63 downto 16);
				busa <= dw(15 downto 8);
				busrw <= CMD_WRITE;
				state <= STATE_W1;

			when STATE_W1 =>
				master <= '1';

				if slave = '1' then
					state <= STATE_W2;
				end if;

			when STATE_W2 =>
				master <= '0';

				if slave = '0' then
					dwreq <= '0';
					state <= STATE_WAIT;
				end if;

			when STATE_READ =>
				busd <= HZbus;
				busa <= dw(15 downto 8);
				busrw <= CMD_READ;

				state <= STATE_R1;

			when STATE_R1 =>
				master <= '1';

				if slave = '1' then
					state <= STATE_R2;
				end if;

			when STATE_R2 =>
				master <= '0';
				dr <= busd;
				state <= STATE_R2b;
	

			when STATE_R2b =>
				if slave = '0' then
					drreq <= '0';
					state <= STATE_WAIT;
				end if;

			when others =>
				state <= STATE_WAIT;
		end case;
	end if;
end process;

	sunits: search_units PORT MAP(
		clk => suclk,
		addr => busa,
		cmd => busrw,
		ctext => ct,
		iv => iv,
		ptext => pt,
		master => master,
		slave => slave,
		data => busd
	);

end ks2;
