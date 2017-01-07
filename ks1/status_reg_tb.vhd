
-- VHDL Test Bench Created from source file status_reg.vhd -- 22:00:30 07/30/2003
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

	COMPONENT status_reg
	PORT(
		din : IN std_logic_vector(63 downto 0);
		read : IN std_logic;
		write : IN std_logic;
		clk : IN std_logic;
		addr : IN std_logic_vector(2 downto 0);
		corestatus : IN std_logic_vector(1 downto 0);
		latch : IN std_logic;
		dvalid : IN std_logic;
		keycount : IN std_logic_vector(7 downto 0);          
		dout : OUT std_logic_vector(63 downto 0);
		reset : OUT std_logic
		);
	END COMPONENT;

	SIGNAL din :  std_logic_vector(63 downto 0);
	SIGNAL dout :  std_logic_vector(63 downto 0);
	SIGNAL read :  std_logic;
	SIGNAL write :  std_logic;
	SIGNAL clk :  std_logic;
	SIGNAL addr :  std_logic_vector(2 downto 0);
	SIGNAL corestatus :  std_logic_vector(1 downto 0);
	SIGNAL reset :  std_logic;
	SIGNAL latch :  std_logic;
	SIGNAL dvalid :  std_logic;
	SIGNAL keycount :  std_logic_vector(7 downto 0);

BEGIN

	uut: status_reg PORT MAP(
		din => din,
		dout => dout,
		read => read,
		write => write,
		clk => clk,
		addr => addr,
		corestatus => corestatus,
		reset => reset,
		latch => latch,
		dvalid => dvalid,
		keycount => keycount
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		din <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";
		read <= '0';
		write <= '0';
		addr <= "111";
		corestatus <= "11";
		latch <= '0';
		dvalid <= '1';
		keycount <= x"11";

		wait for 7 ns;

		wait for 10 ns;

		din <= "0000000000000000000000000000000000000000000000000000000000000001";
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 10 ns;

		addr <= "000";
		din <= "0000000000000000000000000000000000000000000000000000000000000001";
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 10 ns;

		din <= "0000000000000000000000000000000000000000000000000000000000000000";
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 10 ns;

		read <= '1';

		wait for 10 ns;

		corestatus <= "11";
		latch <= '1';

		wait for 10 ns;
	
		latch <= '0';

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
