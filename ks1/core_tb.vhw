-- C:\0908-DES
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Fri Sep 19 08:57:40 2003
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
	COMPONENT core
		PORT (
			addr : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			clk : IN  STD_LOGIC;
			cmd : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			ctext : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			id : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			iv : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			ptext : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			status : OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
			data : INOUT  STD_LOGIC_VECTOR (63 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL addr : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL clk : STD_LOGIC;
	SIGNAL cmd : STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL ctext : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL id : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL iv : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL ptext : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL status : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL data : STD_LOGIC_VECTOR (63 DOWNTO 0);

BEGIN
	UUT : core
	PORT MAP (
		addr => addr,
		clk => clk,
		cmd => cmd,
		ctext => ctext,
		id => id,
		iv => iv,
		ptext => ptext,
		status => status,
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

		PROCEDURE CHECK_status(
			next_status : STD_LOGIC_VECTOR (2 DOWNTO 0);
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

		PROCEDURE CHECK_data(
			next_data : STD_LOGIC_VECTOR (63 DOWNTO 0);
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
		addr <= transport STD_LOGIC_VECTOR'("0000"); --0
		cmd <= transport STD_LOGIC_VECTOR'("00"); --0
		id <= transport STD_LOGIC_VECTOR'("0000"); --0
		ctext <= transport STD_LOGIC_VECTOR'("0101011000101101001010000101101000101111101101111000010100101010"); --562D285A2FB7852A
		ptext <= transport STD_LOGIC_VECTOR'("1110011110011100001110100111011011110011011101010011000010100110"); --E79C3A76F37530A6
		iv <= transport STD_LOGIC_VECTOR'("0001111101011001110011100000011101000001100110100001010010000110"); --1F59CE07419A1486
		data <= transport STD_LOGIC_VECTOR'("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"); --Z
		-- --------------------
		WAIT FOR 40 ns; -- Time=40 ns
		cmd <= transport STD_LOGIC_VECTOR'("10"); --2
		-- --------------------
		WAIT FOR 10 ns; -- Time=50 ns
		cmd <= transport STD_LOGIC_VECTOR'("00"); --0
		data <= transport STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		-- --------------------
		WAIT FOR 10 ns; -- Time=60 ns
		data <= transport STD_LOGIC_VECTOR'("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"); --Z
		-- --------------------
		WAIT FOR 10 ns; -- Time=70 ns
		cmd <= transport STD_LOGIC_VECTOR'("01"); --1
		-- --------------------
		WAIT FOR 70 ns; -- Time=140 ns
		data <= transport STD_LOGIC_VECTOR'("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"); --Z
		-- --------------------
		WAIT FOR 60 ns; -- Time=200 ns
		cmd <= transport STD_LOGIC_VECTOR'("11"); --3
		-- --------------------
		WAIT FOR 10 ns; -- Time=210 ns
		cmd <= transport STD_LOGIC_VECTOR'("01"); --1
		-- --------------------
		WAIT FOR 30 ns; -- Time=240 ns
		cmd <= transport STD_LOGIC_VECTOR'("00"); --0
		-- --------------------
		WAIT FOR 422 ns; -- Time=662 ns
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

CONFIGURATION core_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END core_cfg;
