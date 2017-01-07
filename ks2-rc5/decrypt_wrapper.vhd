library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrypt_wrapper is
    Port (clk : in std_logic;
		  run : in std_logic;
		  key : in std_logic_vector(63 downto 0);
		  next_key : out std_logic;
		  ptext : out std_logic_vector(63 downto 0);
		  ptext_valid : out std_logic
		   );
end decrypt_wrapper;

architecture Behavioral of decrypt_wrapper is
   COMPONENT decryptdes
   PORT( clk	:	IN	STD_LOGIC; 
          ctext	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          run	:	IN	STD_LOGIC; 
          trial_key	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          ptext	:	OUT	STD_LOGIC_VECTOR (63 DOWNTO 0)); 
   END COMPONENT;

begin

UUT: decryptdes PORT MAP(
		clk => clk, 
		ctext => x"1234567890abcdef", 
		run => run, 
		trial_key => key, 
		ptext => ptext 
   );

end Behavioral;
