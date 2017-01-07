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
		   
		   ramwe : out std_logic;
		   ramaddr : out std_logic_vector(7 downto 0);
		   ramdin : out std_logic_vector(31 downto 0);
		   ramdout : in std_logic_vector(31 downto 0);

		   ramsel : out std_logic);
end rc5_keyschedule;

architecture Behavioral of rc5_keyschedule is


	COMPONENT rol_v_32
	PORT(
		clk : in std_logic;
		run : in std_logic;
		x : IN std_logic_vector(31 downto 0);
		amt : IN std_logic_vector(4 downto 0);          
		y : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


signal state : integer := 0;

signal rolin : std_logic_vector(31 downto 0);
signal rolamt : std_logic_vector(4 downto 0);
signal rolout : std_logic_vector(31 downto 0);

signal sel : std_logic := '0';

signal i : std_logic_vector(4 downto 0) := "00000"; -- index into S array

signal iter : std_logic_vector(1 downto 0) := "00"; -- number of times over the S array

signal a : std_logic_vector(31 downto 0) := x"00000000"; -- A register
signal b : std_logic_vector(31 downto 0) := x"00000000"; -- B register

signal apb : std_logic_vector(31 downto 0);
signal sab : std_logic_vector(31 downto 0);
signal rotsab : std_logic_vector(31 downto 0);
signal lab : std_logic_vector(31 downto 0);

signal l, l1, l2 : std_logic_vector(31 downto 0); -- L array
begin

sab <= ramdout + apb;
rotsab <= sab(28 downto 0) & sab(31 downto 29);
lab <= apb + l;
rolamt <= apb(4 downto 0);
rolin <= lab;
ramdin <= a;
ramaddr <= sel & "00" & i;

ramsel <= sel;

process (clk) begin
	if rising_edge(clk) and run = '1' then
		apb <= a + b;
		case state is 
			when 0 => -- init
				iter <= "00";
				a <= x"00000000";
				b <= x"00000000";

				l(31 downto 0) <= x"000000" & key(7 downto 0);
				l2(31 downto 0) <= key(15 downto 8) & key(23 downto 16) & key(31 downto 24) & key(39 downto 32);
				l1(31 downto 0) <= key(47 downto 40) & key(55 downto 48) & key(63 downto 56) & key(71 downto 64);

				ramwe <= '0';

				state <= 10;

			when 10 => -- wait for ram, apb
				state <= 15;

			when 15 =>
				ramwe <= '1';
				a <= rotsab;
				
				l <= l1;
				l1 <= l2;
				l2 <= l;
				
				state <= 17;

			when 17 =>
				-- wait for apb
				ramwe <= '0';
				i <= i + 1;
				state <= 18;

			when 18 =>
				-- wait for rolout
				state <= 20;

			when 20 =>
				b <= rolout;
				l <= rolout;
				
				if i = "11010" then
					i <= "00000";
					iter <= iter + 1;
	
					if iter = "10" then
						state <= 0;
						sel <= not(sel);
					else
						state <= 10;
					end if;
				else
					state <= 10;
				end if;


			when others =>
				state <= 0;
		end case;
	end if;
end process;

	Inst_rol_v_32: rol_v_32 PORT MAP(
		clk => clk,
		run => run,
		x => rolin,
		amt => rolamt,
		y => rolout
	);


end Behavioral;
