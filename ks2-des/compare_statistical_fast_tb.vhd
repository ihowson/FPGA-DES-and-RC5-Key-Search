
-- VHDL Test Bench Created from source file compare_statistical_fast.vhd -- 15:56:58 10/01/2003
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

	COMPONENT compare_statistical_fast
	PORT(
		clk : IN std_logic;
		valid : IN std_logic;
		trial : IN std_logic_vector(63 downto 0);
		ptext : IN std_logic_vector(63 downto 0);          
		match : OUT std_logic
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL valid :  std_logic;
	SIGNAL trial :  std_logic_vector(63 downto 0);
	SIGNAL ptext :  std_logic_vector(63 downto 0);
	SIGNAL match :  std_logic;

BEGIN

	uut: compare_statistical_fast PORT MAP(
		clk => clk,
		valid => valid,
		trial => trial,
		ptext => ptext,
		match => match
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
   		valid <= '0';
		ptext <= x"0000000000000100";

		wait for 17 ns;

		valid <= '1';
		trial <= x"206568545e6b6e75"; -- english text

		wait for 10 ns;

		trial <= x"03fe17eb0f2ebdd2"; -- garbage
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
