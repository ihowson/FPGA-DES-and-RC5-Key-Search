-- C:\KS2-0928
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Sun Sep 28 22:48:38 2003
-- 
-- Notes:
-- 1) This testbench has been automatically generated from
--   your Test Bench Waveform
-- 2) To use this as a user modifiable testbench do the following:
--   - Save it as a file with a .vhd extension (i.e. File->Save As...)
--   - Add it to your project as a testbench source (i.e. Project->Add Source...)
-- 

LIBRARY  IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY ieee;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT run_control
		PORT (
			clk : in  std_logic;
			run : out  std_logic;
			keywrite : in  std_logic;
			match : in  std_logic;
			keyvalid : in  std_logic
		);
	END COMPONENT;

	SIGNAL clk : std_logic;
	SIGNAL run : std_logic;
	SIGNAL keywrite : std_logic;
	SIGNAL match : std_logic;
	SIGNAL keyvalid : std_logic;

BEGIN
	UUT : run_control
	PORT MAP (
		clk => clk,
		run => run,
		keywrite => keywrite,
		match => match,
		keyvalid => keyvalid
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

		PROCEDURE CHECK_run(
			next_run : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (run /= next_run) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns run="));
				write(TX_LOC, run);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_run);
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
		keywrite <= transport '0';
		match <= transport '0';
		keyvalid <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=10 ns
		keywrite <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=20 ns
		keywrite <= transport '0';
		keyvalid <= transport '1';
		-- --------------------
		WAIT FOR 20 ns; -- Time=40 ns
		match <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=50 ns
		match <= transport '0';
		-- --------------------
		WAIT FOR 20 ns; -- Time=70 ns
		keywrite <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=80 ns
		keywrite <= transport '0';
		-- --------------------
		WAIT FOR 34 ns; -- Time=114 ns
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

CONFIGURATION run_control_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END run_control_cfg;
