-- C:\ISE\PIL-KEY-SEARCH
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Tue Jul 29 18:41:00 2003
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
	COMPONENT compare_exact
		PORT (
			clk : in  std_logic;
			trial : in  std_logic_vector (63 DOWNTO 0);
			ptext : in  std_logic_vector (63 DOWNTO 0);
			match : out  std_logic
		);
	END COMPONENT;

	SIGNAL clk : std_logic;
	SIGNAL trial : std_logic_vector (63 DOWNTO 0);
	SIGNAL ptext : std_logic_vector (63 DOWNTO 0);
	SIGNAL match : std_logic;

BEGIN
	UUT : compare_exact
	PORT MAP (
		clk => clk,
		trial => trial,
		ptext => ptext,
		match => match
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

		PROCEDURE CHECK_match(
			next_match : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (match /= next_match) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns match="));
				write(TX_LOC, match);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_match);
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
		trial <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		ptext <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		-- --------------------
		WAIT FOR 4 ns; -- Time=4 ns
		CHECK_match('1',4);
		-- --------------------
		WAIT FOR 6 ns; -- Time=10 ns
		trial <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000101"); --5
		ptext <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000111"); --7
		-- --------------------
		WAIT FOR 4 ns; -- Time=14 ns
		CHECK_match('0',14);
		-- --------------------
		WAIT FOR 6 ns; -- Time=20 ns
		trial <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000001100"); --C
		ptext <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000001100"); --C
		-- --------------------
		WAIT FOR 4 ns; -- Time=24 ns
		CHECK_match('1',24);
		-- --------------------
		WAIT FOR 10 ns; -- Time=34 ns
		CHECK_match('1',34);
		-- --------------------
		WAIT FOR 10 ns; -- Time=44 ns
		CHECK_match('1',44);
		-- --------------------
		WAIT FOR 10 ns; -- Time=54 ns
		CHECK_match('1',54);
		-- --------------------
		WAIT FOR 10 ns; -- Time=64 ns
		CHECK_match('1',64);
		-- --------------------
		WAIT FOR 10 ns; -- Time=74 ns
		CHECK_match('1',74);
		-- --------------------
		WAIT FOR 3 ns; -- Time=77 ns
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

CONFIGURATION compare_exact_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END compare_exact_cfg;
