--
--	Name:			optimised-des.vhdl
--
--	Author:			Chris Eilbeck, chris@yordas.demon.co.uk
--
--	Purpose:		Fully pipelined implementation of a DES encryptor to the FIPS46-2 standard.
--
--	Performance:	Xilinx XC4062XLA-08 - 28MHz max clock rate, 1700 CLBs, 1800 mbps.
--
--	IP Status:		Free use is hereby granted for all civil use including personal, educational and commercial use.
--					The use of this code for military, diplomatic or governmental purposes is specifically forbidden.
--					Copyright is retained by the author.
--
--	Warranty:		There is absolutely no warranty given with this code.  You accept all responsibility for the use
--					of this code and any damage so caused.
--
--	Vers Info:		v0.1 20/1/1999 - tested using supplied VHDL testbench with vectors taken from des-linux package.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- synopsys translate_off
library UNISIM;
use UNISIM.VComponents.all;
-- synopsys translate_on


entity s1 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s1;

architecture behaviour of s1 is
component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
component rom32x1
generic (
	init: bit_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;


	attribute init:	string;
	attribute init of u1: label is "86e67619";
	attribute init of u2: label is "869d497a";
	attribute init of u3: label is "497826bd";
	attribute init of u4: label is "b0c7871b";
	attribute init of u5: label is "609f1f29";
	attribute init of u6: label is "27e9d492";
	attribute init of u7: label is "6f81b478";
	attribute init of u8: label is "917be906";

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

begin


--u1:		rom32x1	generic map	(	init=>16#86e67619# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"10000110111001100111011000011001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#869d497a# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"10000110100111010100100101111010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#497826bd# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"01001001011110000010011010111101" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#b0c7871b# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"10110000110001111000011100011011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#609f1f29# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"01100000100111110001111100101001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#27e9d492# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"00100111111010011101010010010010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#6f81b478# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"01101111100000011011010001111000" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#917be906# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"10010001011110111110100100000110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);
end; -- s1

library ieee;
use ieee.std_logic_1164.all;

entity s2 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s2;

architecture behaviour of s2 is

	attribute init:	string;
	attribute init of u1: label is "69c3a659";
	attribute init of u2: label is "e196196e";
	attribute init of u3: label is "9346c3e9";
	attribute init of u4: label is "68f93c16";
	attribute init of u5: label is "62949fc3";
	attribute init of u6: label is "746a8b74";
	attribute init of u7: label is "b865168f";
	attribute init of u8: label is "cd235ad2";

component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
component rom32x1
generic (
	init: std_logic_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;
	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

begin

--u1:		rom32x1	generic map	(	init=>16#69c3a659# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"01101001110000111010011001011001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#e196196e# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"11100001100101100001100101101110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#9346c3e9# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"10010011010001101100001111101001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#68f93c16#	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"01101000111110010011110000010110"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#62949fc3# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"01100010100101001001111111000011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#746a8b74# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"01110100011010101000101101110100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#b865168f# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"10111000011001010001011010001111" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#cd235ad2# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"11001101001000110101101011010010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);


end; -- s2

library ieee;
use ieee.std_logic_1164.all;

entity s3 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s3;

architecture behaviour of s3 is
					
	attribute init:	string;
	attribute init of u1: label is "6b9c90d3";
	attribute init of u2: label is "96692d69";
	attribute init of u3: label is "26f4794a";
	attribute init of u4: label is "d96a8635";
	attribute init of u5: label is "39c2b749";
	attribute init of u6: label is "76b9960c";
	attribute init of u7: label is "a965569a";
	attribute init of u8: label is "4b8d9c63";

component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
component rom32x1
generic (
	init: std_logic_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;
	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

begin

--u1:		rom32x1	generic map	(	init=>16#6b9c90d3# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"01101011100111001001000011010011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#96692d69# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"10010110011010010010110101101001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#26f4794a# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"00100110111101000111100101001010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#d96a8635# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"11011001011010101000011000110101" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#39c2b749# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"00111001110000101011011101001001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#76b9960c# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"01110110101110011001011000001100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#a965569a# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"10101001011001010101011010011010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#4b8d9c63# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"01001011100011011001110001100011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);

end; -- s3

library ieee;
use ieee.std_logic_1164.all;

entity s4 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s4;

architecture behaviour of s4 is
					
	attribute init:	string;
	attribute init of u1: label is "ed90583e";
	attribute init of u2: label is "92c3e719";
	attribute init of u3: label is "74ca0e97";
	attribute init of u4: label is "cb69718c";
	attribute init of u5: label is "692cce71";
	attribute init of u6: label is "acd1168f";
	attribute init of u7: label is "c34998e7";
	attribute init of u8: label is "09b77c1a";

component rom32x1
generic (
	init: std_logic_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;
component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

begin

--u1:		rom32x1	generic map	(	init=>16#ed90583e# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"11101101100100000101100000111110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#92c3e719# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"10010010110000111110011100011001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#74ca0e97# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"01110100110010100000111010010111" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#cb69718c# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"11001011011010010111000110001100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#692cce71# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"01101001001011001100111001110001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#acd1168f# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"10101100110100010001011010001111" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#c34998e7# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"11000011010010011001100011100111" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#09b77c1a# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"00001001101101110111110000011010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);

end; -- s4

library ieee;
use ieee.std_logic_1164.all;

entity s5 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s5;

architecture behaviour of s5 is
					
	attribute init:	string;
	attribute init of u1: label is "79e1348e";
	attribute init of u2: label is "429dcd6a";
	attribute init of u3: label is "91666b96";
	attribute init of u4: label is "695b9ca1";
	attribute init of u5: label is "92f05d2b";
	attribute init of u6: label is "c70b39c6";
	attribute init of u7: label is "4b76b948";
	attribute init of u8: label is "a4cd96d2";

component rom32x1
generic (
	init: std_logic_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;
component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

begin

--u1:		rom32x1	generic map	(	init=>16#79e1348e# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"01111001111000010011010010001110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#429dcd6a# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"01000010100111011100110101101010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#91666b96# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"10010001011001100110101110010110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#695b9ca1# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"01101001010110111001110010100001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#92f05d2b# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"10010010111100000101110100101011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#c70b39c6# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"11000111000010110011100111000110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#4b76b948# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"01001011011101101011100101001000" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#a4cd96d2# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"10100100110011011001011011010010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);

end; -- s5

library ieee;
use ieee.std_logic_1164.all;

entity s6 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s6;

architecture behaviour of s6 is
				
	attribute init:	string;
	attribute init of u1: label is "c9a4695b";
	attribute init of u2: label is "b44ab695";
	attribute init of u3: label is "15e69a69";
	attribute init of u4: label is "c69938d6";
	attribute init of u5: label is "6d9216da";
	attribute init of u6: label is "52cbe13c";
	attribute init of u7: label is "7c3ca34c";
	attribute init of u8: label is "95a36a59";

component rom32x1
generic (
	init: std_logic_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;
component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

begin

--u1:		rom32x1	generic map	(	init=>16#c9a4695b# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"11001001101001000110100101011011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#b44ab695# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"10110100010010101011011010010101" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#15e69a69# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"00010101111001101001101001101001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#c69938d6# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"11000110100110010011100011010110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#6d9216da# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"01101101100100100001011011011010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#52cbe13c# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"01010010110010111110000100111100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#7c3ca34c# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"01111100001111001010001101001100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#95a36a59# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"10010101101000110110101001011001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);


end; -- s6

library ieee;
use ieee.std_logic_1164.all;

entity s7 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s7;

architecture behaviour of s7 is

	attribute init:	string;
	attribute init of u1: label is "2c96d966";
	attribute init of u2: label is "92c761f8";
	attribute init of u3: label is "99e643c3";
	attribute init of u4: label is "869cd966";
	attribute init of u5: label is "9e4b81f4";
	attribute init of u6: label is "6a95f41a";
	attribute init of u7: label is "497969a6";
	attribute init of u8: label is "348e9679";

component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
component rom32x1
generic (
	init: std_logic_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;
	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

begin

--u1:		rom32x1	generic map	(	init=>16#2c96d966# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"00101100100101101101100101100110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#92c761f8# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"10010010110001110110000111111000" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#99e643c3# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"10011001111001100100001111000011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#869cd966# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"10000110100111001101100101100110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#9e4b81f4# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"10011110010010111000000111110100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#6a95f41a# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"01101010100101011111010000011010" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#497969a6# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"01001001011110010110100110100110" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#348e9679# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"00110100100011101001011001111001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);


end; -- s7

library ieee;
use ieee.std_logic_1164.all;

entity s8 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s8;

architecture behaviour of s8 is
					
	attribute init:	string;
	attribute init of u1: label is "38C716B9";
	attribute init of u2: label is "C17ABD24";
	attribute init of u3: label is "596AA569";
	attribute init of u4: label is "394e96b1";
	attribute init of u5: label is "C8F13F0c";
	attribute init of u6: label is "A71658A7";
	attribute init of u7: label is "619C7C2b";
	attribute init of u8: label is "9F6281Cd";

component m2_1
port (
	d0: in std_logic;
	d1: in std_logic;
	s0: in std_logic;
	o: out std_logic);
end component;
	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;

component rom32x1
generic (
	init: std_logic_vector(31 downto 0));
port(
	a0: in std_logic;
	a1: in std_logic;
	a2: in std_logic;
	a3: in std_logic;
	a4: in std_logic;
	o:out std_logic);
end component;
begin

--u1:		rom32x1	generic map	(	init=>16#38C716B9# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u1:		rom32x1	generic map	(	init=>"00111000110001110001011010111001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
--u2:		rom32x1	generic map	(	init=>16#C17ABD24# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u2:		rom32x1	generic map	(	init=>"11000001011110101011110100100100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
--u3:		rom32x1	generic map	(	init=>16#596AA569# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u3:		rom32x1	generic map	(	init=>"01011001011010101010010101101001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
--u4:		rom32x1	generic map	(	init=>16#394e96b1# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u4:		rom32x1	generic map	(	init=>"00111001010011101001011010110001" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
--u5:		rom32x1	generic map	(	init=>16#C8F13F0c# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u5:		rom32x1	generic map	(	init=>"11001000111100010011111100001100" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
--u6:		rom32x1	generic map	(	init=>16#A71658A7# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u6:		rom32x1	generic map	(	init=>"10100111000101100101100010100111" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
--u7:		rom32x1	generic map	(	init=>16#619C7C2b# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u7:		rom32x1	generic map	(	init=>"01100001100111000111110000101011" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
--u8:		rom32x1	generic map	(	init=>16#9F6281Cd# ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
u8:		rom32x1	generic map	(	init=>"10011111011000101000000111001101" ) port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>o(1)	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>o(2)	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>o(3)	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>o(4)	);

end; -- s8

library ieee;
use ieee.std_logic_1164.all;

entity pc1 is port
(
	key		:	in std_logic_vector(1 TO 64);
	c0x,d0x	:	out std_logic_vector(1 TO 28)
);
end pc1;

architecture behaviour of pc1 is
	signal XX	:	std_logic_vector(1 to 56);
begin                                         
	XX(1)<=key(57);		XX(2)<=key(49);		XX(3)<=key(41);		XX(4)<=key(33);		XX(5)<=key(25);		XX(6)<=key(17);		XX(7)<=key(9);
	XX(8)<=key(1);		XX(9)<=key(58);		XX(10)<=key(50);	XX(11)<=key(42);	XX(12)<=key(34);	XX(13)<=key(26);	XX(14)<=key(18);
	XX(15)<=key(10);	XX(16)<=key(2);		XX(17)<=key(59);	XX(18)<=key(51);	XX(19)<=key(43);	XX(20)<=key(35);	XX(21)<=key(27);
	XX(22)<=key(19);	XX(23)<=key(11);	XX(24)<=key(3);		XX(25)<=key(60);	XX(26)<=key(52);	XX(27)<=key(44);	XX(28)<=key(36);
	XX(29)<=key(63);	XX(30)<=key(55);	XX(31)<=key(47);	XX(32)<=key(39);	XX(33)<=key(31);	XX(34)<=key(23);	XX(35)<=key(15);
	XX(36)<=key(7);		XX(37)<=key(62);	XX(38)<=key(54);	XX(39)<=key(46);	XX(40)<=key(38);	XX(41)<=key(30);	XX(42)<=key(22);
	XX(43)<=key(14);	XX(44)<=key(6);		XX(45)<=key(61);	XX(46)<=key(53);	XX(47)<=key(45);	XX(48)<=key(37);	XX(49)<=key(29);
	XX(50)<=key(21);	XX(51)<=key(13);	XX(52)<=key(5);		XX(53)<=key(28);	XX(54)<=key(20);	XX(55)<=key(12);	XX(56)<=key(4);

	c0x<=XX(1 to 28);	d0x<=XX(29 to 56);
end behaviour;

library ieee;
use ieee.std_logic_1164.all;

entity pc2 is port
(
	c,d	: in std_logic_vector(1 TO 28);
	k	: out std_logic_vector(1 TO 48)
);
end pc2;

architecture behaviour of pc2 is
	signal YY	:	std_logic_vector(1 to 56);
begin
	YY(1 to 28)<=c;		YY(29 to 56)<=d;
                                   
	k(1)<=YY(14);	k(2)<=YY(17);	k(3)<=YY(11);	k(4)<=YY(24);	k(5)<=YY(1);	k(6)<=YY(5);
	k(7)<=YY(3);	k(8)<=YY(28);	k(9)<=YY(15);	k(10)<=YY(6);	k(11)<=YY(21);	k(12)<=YY(10);
	k(13)<=YY(23);	k(14)<=YY(19);	k(15)<=YY(12);	k(16)<=YY(4);	k(17)<=YY(26);	k(18)<=YY(8);
	k(19)<=YY(16);	k(20)<=YY(7);	k(21)<=YY(27);	k(22)<=YY(20);	k(23)<=YY(13);	k(24)<=YY(2);
	k(25)<=YY(41);	k(26)<=YY(52);	k(27)<=YY(31);	k(28)<=YY(37);	k(29)<=YY(47);	k(30)<=YY(55);
	k(31)<=YY(30);	k(32)<=YY(40);	k(33)<=YY(51);	k(34)<=YY(45);	k(35)<=YY(33);	k(36)<=YY(48);
	k(37)<=YY(44);	k(38)<=YY(49);	k(39)<=YY(39);	k(40)<=YY(56);	k(41)<=YY(34);	k(42)<=YY(53);
	k(43)<=YY(46);	k(44)<=YY(42);	k(45)<=YY(50);	k(46)<=YY(36);	k(47)<=YY(29);	k(48)<=YY(32);
end behaviour;
