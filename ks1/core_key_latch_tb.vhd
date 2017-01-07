
-- VHDL Test Bench Created from source file core_key_latch.vhd -- 20:31:59 07/29/2003
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

	COMPONENT core_key_latch
	PORT(
		key : IN std_logic_vector(63 downto 0);
		write : IN std_logic;
		clk : IN std_logic;
		read : IN std_logic;
		restart : IN std_logic;    
		data : INOUT std_logic_vector(63 downto 0);      
		run : OUT std_logic
		);
	END COMPONENT;

	SIGNAL key :  std_logic_vector(63 downto 0);
	SIGNAL write :  std_logic;
	SIGNAL clk :  std_logic;
	SIGNAL read :  std_logic;
	SIGNAL restart :  std_logic;
	SIGNAL run :  std_logic;
	SIGNAL data :  std_logic_vector(63 downto 0);

BEGIN

	uut: core_key_latch PORT MAP(
		key => key,
		write => write,
		clk => clk,
		read => read,
		restart => restart,
		run => run,
		data => data
	);


-- *** Test Bench - User Defined Section ***
	tb : PROCESS
    BEGIN
   		key <= x"0000000000000001";
		write <= '0';
		read <= '0';
		restart <= '0';
		data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

		wait for 7 ns;

		restart <= '1';
		key <= x"0000000000000002";
		
		wait for 10 ns;

		key <= x"0000000000000003";
		restart <= '0';

		wait for 10 ns;

		key <= x"0000000000000004";
		write <= '1';

		wait for 10 ns;

		key <= x"0000000000000005";
		write <= '0';

		wait for 10 ns;

		key <= x"0000000000000006";
		
		wait for 10 ns;

		key <= x"0000000000000007";
		read <= '1';

		wait for 10 ns;

		key <= x"0000000000000008";
		read <= '0';



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
