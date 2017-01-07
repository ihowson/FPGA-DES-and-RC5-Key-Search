-- C:\DES-0828
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Mon Sep 08 08:07:53 2003
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
	COMPONENT core_cmd_decode
		PORT (
			cmd : in  std_logic_vector (1 DOWNTO 0);
			addr : in  std_logic_vector (3 DOWNTO 0);
			id : in  std_logic_vector (3 DOWNTO 0);
			clk : in  std_logic;
			status_read : out  std_logic;
			keygen_read : out  std_logic;
			keygen_write : out  std_logic;
			restart : out  std_logic
		);
	END COMPONENT;

	SIGNAL cmd : std_logic_vector (1 DOWNTO 0);
	SIGNAL addr : std_logic_vector (3 DOWNTO 0);
	SIGNAL id : std_logic_vector (3 DOWNTO 0);
	SIGNAL clk : std_logic;
	SIGNAL status_read : std_logic;
	SIGNAL keygen_read : std_logic;
	SIGNAL keygen_write : std_logic;
	SIGNAL restart : std_logic;

BEGIN
	UUT : core_cmd_decode
	PORT MAP (
		cmd => cmd,
		addr => addr,
		id => id,
		clk => clk,
		status_read => status_read,
		keygen_read => keygen_read,
		keygen_write => keygen_write,
		restart => restart
	);

	PROCESS -- clock process for clk,
	BEGIN
		CLOCK_LOOP : LOOP
		clk <= transport '0';
		WAIT FOR 1 ns;
		clk <= transport '1';
		WAIT FOR 1 ns;
		WAIT FOR 4 ns;
		clk <= transport '0';
		WAIT FOR 4 ns;
		END LOOP CLOCK_LOOP;
	END PROCESS;

	PROCESS   -- Process for clk
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_status_read(
			next_status_read : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (status_read /= next_status_read) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns status_read="));
				write(TX_LOC, status_read);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_status_read);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_keygen_read(
			next_keygen_read : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (keygen_read /= next_keygen_read) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns keygen_read="));
				write(TX_LOC, keygen_read);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_keygen_read);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_keygen_write(
			next_keygen_write : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (keygen_write /= next_keygen_write) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns keygen_write="));
				write(TX_LOC, keygen_write);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_keygen_write);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_restart(
			next_restart : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (restart /= next_restart) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns restart="));
				write(TX_LOC, restart);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_restart);
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
		cmd <= transport std_logic_vector'("00"); --0
		addr <= transport std_logic_vector'("0000"); --0
		id <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 10 ns; -- Time=10 ns
		cmd <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 10 ns; -- Time=20 ns
		cmd <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 10 ns; -- Time=30 ns
		cmd <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 10 ns; -- Time=40 ns
		cmd <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 10 ns; -- Time=50 ns
		cmd <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 10 ns; -- Time=60 ns
		cmd <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 10 ns; -- Time=70 ns
		cmd <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 10 ns; -- Time=80 ns
		cmd <= transport std_logic_vector'("00"); --0
		addr <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 10 ns; -- Time=90 ns
		cmd <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 10 ns; -- Time=100 ns
		cmd <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 10 ns; -- Time=110 ns
		cmd <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 10 ns; -- Time=120 ns
		cmd <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 10 ns; -- Time=130 ns
		cmd <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 10 ns; -- Time=140 ns
		cmd <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 10 ns; -- Time=150 ns
		cmd <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 11 ns; -- Time=161 ns
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

CONFIGURATION core_cmd_decode_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END core_cmd_decode_cfg;
