-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
   COMPONENT pcore
   PORT( addr	:	IN	STD_LOGIC_VECTOR (13 DOWNTO 0); 
          clk	:	IN	STD_LOGIC; 
          clkdiv	:	IN	STD_LOGIC; 
          din	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          dmask	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          extin	:	IN	STD_LOGIC_VECTOR (25 DOWNTO 0); 
          read	:	IN	STD_LOGIC; 
          reset	:	IN	STD_LOGIC; 
          write	:	IN	STD_LOGIC; 
          dout	:	OUT	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          extctrl	:	OUT	STD_LOGIC_VECTOR (25 DOWNTO 0); 
          extout	:	OUT	STD_LOGIC_VECTOR (25 DOWNTO 0));
   END COMPONENT;

signal addr	:	STD_LOGIC_VECTOR (13 DOWNTO 0); 
          signal clk	:	STD_LOGIC; 
          signal clkdiv	:	STD_LOGIC; 
          signal din	:	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          signal dmask	:	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          signal extin	:	STD_LOGIC_VECTOR (25 DOWNTO 0); 
          signal read	:	STD_LOGIC; 
          signal reset	:	STD_LOGIC; 
          signal write	:	STD_LOGIC; 
          signal dout	:	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          signal extctrl	:	STD_LOGIC_VECTOR (25 DOWNTO 0); 
          signal extout	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
          

constant STATUS : std_logic_vector(13 downto 0) := "00000000000000";
constant NEXTKEY : std_logic_vector(13 downto 0) := "00000000000001";
constant CTEXT : std_logic_vector(13 downto 0) := "00000000000010";
constant PTEXT : std_logic_vector(13 downto 0) := "00000000000011";
constant SUSEL : std_logic_vector(13 downto 0) := "00000000000100";
constant SUKEY : std_logic_vector(13 downto 0) := "00000000000101";

constant ZERO64 : std_logic_vector(63 downto 0) := x"0000000000000000";

  BEGIN

   UUT: pcore PORT MAP(
		addr => addr, 
		clk => clk, 
		clkdiv => clkdiv, 
		din => din, 
		dmask => dmask, 
		extin => extin, 
		read => read, 
		reset => reset, 
		write => write, 
		dout => dout, 
		extctrl => extctrl, 
		extout => extout
   );


  --  Test Bench Statements
	tb : PROCESS BEGIN
		addr <= STATUS;
		clkdiv <= 'Z';
		din <= ZERO64;
		dmask <= ZERO64;
		extin <= "00000000000000000000000000";
		read <= '0';
		reset <= '0';
		write <= '0';

		wait for 9 ns;

		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 10 ns;

		addr <= SUSEL;
		write <= '1';

		wait for 10 ns;

		addr <= NEXTKEY;

		wait for 10 ns;

		write <= '0';

		wait for 10 ns;

		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 100 ns;

		addr <= CTEXT;
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 100 ns;

		addr <= PTEXT;
		write <= '1';
		din <= x"000000000000aa96";

		wait for 10 ns;

		write <= '0';
		din <= ZERO64;

		wait for 100 ns;

		-- set initial key
		addr <= SUSEL;
		write <= '1';
		din <= x"117CBF6597C9DA4B";

		wait for 10 ns;

		write <= '0';

		wait for 100 ns;

		addr <= SUKEY;
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 10 ns;

		wait for 350 ns;

		addr <= NEXTKEY;

		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 10 ns;

		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 10 ns;

		read <= '1';

		wait for 20 ns;

		read <= '0';

		wait for 10 ns;

		addr <= SUSEL;
		din <= ZERO64;
		write <= '1';

		wait for 10 ns;

		write <= '0';

		wait for 100 ns;

		addr <= SUKEY;
		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 20 ns;

		wait for 15000 ns;

		addr <= NEXTKEY;

		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 10 ns;

		read <= '1';

		wait for 10 ns;

		read <= '0';

		wait for 10 ns;

		read <= '1';

		wait; -- will wait forever
	END PROCESS tb;

	process begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
  --  End Test Bench 

  END;
