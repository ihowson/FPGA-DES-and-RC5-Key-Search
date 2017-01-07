
-- VHDL Test Bench Created from source file searchunit.vhd -- 11:17:04 10/25/2003
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

	COMPONENT searchunit
	PORT(
		addr : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		ctext : IN std_logic_vector(63 downto 0);
		id : IN std_logic_vector(3 downto 0);
		iv : IN std_logic_vector(63 downto 0);
		ptext : IN std_logic_vector(63 downto 0);
		read : IN std_logic;
		write : IN std_logic;       
		data : INOUT std_logic_vector(47 downto 0)
		);
	END COMPONENT;

	SIGNAL addr :  std_logic_vector(3 downto 0);
	SIGNAL clk :  std_logic;
	SIGNAL ctext :  std_logic_vector(63 downto 0);
	SIGNAL id :  std_logic_vector(3 downto 0);
	SIGNAL iv :  std_logic_vector(63 downto 0);
	SIGNAL ptext :  std_logic_vector(63 downto 0);
	SIGNAL read :  std_logic;
	SIGNAL write :  std_logic;
	SIGNAL data :  std_logic_vector(47 downto 0);
	
	constant Z64 : std_logic_vector(63 downto 0) := x"0000000000000000";
	constant Z48 : std_logic_vector(47 downto 0) := x"000000000000";

BEGIN

	uut: searchunit PORT MAP(
		addr => addr,
		clk => clk,
		ctext => ctext,
		id => id,
		iv => iv,
		ptext => ptext,
		read => read,
		write => write,
		data => data
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
   	write <= '0';
	addr <= x"0";
	ctext <= Z64;
	ptext <= Z64;
	id <= x"0";
	iv <= Z64;
	read <= '0';
	--

	wait for 17 ns;
	write <= '1';
	data <= Z48;
	wait for 10 ns;
	write <= '0';
	data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	wait for 10 ns;

	read <= '1';
	wait for 30 us;
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

process begin
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
end process;

END;
