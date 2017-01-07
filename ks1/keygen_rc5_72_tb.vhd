
-- VHDL Test Bench Created from source file keygen.vhd -- 15:08:07 09/17/2003
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

	COMPONENT keygen
	PORT(
		nextkey : IN std_logic;
		clk : IN std_logic;
		data : IN std_logic_vector(39 downto 0);
		write : IN std_logic;          
		count : OUT std_logic_vector(71 downto 0);
		set : OUT std_logic
		);
	END COMPONENT;

	SIGNAL nextkey :  std_logic;
	SIGNAL clk :  std_logic;
	SIGNAL count :  std_logic_vector(71 downto 0);
	SIGNAL data :  std_logic_vector(39 downto 0);
	SIGNAL set :  std_logic;
	SIGNAL write :  std_logic;

BEGIN

	uut: keygen PORT MAP(
		nextkey => nextkey,
		clk => clk,
		count => count,
		data => data,
		set => set,
		write => write
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
   		nextkey <= '0';
		write <= '0';
		wait for 7 ns;

		wait for 10 ns;
		data <= x"FFFFFFFFFE";
		write <= '1';

		wait for 10 ns;
		write <= '0';

		wait for 20 ns;

		nextkey <= '1';
		wait for 10 ns;

		nextkey <= '0';

		wait for 20 ns;

		nextkey <= '1';
		wait for 10 ns;

		nextkey <= '0';

		wait for 20 ns;

		nextkey <= '1';
		wait for 10 ns;

		nextkey <= '0';



		wait for 10 ns;

		write <= '1';
		wait for 10 ns;
		write <= '0';
		wait for 200 ns;

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
