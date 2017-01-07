library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rc5_docrypt is
    Port ( clk : in std_logic;
           run : in std_logic;
		   start_round : in std_logic;
           ptext : in std_logic_vector(63 downto 0);
		   ctext : out std_logic_vector(63 downto 0);
		   ctext_valid : out std_logic;
		   s0 : in std_logic_vector(31 downto 0);
		   s1 : in std_logic_vector(31 downto 0));
end rc5_docrypt;

architecture Behavioral of rc5_docrypt is

	COMPONENT rol_v_32
	PORT(
		x : IN std_logic_vector(31 downto 0);
		amt : IN std_logic_vector(4 downto 0);          
		y : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


signal go : std_logic := '0';
signal a : std_logic_vector(31 downto 0);
signal b : std_logic_vector(31 downto 0);

signal state : std_logic_vector(3 downto 0) := x"0";

signal round : std_logic_vector(3 downto 0) := x"0";

signal rolin : std_logic_vector(31 downto 0);
signal rolamt : std_logic_vector(4 downto 0);
signal rolout : std_logic_vector(31 downto 0);

signal xab : std_logic_vector(31 downto 0);

signal c : std_logic_vector(31 downto 0);

begin

------------
-- start must go high for at least one cycle. After this, the encryption process will begin.
-- It must go low on the cycle that S[2] and S[3] become available.
------------

ctext(63 downto 32) <= b;
ctext(31 downto 0) <= a;

rolin <= xab;

process (clk) begin
	if rising_edge(clk) and run = '1' then
		-- NOTE: need to synchronise this with the main state machine to ensure s0/s1 appear at the right times!
		case state is
			when x"0" =>
				ctext_valid <= '0';

				if start_round = '1' then
					state <= x"1";

					if round = x"0" then
						a <= ptext(31 downto 0);
						b <= ptext(63 downto 32);
					end if;
				end if;

			when x"1" =>
				a <= a + s0;
				b <= b + s1;
				state <= x"2";

			when x"2" =>
				xab <= a xor b;
				rolamt <= b(4 downto 0);
				state <= x"3";

			when x"3" =>
				c <= rolout;
				state <= x"4";

			when x"4" =>
				a <= c + s0;
				state <= x"5";

			when x"5" =>
				xab <= a xor b;
				rolamt <= a(4 downto 0);
				state <= x"6";

			when x"6" =>
				c <= rolout;
				state <= x"7";

			when x"7" =>
				b <= c + s1;

				if round = x"b" then
					ctext_valid <= '1';
					round <= x"0";
				else
					round <= round + 1;
				end if;
					
				state <= x"0";
			when others =>
				state <= x"0";

		end case;
	end if;
end process;

	Inst_rol_v_32: rol_v_32 PORT MAP(
		x => rolin,
		amt => rolamt,
		y => rolout
	);



end Behavioral;
