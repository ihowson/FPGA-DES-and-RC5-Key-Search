-- C:\0908-DES
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Wed Sep 17 15:07:19 2003
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
	COMPONENT keygen
		PORT (
			nextkey : in  std_logic;
			clk : in  std_logic;
			count : out  std_logic_vector (71 DOWNTO 0);
			data : in  std_logic_vector (39 DOWNTO 0);
			set : out  std_logic;
			write : in  std_logic
		);
	END COMPONENT;

	SIGNAL nextkey : std_logic;
	SIGNAL clk : std_logic;
	SIGNAL count : std_logic_vector (71 DOWNTO 0);
	SIGNAL data : std_logic_vector (39 DOWNTO 0);
	SIGNAL set : std_logic;
	SIGNAL write : std_logic;

BEGIN
	UUT : keygen
	PORT MAP (
		nextkey => nextkey,
		clk => clk,
		count => count,
		data => data,
		set => set,
		write => write
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

		PROCEDURE CHECK_count(
			next_count : std_logic_vector (71 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (count /= next_count) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns count="));
				write(TX_LOC, count);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_count);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_set(
			next_set : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (set /= next_set) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns set="));
				write(TX_LOC, set);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_set);
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
		nextkey <= transport '0';
		data <= transport std_logic_vector'("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); --X
		write <= transport '0';
		-- --------------------
		WAIT FOR 20 ns; -- Time=20 ns
		data <= transport std_logic_vector'("1111111111111111111111111111111111111110"); --FFFFFFFFFE
		write <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=30 ns
		data <= transport std_logic_vector'("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); --X
		write <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=40 ns
		nextkey <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=50 ns
		nextkey <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=60 ns
		nextkey <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=70 ns
		nextkey <= transport '0';
		-- --------------------
		WAIT FOR 20 ns; -- Time=90 ns
		write <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=100 ns
		write <= transport '0';
		-- --------------------
		WAIT FOR 52 ns; -- Time=152 ns
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

CONFIGURATION keygen_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END keygen_cfg;
