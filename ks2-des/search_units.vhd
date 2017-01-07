library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;
--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity search_units is
   PORT ( clk : in std_logic;
   		busclk : in std_logic;
   		  addr	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          cmd	:	IN	STD_LOGIC;
		  ctext :   in std_logic_vector(63 downto 0);
		  iv :   in std_logic_vector(63 downto 0);
		  ptext :   in std_logic_vector(63 downto 0);
		  master : in std_logic;
		  slave : out std_logic;
          data	:	INOUT	STD_LOGIC_VECTOR (47 DOWNTO 0));
end search_units;

architecture Behavioral of search_units is

   COMPONENT searchunit
   PORT ( clk : in std_logic;
   		busclk : in std_logic;
   		  addr	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          write	:	IN	STD_LOGIC;
          read :	IN	STD_LOGIC;
		  ctext :   in std_logic_vector(63 downto 0);
		  iv :   in std_logic_vector(63 downto 0);
		  ptext :   in std_logic_vector(63 downto 0);
		  id : in std_logic_vector(3 downto 0);
          data	:	INOUT	STD_LOGIC_VECTOR (47 DOWNTO 0));
   END COMPONENT;

constant STATE_WAIT : integer := 0;
constant STATE_READ : integer := 1;
constant STATE_R1 : integer := 2;
constant STATE_R1b : integer := 25;
constant STATE_R2 : integer := 3;
constant STATE_WRITE : integer := 4;

constant HZbus : std_logic_vector(47 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

constant CMD_READ : std_logic := '0';
constant CMD_WRITE : std_logic := '1';

signal suread, suwrite : std_logic := '0';
signal sudata : std_logic_vector(47 downto 0);


signal state : integer := STATE_WAIT;


begin

process (busclk) begin
	if rising_edge(busclk) then
		case state is 
			when STATE_WAIT =>
				data <= HZbus;

				if master = '1' then
					if cmd = CMD_READ then
						state <= STATE_READ;
						suread <= '1';
						sudata <= HZbus;
					else
						sudata <= data;
						suwrite <= '1';
						state <= STATE_WRITE;
						slave <= '1';
					end if;
				else
					sudata <= HZbus;
				end if;
			
			when STATE_READ =>
				-- wait for data to arrive
				suread <= '0';
				state <= STATE_R1;

			when STATE_R1 =>
				data <= sudata;
				slave <= '1';
				state <= STATE_R1b;

			when STATE_R1b =>
				if master = '0' then
					state <= STATE_R2;
				end if;
				
			when STATE_R2 =>
				slave <= '0';
				data <= HZbus;
				state <= STATE_WAIT;
				
			when STATE_WRITE =>
				suwrite <= '0';
				sudata <= HZbus;

				if master = '0' then
					slave <= '0';
					state <= STATE_WAIT;
				end if;

			when others =>
				state <= STATE_WAIT;
		end case;
	end if;
end process;


G0: for I in 0 to 4 generate
   su: searchunit PORT MAP(
   		clk => clk,
		busclk => busclk,
		addr => addr(3 downto 0), 
		write => suwrite, 
		read => suread,
		ctext => ctext,
		iv => iv,
		ptext => ptext,
		id => std_logic_vector(TO_UNSIGNED(I, 4)), 
		data => sudata
   );
end generate;

end Behavioral;
