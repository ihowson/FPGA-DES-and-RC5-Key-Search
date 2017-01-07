library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity otp_core is
    Port ( clk : in std_logic;
		   data : inout std_logic_vector(31 downto 0);
           addr : in std_logic_vector(7 downto 0);
           id : in std_logic_vector(5 downto 0);
		   write : in std_logic);
end otp_core;



architecture Behavioral of otp_core is
	signal key_load : std_logic;
	signal key_input : std_logic_vector(31 downto 0);
	signal key_val : std_logic_vector(31 downto 0);

	signal sel_id : std_logic_vector(5 downto 0);
	signal cmd : std_logic_vector(1 downto 0);
	
	COMPONENT count32
	PORT(
		clk : IN std_logic;
		load : IN std_logic;
		din : IN std_logic_vector(31 downto 0);       
		count : INOUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	constant CMD_STATUS : std_logic_vector(1 downto 0) := "00";
	constant CMD_KEYVAL : std_logic_vector(1 downto 0) := "01";
	constant CMD_PTEXT : std_logic_vector(1 downto 0) := "10";
	constant CMD_CTEXT : std_logic_vector(1 downto 0) := "11";

	constant HZ : std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

	signal ctext : std_logic_vector(31 downto 0);
	signal ptext : std_logic_vector(31 downto 0);
	signal status : std_logic_vector(31 downto 0);

	signal running : std_logic := '0';

begin
	Inst_count32: count32 PORT MAP(
		clk => clk,
		load => key_load,
		din => key_input,
		count => key_val
	);

	sel_id <= addr(7 downto 2);
	cmd <= addr(1 downto 0);
	status(0) <= running;

	process (clk) begin
		if clk = '1' and clk'event then
			if sel_id = id then
				if (write = '1') then
					data <= HZ;
					case cmd is
						when CMD_STATUS =>
							key_load <= '0';
						when CMD_KEYVAL =>
							key_load <= '1';
							key_input <= data;
							running <= '1';
						when CMD_PTEXT =>
							key_load <= '0';
							ctext <= data;
						when CMD_CTEXT =>
							key_load <= '0';
							ptext <= data;
						when others =>
							-- this should never happen
							key_load <= '0';

					end case;
				else
					case cmd is
						when CMD_STATUS =>
							data <= status;
						when CMD_KEYVAL =>
							data <= key_val;
						when CMD_PTEXT =>
							data <= ptext;
						when CMD_CTEXT =>
							data <= ctext;
						when others =>
							data <= HZ;
					end case;
				end if;
			end if;

			if ((ptext xor key_val) = ctext) then
				running <= '0';
			end if;
		end if;
	end process;

end Behavioral;
