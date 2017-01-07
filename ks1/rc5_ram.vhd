library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
-- synopsys translate_off
library UNISIM;
use UNISIM.VComponents.all;
-- synopsys translate_on

entity rc5_ram is
    Port ( clk : in std_logic;

		   doa : out std_logic_vector(31 downto 0);
           dia : in std_logic_vector(31 downto 0);
           addra : in std_logic_vector(7 downto 0);
           wea : in std_logic;
		   
		   dob : out std_logic_vector(31 downto 0);
           dib : in std_logic_vector(31 downto 0);
           addrb : in std_logic_vector(7 downto 0);
           web : in std_logic
		   );
end rc5_ram;

architecture Behavioral of rc5_ram is

component RAMB4_S16_S16
  generic (
       INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000");

  port (DIA    : in STD_LOGIC_VECTOR (15 downto 0);
        DIB    : in STD_LOGIC_VECTOR (15 downto 0);
        ENA    : in STD_logic;
        ENB    : in STD_logic;
        WEA    : in STD_logic;
        WEB    : in STD_logic;
        RSTA   : in STD_logic;
        RSTB   : in STD_logic;
        CLKA   : in STD_logic;
        CLKB   : in STD_logic;
        ADDRA  : in STD_LOGIC_VECTOR (7 downto 0);
        ADDRB  : in STD_LOGIC_VECTOR (7 downto 0);
        DOA    : out STD_LOGIC_VECTOR (15 downto 0);
        DOB    : out STD_LOGIC_VECTOR (15 downto 0)); 
end component;

begin

rama0: RAMB4_S16_S16
   port map (
       dia => dia(15 downto 0),
       dib => dib(15 downto 0),
	   ena => '1',
	   enb => '1',
	   wea => wea,
	   web => web,
	   rsta => '0',
	   rstb => '0',
	   clka => clk,
	   clkb => clk,
	   addra => addra,
	   addrb => addrb,
	   doa => doa(15 downto 0)
--	   dob => dob(15 downto 0)
           );
 
ramb0: RAMB4_S16_S16
   port map (
       dia => dia(31 downto 16),
       dib => dib(31 downto 16),
	   ena => '1',
	   enb => '1',
	   wea => wea,
	   web => web,
	   rsta => '0',
	   rstb => '0',
	   clka => clk,
	   clkb => clk,
	   addra => addra,
	   addrb => addrb,
	   doa => doa(31 downto 16)
	   --dob => dob(31 downto 16)
           );
 
rama1: RAMB4_S16_S16
   port map (
       dia => dia(15 downto 0),
       dib => dib(15 downto 0),
	   ena => '1',
	   enb => '1',
	   wea => wea,
	   web => web,
	   rsta => '0',
	   rstb => '0',
	   clka => clk,
	   clkb => clk,
	   addra => addra,
	   addrb => addrb,
--	   doa => doa(15 downto 0)
	   dob => dob(15 downto 0)
           );

ramb1: RAMB4_S16_S16
   port map (
       dia => dia(31 downto 16),
       dib => dib(31 downto 16),
	   ena => '1',
	   enb => '1',
	   wea => wea,
	   web => web,
	   rsta => '0',
	   rstb => '0',
	   clka => clk,
	   clkb => clk,
	   addra => addra,
	   addrb => addrb,
	   --doa => doa(31 downto 16),
	   dob => dob(31 downto 16)
           );
 

end Behavioral;
