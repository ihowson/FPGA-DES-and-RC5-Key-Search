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
   PORT ( addr	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          clk	:	IN	STD_LOGIC; 
          cmd	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
		  ctext :   in std_logic_vector(63 downto 0);
		  iv :   in std_logic_vector(63 downto 0);
		  ptext :   in std_logic_vector(63 downto 0);
          status	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          data	:	INOUT	STD_LOGIC_VECTOR (63 DOWNTO 0));
end search_units;

architecture Behavioral of search_units is

   COMPONENT core
   PORT( addr	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          clk	:	IN	STD_LOGIC; 
          cmd	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          id	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
		  ctext :   in std_logic_vector(63 downto 0);
		  iv :   in std_logic_vector(63 downto 0);
		  ptext :   in std_logic_vector(63 downto 0);
          status	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          data	:	INOUT	STD_LOGIC_VECTOR (63 DOWNTO 0));
   END COMPONENT;

begin

G0: for I in 0 to 0 generate
   suI: core PORT MAP(
		addr => addr, 
		clk => clk, 
		cmd => cmd, 
		id => std_logic_vector(TO_UNSIGNED(I, 4)), 
		status => status, 
		ctext => ctext,
		ptext => ptext,
		iv => iv,
		data => data
   );
end generate;

end Behavioral;
