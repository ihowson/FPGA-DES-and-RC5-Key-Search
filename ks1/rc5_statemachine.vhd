library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rc5_keyschedule is
    Port ( clk : in std_logic;
           run : in std_logic;
           key : in std_logic_vector(71 downto 0);
           next_key : out std_logic;
		   
		   ramwe : out std_logic;
		   ramaddr : out std_logic_vector(5 downto 0);
		   ramdin : out std_logic_vector(31 downto 0);
		   ramdout : in std_logic_vector(31 downto 0);

		   s0 : out std_logic_vector(31 downto 0);
		   s1 : out std_logic_vector(31 downto 0);
		   start_round : out std_logic);
end rc5_keyschedule;

architecture Behavioral of rc5_keyschedule is

	COMPONENT rol_v_32
	PORT(
		x : IN std_logic_vector(31 downto 0);
		amt : IN std_logic_vector(4 downto 0);          
		y : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


signal state : std_logic_vector(3 downto 0);

signal i : std_logic_vector(4 downto 0) := "00000"; -- index into S array
signal j : std_logic_vector(1 downto 0) := "00"; -- index into L array

signal a : std_logic_vector(31 downto 0) := x"00000000"; -- A register
signal b : std_logic_vector(31 downto 0) := x"00000000"; -- B register

signal sum : std_logic_vector(31 downto 0);
signal rsum : std_logic_vector(31 downto 0);

signal shiftin : std_logic_vector(31 downto 0);
signal shiftout : std_logic_vector(31 downto 0);
signal shiftamt : std_logic_vector(4 downto 0);

begin

shiftin <= sum;
rsum <= ramdout + sum;

process (clk) begin
	if rising_edge(clk) and run = '1' then
		case state is 
			when x"0" =>
				ramaddr <= "0" & i;
				ramwe <= '0';

				sum <= a + b;
			
				state <= x"1";

			when x"1" =>
				ramdin <= rsum(28 downto 0) & rsum(31 downto 29); -- check that resource usage is the same as expected
				ramwe <= '1';
				a <= rsum(28 downto 0) & rsum(31 downto 29); -- check that resource usage is the same as expected
				
				if i = "11001" then -- 11001 = 25 = 2(r+1)
					i <= "00000";
				else
					i <= i + 1;
				end if;

				state <= x"2";
			
			when x"2" =>
				ramwe <= '0';
				ramaddr <= "1000" & j;
				
				sum <= a + b;

				state <= x"3";

			when x"3" =>
				sum <= ramdout + sum;
				shiftamt <= rsum(4 downto 0);
			
				state <= x"4";

			when x"4" =>
				ramwe <= '1';
				ramaddr <= "1000" & j;
				ramdin <= shiftout;

				if j = "10" then
					j <= "00";
				else
					j <= j + 1;
				end if;

				state <= x"0";

			when others =>
				state <= x"0";
		end case;
	end if;
end process;

	Inst_rol_v_32: rol_v_32 PORT MAP(
		x => shiftin,
		amt => shiftamt,
		y => shiftout
	);


end Behavioral;
