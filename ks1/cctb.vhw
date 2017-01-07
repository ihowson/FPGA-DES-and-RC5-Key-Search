-- C:\ISE\PIL-KEY-SEARCH
-- VHDL Test Bench created by
-- HDL Bencher 5.1i
-- Thu Jul 31 22:22:53 2003
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
	COMPONENT core_controller
		PORT (
			din : in  std_logic_vector (63 DOWNTO 0);
			dout : out  std_logic_vector (63 DOWNTO 0);
			read : in  std_logic;
			write : in  std_logic;
			reset : in  std_logic;
			clk : in  std_logic;
			addr : in  std_logic_vector (2 DOWNTO 0);
			status : in  std_logic_vector (2 DOWNTO 0);
			data : inout  std_logic_vector (63 DOWNTO 0);
			coreaddr : out  std_logic_vector (7 DOWNTO 0);
			cmd : out  std_logic_vector (2 DOWNTO 0);
			dvalid : out  std_logic;
			status_write : out  std_logic;
			keywrite : out  std_logic
		);
	END COMPONENT;

	SIGNAL din : std_logic_vector (63 DOWNTO 0);
	SIGNAL dout : std_logic_vector (63 DOWNTO 0);
	SIGNAL read : std_logic;
	SIGNAL write : std_logic;
	SIGNAL reset : std_logic;
	SIGNAL clk : std_logic;
	SIGNAL addr : std_logic_vector (2 DOWNTO 0);
	SIGNAL status : std_logic_vector (2 DOWNTO 0);
	SIGNAL data : std_logic_vector (63 DOWNTO 0);
	SIGNAL coreaddr : std_logic_vector (7 DOWNTO 0);
	SIGNAL cmd : std_logic_vector (2 DOWNTO 0);
	SIGNAL dvalid : std_logic;
	SIGNAL status_write : std_logic;
	SIGNAL keywrite : std_logic;

BEGIN
	UUT : core_controller
	PORT MAP (
		din => din,
		dout => dout,
		read => read,
		write => write,
		reset => reset,
		clk => clk,
		addr => addr,
		status => status,
		data => data,
		coreaddr => coreaddr,
		cmd => cmd,
		dvalid => dvalid,
		status_write => status_write,
		keywrite => keywrite
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

		PROCEDURE CHECK_coreaddr(
			next_coreaddr : std_logic_vector (7 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (coreaddr /= next_coreaddr) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns coreaddr="));
				write(TX_LOC, coreaddr);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_coreaddr);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_cmd(
			next_cmd : std_logic_vector (2 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (cmd /= next_cmd) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns cmd="));
				write(TX_LOC, cmd);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_cmd);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_dvalid(
			next_dvalid : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (dvalid /= next_dvalid) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns dvalid="));
				write(TX_LOC, dvalid);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_dvalid);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_status_write(
			next_status_write : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (status_write /= next_status_write) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns status_write="));
				write(TX_LOC, status_write);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_status_write);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_keywrite(
			next_keywrite : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (keywrite /= next_keywrite) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns keywrite="));
				write(TX_LOC, keywrite);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_keywrite);
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
		din <= transport std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000000"); --0
		read <= transport '0';
		write <= transport '0';
		reset <= transport '0';
		addr <= transport std_logic_vector'("000"); --0
		status <= transport std_logic_vector'("000"); --0
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

CONFIGURATION core_controller_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END core_controller_cfg;
