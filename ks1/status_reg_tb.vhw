-- C:\ISE\PIL-KEY-SEARCH
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Wed Jul 30 21:59:52 2003
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
	COMPONENT status_reg
		PORT (
			din : in  std_logic_vector (63 DOWNTO 0);
			dout : out  std_logic_vector (63 DOWNTO 0);
			read : in  std_logic;
			write : in  std_logic;
			clk : in  std_logic;
			addr : in  std_logic_vector (2 DOWNTO 0);
			corestatus : in  std_logic_vector (1 DOWNTO 0);
			reset : out  std_logic;
			latch : in  std_logic;
			dvalid : in  std_logic;
			keycount : in  std_logic_vector (7 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL din : std_logic_vector (63 DOWNTO 0);
	SIGNAL dout : std_logic_vector (63 DOWNTO 0);
	SIGNAL read : std_logic;
	SIGNAL write : std_logic;
	SIGNAL clk : std_logic;
	SIGNAL addr : std_logic_vector (2 DOWNTO 0);
	SIGNAL corestatus : std_logic_vector (1 DOWNTO 0);
	SIGNAL reset : std_logic;
	SIGNAL latch : std_logic;
	SIGNAL dvalid : std_logic;
	SIGNAL keycount : std_logic_vector (7 DOWNTO 0);

BEGIN
	UUT : status_reg
	PORT MAP (
		din => din,
		dout => dout,
		read => read,
		write => write,
		clk => clk,
		addr => addr,
		corestatus => corestatus,
		reset => reset,
		latch => latch,
		dvalid => dvalid,
		keycount => keycount
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
			next_dout : std_logic_vector (63 DOWNTO 0);
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

		PROCEDURE CHECK_reset(
			next_reset : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (reset /= next_reset) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns reset="));
				write(TX_LOC, reset);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_reset);
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
		din <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		read <= transport '0';
		write <= transport '0';
		addr <= transport std_logic_vector'("000"); --0
		corestatus <= transport std_logic_vector'("00"); --0
		latch <= transport '0';
		dvalid <= transport '0';
		keycount <= transport std_logic_vector'("00000000"); --0
		-- --------------------
		WAIT FOR 10 ns; -- Time=10 ns
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

CONFIGURATION status_reg_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END status_reg_cfg;
