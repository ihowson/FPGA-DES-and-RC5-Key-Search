-- C:\0908-DES
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Fri Sep 19 06:38:47 2003
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

LIBRARY  SIMPRIM;
USE SIMPRIM.VCOMPONENTS.ALL;
USE SIMPRIM.VPACKAGE.ALL;

LIBRARY ieee;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT rc5_decrypt_top
		PORT (
			clk : IN  STD_LOGIC;
			run : IN  STD_LOGIC;
			next_key : OUT  STD_LOGIC;
			ptext_valid : OUT  STD_LOGIC;
			trial_key : IN  STD_LOGIC_VECTOR (71 DOWNTO 0);
			ctext : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			iv : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			ptext : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL clk : STD_LOGIC;
	SIGNAL run : STD_LOGIC;
	SIGNAL next_key : STD_LOGIC;
	SIGNAL ptext_valid : STD_LOGIC;
	SIGNAL trial_key : STD_LOGIC_VECTOR (71 DOWNTO 0);
	SIGNAL ctext : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL iv : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL ptext : STD_LOGIC_VECTOR (63 DOWNTO 0);

BEGIN
	UUT : rc5_decrypt_top
	PORT MAP (
		clk => clk,
		run => run,
		next_key => next_key,
		ptext_valid => ptext_valid,
		trial_key => trial_key,
		ctext => ctext,
		iv => iv,
		ptext => ptext
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

		PROCEDURE CHECK_next_key(
			next_next_key : STD_LOGIC;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (next_key /= next_next_key) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns next_key="));
				write(TX_LOC, next_key);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_next_key);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_ptext(
			next_ptext : STD_LOGIC_VECTOR (63 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (ptext /= next_ptext) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns ptext="));
				write(TX_LOC, ptext);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_ptext);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_ptext_valid(
			next_ptext_valid : STD_LOGIC;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (ptext_valid /= next_ptext_valid) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns ptext_valid="));
				write(TX_LOC, ptext_valid);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_ptext_valid);
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
		ctext <= transport STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		iv <= transport STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		run <= transport '0';
		trial_key <= transport STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000"); --0
		-- --------------------
		WAIT FOR 150 ns; -- Time=150 ns
		ctext <= transport STD_LOGIC_VECTOR'("0101011000101101001010000101101000101111101101111000010100101010"); --562D285A2FB7852A
		iv <= transport STD_LOGIC_VECTOR'("0001111101011001110011100000011101000001100110100001010010000110"); --1F59CE07419A1486
		run <= transport '1';
		trial_key <= transport STD_LOGIC_VECTOR'("110010010000110000000011010100111100000011010100111000011111111010000101"); --C90C0353C0D4E1FE85
--		trial_key <= transport STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000"); --C90C0353C0D4E1FE85
		-- --------------------
		WAIT FOR 15000 ns; -- Time=632 ns
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

CONFIGURATION rc5_decrypt_top_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END rc5_decrypt_top_cfg;
