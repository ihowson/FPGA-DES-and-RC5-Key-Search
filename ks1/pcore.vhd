library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pcore is
port (
	clk: in std_logic;
	clkdiv: in std_logic;
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

architecture keysearch1 of pcore is

signal data0 : std_logic_vector(63 downto 0);
signal data1 : std_logic_vector(63 downto 0);
signal data2 : std_logic_vector(63 downto 0);
signal data3 : std_logic_vector(63 downto 0);

signal core_data : std_logic_vector(31 downto 0);
signal core8_id : std_logic_vector(5 downto 0) := "000100";

constant HZ : std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

	COMPONENT otp_core
	PORT(
		clk : IN std_logic;
		addr : IN std_logic_vector(7 downto 0);
		id : IN std_logic_vector(5 downto 0);
		write : IN std_logic;       
		data : INOUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;




begin
	Inst_otp_core: otp_core PORT MAP(
		clk => clk,
		data => core_data,
		addr => addr(7 downto 0),
		id => core8_id,
		write => write
	);



	process (clk) begin
		if (clk = '1' and clk'event) then
			if (reset = '1') then
				core_data <= HZ;
			elsif (write = '1') then
				core_data <= din(31 downto 0);
   				case addr(7 downto 0) is
      			when "00000000" =>
					data0 <= din;
				when "00000001" =>
					data1 <= din;
				when "00000010" =>
					data2 <= din;
				when "00000011" =>
					data3 <= din;
				when others =>
					null;
		   		end case;
				
			elsif (read = '1') then
				core_data <= HZ;
   				case addr(7 downto 0) is
      			when "00000000" =>
					dout <= data0;
				when "00000001" =>
					dout <= data1;
				when "00000010" =>
					dout <= data2;
				when "00000011" =>
					dout <= data3;
				when others	=>
					dout(31 downto 0) <= core_data;
		   		end case;
			end if;
		end if;
	end process;
end bustest;
