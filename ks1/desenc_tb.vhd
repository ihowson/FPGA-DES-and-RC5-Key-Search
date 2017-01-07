
-- VHDL Test Bench Created from source file desenc.vhd -- 08:50:08 08/20/2003
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

	COMPONENT desenc
	PORT(
		pt : IN std_logic_vector(1 to 64);
		key : IN std_logic_vector(1 to 64);
		clk : IN std_logic;          
		ct : OUT std_logic_vector(1 to 64)
		);
	END COMPONENT;

	SIGNAL pt :  std_logic_vector(1 to 64);
	SIGNAL key :  std_logic_vector(1 to 64);
	SIGNAL ct :  std_logic_vector(1 to 64);
	SIGNAL clk :  std_logic;

BEGIN

	uut: desenc PORT MAP(
		pt => pt,
		key => key,
		ct => ct,
		clk => clk
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	
	wait for 150 ns;

	wait for 3 ns;

	--pt <= x"0123456789abcdef";
	key <= x"0101010101010101";
	pt <= x"617b3a0ce8f07100";

	wait;
	
	wait for 10 ns;

	key <= x"1f1f1f1f0e0e0e0e";
	--pt db958605f8c8c606

	wait for 10 ns;

	key <= x"e0fee0fef1fef1fe";
	-- ct edbfd1c66c29ccc7

	wait for 10 ns;

	key <= x"fedcba9876543210";
	-- ct ed39d950fa74bcc4

	wait for 10 ns;

	key <= x"1111111111111111";
	-- ct 8a5ae1f81ab8f2dd

	wait for 10 ns;

      wait; -- will wait forever
   END PROCESS;

   clock : process begin
   	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	end process;
-- *** End Test Bench - User Defined Section ***

END;
