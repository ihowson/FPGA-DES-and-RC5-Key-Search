-- C:\ISE\PIL-KEY-SEARCH
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Tue Jul 29 20:19:22 2003
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
	COMPONENT core_key_latch
		PORT (
			key : in  std_logic_vector (63 DOWNTO 0);
			write : in  std_logic;
			clk : in  std_logic;
			read : in  std_logic;
			restart : in  std_logic;
			run : out  std_logic;
			data : inout  std_logic_vector (63 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL key : std_logic_vector (63 DOWNTO 0);
	SIGNAL write : std_logic;
	SIGNAL clk : std_logic;
	SIGNAL read : std_logic;
	SIGNAL restart : std_logic;
	SIGNAL run : std_logic;
	SIGNAL data : std_logic_vector (63 DOWNTO 0);

BEGIN
	UUT : core_key_latch
	PORT MAP (
		key => key,
		write => write,
		clk => clk,
		read => read,
		restart => restart,
		run => run,
		data => data
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

		PROCEDURE CHECK_data(
			next_data : std_logic_vector (63 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (data /= next_data) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns data="));
				write(TX_LOC, data);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_data);
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
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000001"); --1
		write <= transport '0';
		read <= transport '0';
		restart <= transport '0';
		data <= transport std_logic_vector'("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"); --Z
		-- --------------------
		WAIT FOR 10 ns; -- Time=10 ns
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000010"); --2
		restart <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=20 ns
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000011"); --3
		restart <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=30 ns
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000100"); --4
		write <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=40 ns
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000101"); --5
		write <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=50 ns
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000110"); --6
		read <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=60 ns
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000111"); --7
		read <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=70 ns
		key <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000001000"); --8
		-- --------------------
		WAIT FOR 12 ns; -- Time=82 ns
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

CONFIGURATION core_key_latch_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END core_key_latch_cfg;
