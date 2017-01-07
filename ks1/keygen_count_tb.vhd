
-- VHDL Test Bench Created from source file keygen_count.vhd -- 20:48:29 07/29/2003
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

	COMPONENT keygen_count
	PORT(
		read : IN std_logic;
		write : IN std_logic;
		run : IN std_logic;
		clk : IN std_logic;    
		valid : out std_logic;
		data : INOUT std_logic_vector(63 downto 0);      
		count : OUT std_logic_vector(63 downto 0)
		);
	END COMPONENT;

	SIGNAL read :  std_logic;
	SIGNAL write :  std_logic;
	SIGNAL run :  std_logic;
	SIGNAL clk :  std_logic;
	signal valid : std_logic;
	SIGNAL count :  std_logic_vector(63 downto 0);
	SIGNAL data :  std_logic_vector(63 downto 0);

BEGIN

	uut: keygen_count PORT MAP(
		read => read,
		write => write,
		run => run,
		clk => clk,
		valid => valid,
		count => count,
		data => data
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
	BEGIN
		read <= '0';
		run <= '1';
		write <= '0';
		data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

		wait for 7 ns;

		wait for 10 ns;

		data <= "0110000000000000000000000000000000000000000000000000000000000000";
		write <= '1';

		wait for 10 ns;

		write <= '0';
		data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

		wait for 10 ns;

		wait for 10 ns;

		run <= '0';

		wait for 40 ns;

		run <= '1';
		read <= '1';

		wait for 10 ns;

		wait for 10 ns;

		run <= '0';

		wait for 10 ns;

		run <= '1';
		
		wait for 100 ns;

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
