
-- VHDL Test Bench Created from source file keybuffer.vhd -- 22:54:59 07/30/2003
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT keybuffer
	PORT(
		read : IN std_logic;
		addr : IN std_logic_vector(2 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;
		write : IN std_logic;
		data : IN std_logic_vector(63 downto 0);          
		dout : OUT std_logic_vector(63 downto 0);
		count : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL dout :  std_logic_vector(63 downto 0);
	SIGNAL read :  std_logic;
	SIGNAL addr :  std_logic_vector(2 downto 0);
	SIGNAL clk :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL write :  std_logic;
	SIGNAL count :  std_logic_vector(7 downto 0);
	SIGNAL data :  std_logic_vector(63 downto 0);

BEGIN

	uut: keybuffer PORT MAP(
		dout => dout,
		read => read,
		addr => addr,
		clk => clk,
		reset => reset,
		write => write,
		count => count,
		data => data
	);


-- *** Test Bench - User Defined Section ***
	tb : PROCESS
	BEGIN
		read <= '0';
		addr <= "001";
		reset <= '0';
		write <= '0';
		data <= x"0000000000000000";
		
		wait for 7 ns;

		reset <= '1';

		wait for 10 ns;

		reset <= '0';

		wait for 10 ns;

		data <= x"bbbbbbbbbbbbbbbb";
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 10 ns;

		data <= x"ffffffffffffffff";
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 10 ns;

		wait for 10 ns;

		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 10 ns;
		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 10 ns;

		read <= '1';

		wait for 10 ns;

		read <= '0';


		reset <= '1';

		wait for 10 ns;

		reset <= '0';

		wait for 10 ns;

		wait for 10 ns;

		wait; -- will wait forever
	END PROCESS;

	process begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
-- *** End Test Bench - User Defined Section ***

END;
