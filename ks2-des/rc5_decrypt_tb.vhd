
-- VHDL Test Bench Created from source file rc5_decrypt.vhd -- 19:15:13 09/14/2003
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

	COMPONENT rc5_decrypt
	PORT(
		clk : IN std_logic;
		run : IN std_logic;
		ctext : IN std_logic_vector(63 downto 0);
		iv : IN std_logic_vector(63 downto 0);
		ramsel : IN std_logic;
		ramdout : IN std_logic_vector(31 downto 0);          
		ptext : OUT std_logic_vector(63 downto 0);
		ptext_valid : OUT std_logic;
		ramdin : OUT std_logic_vector(31 downto 0);
		ramaddr : OUT std_logic_vector(7 downto 0);
		ramwe : OUT std_logic
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL run :  std_logic;
	SIGNAL ctext :  std_logic_vector(63 downto 0);
	SIGNAL iv :  std_logic_vector(63 downto 0);
	SIGNAL ptext :  std_logic_vector(63 downto 0);
	SIGNAL ptext_valid :  std_logic;
	SIGNAL ramsel :  std_logic;
	SIGNAL ramdin :  std_logic_vector(31 downto 0);
	SIGNAL ramdout :  std_logic_vector(31 downto 0);
	SIGNAL ramaddr :  std_logic_vector(7 downto 0);
	SIGNAL ramwe :  std_logic;

BEGIN

	uut: rc5_decrypt PORT MAP(
		clk => clk,
		run => run,
		ctext => ctext,
		iv => iv,
		ptext => ptext,
		ptext_valid => ptext_valid,
		ramsel => ramsel,
		ramdin => ramdin,
		ramdout => ramdout,
		ramaddr => ramaddr,
		ramwe => ramwe
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
