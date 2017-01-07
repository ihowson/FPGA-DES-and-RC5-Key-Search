-- C:\ISE\PIL-KEY-SEARCH
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Fri Aug 01 18:38:04 2003
-- 
-- Notes:
-- 1) This testbench has been automatically generated from
--   your Test Bench Waveform
-- 2) To use this as a user modifiable testbench do the following:
--   - Save it as a file with a .vhd extension (i.e. File->Save As...)
--   - Add it to your project as a testbench source (i.e. Project->Add Source...)
-- 

LIBRARY  ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY  UNISIM;
USE UNISIM.Vcomponents.ALL;

LIBRARY ieee;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT pcore
		PORT (
			addr : IN  STD_LOGIC_VECTOR (13 DOWNTO 0);
			clk : IN  STD_LOGIC;
			clkdiv : IN  STD_LOGIC;
			din : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			dmask : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			extin : IN  STD_LOGIC_VECTOR (25 DOWNTO 0);
			read : IN  STD_LOGIC;
			reset : IN  STD_LOGIC;
			write : IN  STD_LOGIC;
			dout : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0);
			extctrl : OUT  STD_LOGIC_VECTOR (25 DOWNTO 0);
			extout : OUT  STD_LOGIC_VECTOR (25 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL addr : STD_LOGIC_VECTOR (13 DOWNTO 0);
	SIGNAL clk : STD_LOGIC;
	SIGNAL clkdiv : STD_LOGIC;
	SIGNAL din : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL dmask : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL extin : STD_LOGIC_VECTOR (25 DOWNTO 0);
	SIGNAL read : STD_LOGIC;
	SIGNAL reset : STD_LOGIC;
	SIGNAL write : STD_LOGIC;
	SIGNAL dout : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL extctrl : STD_LOGIC_VECTOR (25 DOWNTO 0);
	SIGNAL extout : STD_LOGIC_VECTOR (25 DOWNTO 0);

BEGIN
	UUT : pcore
	PORT MAP (
		addr => addr,
		clk => clk,
		clkdiv => clkdiv,
		din => din,
		dmask => dmask,
		extin => extin,
		read => read,
		reset => reset,
		write => write,
		dout => dout,
		extctrl => extctrl,
		extout => extout
	);

	PROCESS -- clock process for clk,
	BEGIN
		CLOCK_LOOP : LOOP
		clk <= transport '0';
		WAIT FOR 2 ns;
		clk <= transport '1';
		WAIT FOR 2 ns;
		WAIT FOR 3 ns;
		clk <= transport '0';
		WAIT FOR 3 ns;
		END LOOP CLOCK_LOOP;
	END PROCESS;

	PROCESS   -- Process for clk
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_dout(
			next_dout : STD_LOGIC_VECTOR (63 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (dout /= next_dout) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns dout="));
				write(TX_LOC, dout);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_dout);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_extctrl(
			next_extctrl : STD_LOGIC_VECTOR (25 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (extctrl /= next_extctrl) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns extctrl="));
				write(TX_LOC, extctrl);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_extctrl);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_extout(
			next_extout : STD_LOGIC_VECTOR (25 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (extout /= next_extout) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns extout="));
				write(TX_LOC, extout);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_extout);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		BEGIN
		-- --------------------
		addr <= transport STD_LOGIC_VECTOR'("00000000000000"); --0
		clkdiv <= transport '0';
		din <= transport STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		dmask <= transport STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		extin <= transport STD_LOGIC_VECTOR'("00000000000000000000000000"); --0
		read <= transport '0';
		reset <= transport '1';
		write <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=10 ns
		din <= transport STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000001"); --1
		reset <= transport '0';
		write <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=20 ns
		din <= transport STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		write <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=30 ns
		read <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=40 ns
		read <= transport '0';
		-- --------------------
		WAIT FOR 30 ns; -- Time=70 ns
		-- --------------------

		IF (TX_ERROR = 0) THEN 
			write(TX_OUT,string'("No errors or warnings"));
			writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Simulation successful (not a failure).  No problems detected. "
				SEVERITY FAILURE;
		ELSE
			write(TX_OUT, TX_ERROR);
			write(TX_OUT, string'(
				" errors found in simulation"));
			writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Errors found during simulation"
				SEVERITY FAILURE;
		END IF;
	END PROCESS;
END testbench_arch;

CONFIGURATION pcore_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END pcore_cfg;
