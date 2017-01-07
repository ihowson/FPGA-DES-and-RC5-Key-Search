
-- VHDL Test Bench Created from source file decryptdes.vhd -- 07:15:38 10/16/2003
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

	COMPONENT decryptdes
	PORT(
		trial_key : IN std_logic_vector(63 downto 0);
		run : IN std_logic;
		ctext : IN std_logic_vector(63 downto 0);
		iv : IN std_logic_vector(63 downto 0);
		clk : IN std_logic;          
		ptext_valid : OUT std_logic;
		next_key : OUT std_logic;
		ptext : OUT std_logic_vector(63 downto 0)
		);
	END COMPONENT;

	SIGNAL trial_key :  std_logic_vector(63 downto 0);
	SIGNAL run :  std_logic;
	SIGNAL ptext_valid :  std_logic;
	SIGNAL next_key :  std_logic;
	SIGNAL ptext :  std_logic_vector(63 downto 0);
	SIGNAL ctext :  std_logic_vector(63 downto 0);
	SIGNAL iv :  std_logic_vector(63 downto 0);
	SIGNAL clk :  std_logic;

BEGIN

	uut: decryptdes PORT MAP(
		trial_key => trial_key,
		run => run,
		ptext_valid => ptext_valid,
		next_key => next_key,
		ptext => ptext,
		ctext => ctext,
		iv => iv,
		clk => clk
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
   run <= '1';

   ctext <= x"8ca64de9c1b123a7";
   trial_key <= x"0000000000000000";
   -- pt=>x"0000000000000000"

   wait for 200 ns;

   ctext <= x"7359b2163e4edc58";
   trial_key <= x"ffffffffffffffff";
   -- pt=>x"ffffffffffffffff"

   wait for 200 ns;

   ctext <= x"6fbf1cafcffd0556";
   trial_key <= x"49793ebc79b3258f";
   -- pt=>x"437540c8698f3cfa"

	wait for 200 ns;

   ctext <= x"2a2bb008df97c2f2";
   trial_key <= x"fedcba9876543210";
   -- pt=>x"ffffffffffffffff"

   wait for 200 ns;


   wait for 250 ns;
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
