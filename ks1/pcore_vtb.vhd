
-- VHDL Test Bench Created from source file pcore.vhd -- 14:07:21 07/20/2003
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

	COMPONENT pcore
	PORT(
		clk : IN std_logic;
		clkdiv : IN std_logic;
		reset : IN std_logic;
		read : IN std_logic;
		write : IN std_logic;
		addr : IN std_logic_vector(13 downto 0);
		din : IN std_logic_vector(63 downto 0);
		dmask : IN std_logic_vector(63 downto 0);
		extin : IN std_logic_vector(25 downto 0);          
		dout : OUT std_logic_vector(63 downto 0);
		extout : OUT std_logic_vector(25 downto 0);
		extctrl : OUT std_logic_vector(25 downto 0)
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL clkdiv :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL read :  std_logic;
	SIGNAL write :  std_logic;
	SIGNAL addr :  std_logic_vector(13 downto 0);
	SIGNAL din :  std_logic_vector(63 downto 0);
	SIGNAL dout :  std_logic_vector(63 downto 0);
	SIGNAL dmask :  std_logic_vector(63 downto 0);
	SIGNAL extin :  std_logic_vector(25 downto 0);
	SIGNAL extout :  std_logic_vector(25 downto 0);
	SIGNAL extctrl :  std_logic_vector(25 downto 0);

BEGIN

	uut: pcore PORT MAP(
		clk => clk,
		clkdiv => clkdiv,
		reset => reset,
		read => read,
		write => write,
		addr => addr,
		din => din,
		dout => dout,
		dmask => dmask,
		extin => extin,
		extout => extout,
		extctrl => extctrl
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		din <= "0000000000000000000000000000000000000000000000000000000000000000";
		wait for 100 ns;
		din <= "1111111111111111111111111111111111111111111111111111111111111111";
		read <= '1';
      wait; -- will wait forever
   END PROCESS;

   clock: process begin
   		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
-- *** End Test Bench - User Defined Section ***

END;
