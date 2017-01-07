
-- VHDL Test Bench Created from source file core_controller.vhd -- 22:23:20 07/31/2003
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

	COMPONENT core_controller
	PORT(
		din : IN std_logic_vector(63 downto 0);
		read : IN std_logic;
		write : IN std_logic;
		reset : IN std_logic;
		clk : IN std_logic;
		addr : IN std_logic_vector(2 downto 0);
		status : IN std_logic_vector(2 downto 0);
		buf_full : in std_logic;    
		data : INOUT std_logic_vector(63 downto 0);      
		dout : OUT std_logic_vector(63 downto 0);
		coreaddr : OUT std_logic_vector(7 downto 0);
		cmd : OUT std_logic_vector(2 downto 0);
		dvalid : OUT std_logic;
		status_write : OUT std_logic;
		buf_write : OUT std_logic
		);
	END COMPONENT;

	SIGNAL din :  std_logic_vector(63 downto 0);
	SIGNAL dout :  std_logic_vector(63 downto 0);
	SIGNAL read :  std_logic;
	SIGNAL write :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL clk :  std_logic;
	signal buf_full : std_logic;
	SIGNAL addr :  std_logic_vector(2 downto 0);
	SIGNAL status :  std_logic_vector(2 downto 0);
	SIGNAL data :  std_logic_vector(63 downto 0);
	SIGNAL coreaddr :  std_logic_vector(7 downto 0);
	SIGNAL cmd :  std_logic_vector(2 downto 0);
	SIGNAL dvalid :  std_logic;
	SIGNAL status_write :  std_logic;
	SIGNAL buf_write :  std_logic;

	constant HZ : std_logic_vector(63 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

BEGIN

	uut: core_controller PORT MAP(
		din => din,
		dout => dout,
		read => read,
		write => write,
		reset => reset,
		clk => clk,
		addr => addr,
		status => status,
		buf_full => buf_full,
		data => data,
		coreaddr => coreaddr,
		cmd => cmd,
		dvalid => dvalid,
		status_write => status_write,
		buf_write => buf_write
	);


-- *** Test Bench - User Defined Section ***
	tb : PROCESS
	BEGIN
		din <= HZ;
		read <= '0';
		write <= '0';
		addr <= "ZZZ";
		status <= "ZZZ";
		data <= HZ;
		reset <= '0';
		buf_full <= '0';
	
		wait for 7 ns;

		wait for 100 ns;

		din <= x"5555555555555555";
		write <= '1';
		addr <= "010";

		wait for 10 ns;

		write <= '0';
		din <= HZ;
		addr <= "ZZZ";

		wait for 50 ns;

		din <= x"5555555555555555";
		write <= '1';
		addr <= "011";

		wait for 10 ns;

		write <= '0';
		din <= HZ;
		addr <= "ZZZ";

		wait for 10 ns;

		wait for 50 ns;

		write <= '1';
		din <= x"0000000000000000";
		addr <= "100";

		wait for 10 ns;
		write <= '0';
		din <= HZ;
		addr <= "ZZZ";

		wait for 50 ns;

		read <= '1';
		addr <= "101";

		wait for 10 ns;

		read <= '0';
		addr <= "ZZZ";

		wait for 10 ns;

		buf_full <= '1';

		wait for 50 ns;
	
		buf_full <= '0';

		wait for 50 ns;

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
