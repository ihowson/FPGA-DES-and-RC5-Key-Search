library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rc5_bram_interface is
    Port ( sm_dout : out std_logic_vector(31 downto 0);
           sm_din : in std_logic_vector(31 downto 0);
           sm_addr : in std_logic_vector(5 downto 0);
           sm_we : in std_logic;
           ram_we : out std_logic;
           rama_addr : out std_logic_vector(7 downto 0);
           rama_din : out std_logic_vector(15 downto 0);
           rama_dout : in std_logic_vector(15 downto 0);
           ramb_addr : out std_logic_vector(7 downto 0);
           ramb_din : out std_logic_vector(15 downto 0);
           ramb_dout : in std_logic_vector(15 downto 0));
end rc5_bram_interface;

architecture Behavioral of rc5_bram_interface is

begin

sm_dout <= rama_dout & ramb_dout;


end Behavioral;
