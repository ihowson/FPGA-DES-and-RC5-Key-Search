library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity m2_1 is
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end m2_1;

architecture behaviour of m2_1 is
begin
	o <= d0 when s0 = '0' else d1;
end behaviour;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fd is
port (
	c: in std_logic;
	ce: in std_logic;
	d: in std_logic;
	q: out std_logic);
end fd;

architecture behaviour of fd is
begin
	process(c, ce)
	begin
		if (rising_edge(c) and ce = '1') then
			q <= d;
		end if;
	end process;
end behaviour;

