-- C:\ISE\PIL-KEY-SEARCH
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Tue Jul 29 20:14:42 2003
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
	COMPONENT core_status_reg
		PORT (
			clk : in  std_logic;
			read : in  std_logic;
			running : in  std_logic;
			status : out  std_logic_vector (1 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL clk : std_logic;
	SIGNAL read : std_logic;
	SIGNAL running : std_logic;
	SIGNAL status : std_logic_vector (1 DOWNTO 0);

BEGIN
	UUT : core_status_reg
	PORT MAP (
		clk => clk,
		read => read,
		running => running,
		status => status
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

		PROCEDURE CHECK_status(
			next_status : std_logic_vector (1 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (status /= next_status) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns status="));
				write(TX_LOC, status);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_status);
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
		read <= transport '0';
		running <= transport '0';
		-- --------------------
		WAIT FOR 4 ns; -- Time=4 ns
		CHECK_status("ZZ",4); --Z
		-- --------------------
		WAIT FOR 6 ns; -- Time=10 ns
		running <= transport '1';
		-- --------------------
		WAIT FOR 4 ns; -- Time=14 ns
		CHECK_status("ZZ",14); --Z
		-- --------------------
		WAIT FOR 6 ns; -- Time=20 ns
		read <= transport '1';
		-- --------------------
		WAIT FOR 4 ns; -- Time=24 ns
		CHECK_status("11",24); --3
		-- --------------------
		WAIT FOR 6 ns; -- Time=30 ns
		running <= transport '0';
		-- --------------------
		WAIT FOR 4 ns; -- Time=34 ns
		CHECK_status("01",34); --1
		-- --------------------
		WAIT FOR 6 ns; -- Time=40 ns
		read <= transport '0';
		-- --------------------
		WAIT FOR 4 ns; -- Time=44 ns
		CHECK_status("ZZ",44); --Z
		-- --------------------
		WAIT FOR 10 ns; -- Time=54 ns
		CHECK_status("ZZ",54); --Z
		-- --------------------
		WAIT FOR 8 ns; -- Time=62 ns
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

CONFIGURATION core_status_reg_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END core_status_reg_cfg;
