library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rc5_decrypt is
    Port ( clk : in std_logic;
           run : in std_logic;
           ctext : in std_logic_vector(63 downto 0);
           iv : in std_logic_vector(63 downto 0);
		   ptext : out std_logic_vector(63 downto 0);
		   ptext_valid : out std_logic;
		   nextkey : out std_logic;

		   ramsel : in std_logic;
		   
		   ramdin : out std_logic_vector(31 downto 0);
		   ramdout : in std_logic_vector(31 downto 0);
		   ramaddr : out std_logic_vector(7 downto 0);
		   ramwe : out std_logic);
end rc5_decrypt;

architecture Behavioral of rc5_decrypt is

	COMPONENT ror_v_32
	PORT(
		clk : in std_logic;
		run : in std_logic;
		x : IN std_logic_vector(31 downto 0);
		amt : IN std_logic_vector(4 downto 0);          
		y : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


signal a : std_logic_vector(31 downto 0);
signal b : std_logic_vector(31 downto 0);

signal c : std_logic_vector(31 downto 0);

signal state : integer := 0;

signal rorin : std_logic_vector(31 downto 0);
signal roramt : std_logic_vector(4 downto 0);
signal rorout : std_logic_vector(31 downto 0);
signal addr : std_logic_vector(4 downto 0);

signal oldramsel : std_logic := '0';

signal bms, brot, rhs, ramdlatch : std_logic_vector(31 downto 0);

begin


ptext <= (a & b) xor iv;

ramaddr <= not(ramsel) & "00" & addr;


brot <= rorout;
rorin <= bms;
roramt <= rhs(4 downto 0);

ramdin <= c;


process (clk) begin
	if rising_edge(clk) and run = '1' then
		ramdlatch <= ramdout; -- this is needed to meet timing after PAR - without it, there is a large net delay between the RAM and bms
		bms <= b - ramdlatch;
		case state is
			when 0 =>
				ptext_valid <= '0';
				nextkey <= '0';
				ramwe <= '0';

				if ramsel /= oldramsel then
					state <= 50;
				else
					state <= 0;
				end if;

			when 50 =>
				oldramsel <= ramsel;
				a <= ctext(63 downto 32);
				b <= ctext(31 downto 0);
				rhs <= ctext(63 downto 32);
				addr <= "11001";
				state <= 1;

			when 1 =>
				-- wait for ram to update with inverted ramsel
				state <= 15;

			when 15 =>
				state <= 2;

			when 2 =>
				-- wait for ram
				state <= 25;

			when 25 =>
				-- wait for ram latch
				state <= 3;

			when 3 =>
				-- wait for rotate
				state <= 4;

			when 4 =>
				state <= 5;

			when 5 =>
				a <= brot xor rhs;
				b <= a;
				addr <= addr - 1;
				
				if addr = "00010" or addr = "00001" then
					rhs <= x"00000000";
				else
					rhs <= brot xor rhs;
				end if;
				
				if addr = 0 then	
					state <= 10;
					ptext_valid <= '1';
					nextkey <= '1';
				else
					state <= 2;
				end if;
					
			when 10 =>
				-- S initialisation
 				ptext_valid <= '0';
				ramwe <= '1';
				nextkey <= '0';
				state <= 12;
				addr <= "00000";
				c <= x"b7e15163"; -- Pw

			when 12 =>

				c <= c + x"9e3779b9"; -- Qw
				addr <= addr + 1;

				if addr = "11001" then
					state <= 0;
					ramwe <= '0';
				else
					state <= 12;
				end if;

			when others =>
				state <= 0;

		end case;
	end if;
end process;

	Inst_ror_v_32: ror_v_32 PORT MAP(
		clk => clk,
		run => run,
		x => rorin,
		amt => roramt,
		y => rorout
	);



end Behavioral;
