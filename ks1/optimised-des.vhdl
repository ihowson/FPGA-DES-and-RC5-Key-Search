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

entity s1 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s1;

architecture behaviour of s1 is

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
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"86e67619"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"869d497a"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"497826bd"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"b0c7871b"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"609f1f29"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"27e9d492"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"6f81b478"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"917be906"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s1

library ieee;
use ieee.std_logic_1164.all;

entity s2 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
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

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"69c3a659"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"e196196e"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"9346c3e9"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"68f93c16"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"62949fc3"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"746a8b74"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"b865168f"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"cd235ad2"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s2

library ieee;
use ieee.std_logic_1164.all;

entity s3 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
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

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"6b9c90d3"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"96692d69"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"26f4794a"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"d96a8635"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"39c2b749"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"76b9960c"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"a965569a"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"4b8d9c63"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s3

library ieee;
use ieee.std_logic_1164.all;

entity s4 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
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

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"ed90583e"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"92c3e719"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"74ca0e97"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"cb69718c"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"692cce71"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"acd1168f"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"c34998e7"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"09b77c1a"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s4

library ieee;
use ieee.std_logic_1164.all;

entity s5 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
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

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"79e1348e"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"429dcd6a"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"91666b96"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"695b9ca1"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"92f05d2b"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"c70b39c6"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"4b76b948"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"a4cd96d2"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s5

library ieee;
use ieee.std_logic_1164.all;

entity s6 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
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

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"c9a4695b"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"b44ab695"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"15e69a69"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"c69938d6"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"6d9216da"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"52cbe13c"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"7c3ca34c"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"95a36a59"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s6

library ieee;
use ieee.std_logic_1164.all;

entity s7 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
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

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"2c96d966"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"92c761f8"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"99e643c3"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"869cd966"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"9e4b81f4"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"6a95f41a"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"497969a6"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"348e9679"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s7

library ieee;
use ieee.std_logic_1164.all;

entity s8 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
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

	signal lower1,upper1,lower2,upper2,lower3,upper3,lower4,upper4	:	std_logic;
	signal d1,d2,d3,d4	:	std_logic;

begin

u1:		rom32x1	generic map	(	init=>x"38C716B9"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower1	);
u2:		rom32x1	generic map	(	init=>x"C17ABD24"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper1	);
u3:		rom32x1	generic map	(	init=>x"596AA569"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower2	);
u4:		rom32x1	generic map	(	init=>x"394e96b1"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper2	);
u5:		rom32x1	generic map	(	init=>x"C8F13F0c"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower3	);
u6:		rom32x1	generic map	(	init=>x"A71658A7"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper3	);
u7:		rom32x1	generic map	(	init=>x"619C7C2b"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>lower4	);
u8:		rom32x1	generic map	(	init=>x"9F6281Cd"	)	port map	(	a0=>i(6),	a1=>i(5),	a2=>i(4),	a3=>i(3),	a4=>i(2),	o=>upper4	);
            
u9:		m2_1	port map	(	d0=>lower1,	d1=>upper1,	s0=>i(1),	o=>d1	);
u10:	m2_1	port map	(	d0=>lower2,	d1=>upper2,	s0=>i(1),	o=>d2	);
u11:	m2_1	port map	(	d0=>lower3,	d1=>upper3,	s0=>i(1),	o=>d3	);
u12:	m2_1	port map	(	d0=>lower4,	d1=>upper4,	s0=>i(1),	o=>d4	);

u13:	fd		port map	(	c=>clk,	d=>d1,	q=>o(1)	);
u14:	fd		port map	(	c=>clk,	d=>d2,	q=>o(2)	);
u15:	fd		port map	(	c=>clk,	d=>d3,	q=>o(3)	);
u16:	fd		port map	(	c=>clk,	d=>d4,	q=>o(4)	);

end; -- s8

library ieee;
use ieee.std_logic_1164.all;

entity pc1 is port
(
	key		:	in std_logic_vector(1 TO 64);
	c0x,d0x	:	out std_logic_vector(1 TO 28)
);
end pc1;

architecture behavior of pc1 is
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
end behavior;

use ieee.std_logic_1164.all;

entity pc2 is port
(
	c,d	: in std_logic_vector(1 TO 28);
	k	: out std_logic_vector(1 TO 48)
);
end pc2;

architecture behavior of pc2 is
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
end behavior;

use ieee.std_logic_1164.all;

entity keysched is port
(
	key	:	in	std_logic_vector(1 to 64);
	k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x
		:	out	std_logic_vector(1 to 48)
);
end keysched;

architecture behaviour of keysched is
	signal c0x,c1x,c2x,c3x,c4x,c5x,c6x,c7x,c8x,c9x,c10x,c11x,c12x,c13x,c14x,c15x,c16x	:	std_logic_vector(1 to 28);
	signal d0x,d1x,d2x,d3x,d4x,d5x,d6x,d7x,d8x,d9x,d10x,d11x,d12x,d13x,d14x,d15x,d16x	:	std_logic_vector(1 to 28);
begin

	pc1:	pc1 port map	(	key=>key,	c0x=>c0x,	d0x=>d0x	);
    
	c1x<=c0x rol 1;		d1x<=d0x rol 1;
	c2x<=c1x rol 1;		d2x<=d1x rol 1;
	c3x<=c2x rol 2;		d3x<=d2x rol 2;
	c4x<=c3x rol 2;		d4x<=d3x rol 2;
	c5x<=c4x rol 2;		d5x<=d4x rol 2;
	c6x<=c5x rol 2;		d6x<=d5x rol 2;
	c7x<=c6x rol 2;		d7x<=d6x rol 2;
	c8x<=c7x rol 2;		d8x<=d7x rol 2;
	c9x<=c8x rol 1;		d9x<=d8x rol 1;
	c10x<=c9x rol 2;	d10x<=d9x rol 2;
	c11x<=c10x rol 2;	d11x<=d10x rol 2;
	c12x<=c11x rol 2;	d12x<=d11x rol 2;
	c13x<=c12x rol 2;	d13x<=d12x rol 2;
	c14x<=c13x rol 2;	d14x<=d13x rol 2;
	c15x<=c14x rol 2;	d15x<=d14x rol 2;
	c16x<=c15x rol 1;	d16x<=d15x rol 1;

	pc2x1:	pc2 port map	(	c=>c1x,		d=>d1x,		k=>k1x	);
	pc2x2:	pc2 port map	(	c=>c2x,		d=>d2x,		k=>k2x	);
	pc2x3:	pc2 port map	(	c=>c3x,		d=>d3x,		k=>k3x	);
	pc2x4:	pc2 port map	(	c=>c4x,		d=>d4x,		k=>k4x	);
	pc2x5:	pc2 port map	(	c=>c5x,		d=>d5x,		k=>k5x	);
	pc2x6:	pc2 port map	(	c=>c6x,		d=>d6x,		k=>k6x	);
	pc2x7:	pc2 port map	(	c=>c7x,		d=>d7x,		k=>k7x	);
	pc2x8:	pc2 port map	(	c=>c8x,		d=>d8x,		k=>k8x	);
	pc2x9:	pc2 port map	(	c=>c9x,		d=>d9x,		k=>k9x	);
	pc2x10:	pc2 port map	(	c=>c10x,	d=>d10x,	k=>k10x	);
	pc2x11:	pc2 port map	(	c=>c11x,	d=>d11x,	k=>k11x	);
	pc2x12:	pc2 port map	(	c=>c12x,	d=>d12x,	k=>k12x	);
	pc2x13:	pc2 port map	(	c=>c13x,	d=>d13x,	k=>k13x	);
	pc2x14:	pc2 port map	(	c=>c14x,	d=>d14x,	k=>k14x	);
	pc2x15:	pc2 port map	(	c=>c15x,	d=>d15x,	k=>k15x	);
	pc2x16:	pc2 port map	(	c=>c16x,	d=>d16x,	k=>k16x	);

end;

use ieee.std_logic_1164.all;

entity ip is port
(
	pt	:	in std_logic_vector(1 TO 64);
	l0x	:	out std_logic_vector(1 TO 32);
	r0x	:	out std_logic_vector(1 TO 32)
);
end ip;

architecture behavior of ip is
begin
	l0x(1)<=pt(58);		l0x(2)<=pt(50);		l0x(3)<=pt(42);		l0x(4)<=pt(34);		l0x(5)<=pt(26);		l0x(6)<=pt(18);		l0x(7)<=pt(10);		l0x(8)<=pt(2);
	l0x(9)<=pt(60);		l0x(10)<=pt(52);	l0x(11)<=pt(44);	l0x(12)<=pt(36);	l0x(13)<=pt(28);	l0x(14)<=pt(20);	l0x(15)<=pt(12);	l0x(16)<=pt(4);
	l0x(17)<=pt(62);	l0x(18)<=pt(54);	l0x(19)<=pt(46);	l0x(20)<=pt(38);	l0x(21)<=pt(30);	l0x(22)<=pt(22);	l0x(23)<=pt(14);	l0x(24)<=pt(6);
	l0x(25)<=pt(64);	l0x(26)<=pt(56);	l0x(27)<=pt(48);	l0x(28)<=pt(40);	l0x(29)<=pt(32);	l0x(30)<=pt(24);	l0x(31)<=pt(16);	l0x(32)<=pt(8);

	r0x(1)<=pt(57);		r0x(2)<=pt(49);		r0x(3)<=pt(41);		r0x(4)<=pt(33);		r0x(5)<=pt(25);		r0x(6)<=pt(17);		r0x(7)<=pt(9);		r0x(8)<=pt(1);
	r0x(9)<=pt(59);		r0x(10)<=pt(51);	r0x(11)<=pt(43);	r0x(12)<=pt(35);	r0x(13)<=pt(27);	r0x(14)<=pt(19);	r0x(15)<=pt(11);	r0x(16)<=pt(3);
	r0x(17)<=pt(61);	r0x(18)<=pt(53);	r0x(19)<=pt(45);	r0x(20)<=pt(37);	r0x(21)<=pt(29);	r0x(22)<=pt(21);	r0x(23)<=pt(13);	r0x(24)<=pt(5);
	r0x(25)<=pt(63);	r0x(26)<=pt(55);	r0x(27)<=pt(47);	r0x(28)<=pt(39);	r0x(29)<=pt(31);	r0x(30)<=pt(23);	r0x(31)<=pt(15);	r0x(32)<=pt(7);
end behavior;

use ieee.std_logic_1164.all;

entity xp is port
(
	ri	: in std_logic_vector(1 TO 32);
	e	: out std_logic_vector(1 TO 48));
end xp;

architecture behavior of xp is
begin
	e(1)<=ri(32);	e(2)<=ri(1);	e(3)<=ri(2);	e(4)<=ri(3);	e(5)<=ri(4);	e(6)<=ri(5);	e(7)<=ri(4);	e(8)<=ri(5);
	e(9)<=ri(6);	e(10)<=ri(7);	e(11)<=ri(8);	e(12)<=ri(9);	e(13)<=ri(8);	e(14)<=ri(9);	e(15)<=ri(10);	e(16)<=ri(11);
	e(17)<=ri(12);	e(18)<=ri(13);	e(19)<=ri(12);	e(20)<=ri(13);	e(21)<=ri(14);	e(22)<=ri(15);	e(23)<=ri(16);	e(24)<=ri(17);
	e(25)<=ri(16);	e(26)<=ri(17);	e(27)<=ri(18);	e(28)<=ri(19);	e(29)<=ri(20);	e(30)<=ri(21);	e(31)<=ri(20);	e(32)<=ri(21);
	e(33)<=ri(22);	e(34)<=ri(23);	e(35)<=ri(24);	e(36)<=ri(25);	e(37)<=ri(24);	e(38)<=ri(25);	e(39)<=ri(26);	e(40)<=ri(27);
	e(41)<=ri(28);	e(42)<=ri(29);	e(43)<=ri(28);	e(44)<=ri(29);	e(45)<=ri(30);	e(46)<=ri(31);	e(47)<=ri(32);	e(48)<=ri(1);
end behavior;

use ieee.std_logic_1164.all;

entity desxor1 is port
(
	e	:	in std_logic_vector(1 TO 48);
	b1x,b2x,b3x,b4x,b5x,b6x,b7x,b8x	
		:	out std_logic_vector (1 TO 6);
	k	:	in std_logic_vector (1 TO 48)
);
end desxor1;

architecture behavior of desxor1 is
	signal XX	:	std_logic_vector( 1 to 48);
begin                                     
	XX<=k xor e;
	b1x<=XX(1 to 6);
	b2x<=XX(7 to 12);
	b3x<=XX(13 to 18);
	b4x<=XX(19 to 24);
	b5x<=XX(25 to 30);
	b6x<=XX(31 to 36);
	b7x<=XX(37 to 42);
	b8x<=XX(43 to 48);
end behavior;

use ieee.std_logic_1164.all;

entity pp is port
(      
	so1x,so2x,so3x,so4x,so5x,so6x,so7x,so8x
		:	in	std_logic_vector(1 to 4);
	ppo	:	out	std_logic_vector(1 to 32)
);
end pp;
                                         
architecture behaviour of pp is
	signal XX	:	std_logic_vector(1 to 32);
begin                                         
	XX(1 to 4)<=so1x;	XX(5 to 8)<=so2x;	XX(9 to 12)<=so3x;	XX(13 to 16)<=so4x;	XX(17 to 20)<=so5x;	XX(21 to 24)<=so6x;	XX(25 to 28)<=so7x;	XX(29 to 32)<=so8x;
	ppo(1)<=XX(16);		ppo(2)<=XX(7);		ppo(3)<=XX(20);		ppo(4)<=XX(21);		ppo(5)<=XX(29);		ppo(6)<=XX(12);		ppo(7)<=XX(28);		ppo(8)<=XX(17);
	ppo(9)<=XX(1);		ppo(10)<=XX(15);	ppo(11)<=XX(23);	ppo(12)<=XX(26);	ppo(13)<=XX(5);		ppo(14)<=XX(18);	ppo(15)<=XX(31);	ppo(16)<=XX(10);
	ppo(17)<=XX(2);		ppo(18)<=XX(8);		ppo(19)<=XX(24);	ppo(20)<=XX(14);	ppo(21)<=XX(32);	ppo(22)<=XX(27);	ppo(23)<=XX(3);		ppo(24)<=XX(9);
	ppo(25)<=XX(19);	ppo(26)<=XX(13);	ppo(27)<=XX(30);	ppo(28)<=XX(6);		ppo(29)<=XX(22);	ppo(30)<=XX(11);	ppo(31)<=XX(4);		ppo(32)<=XX(25);
end;

use ieee.std_logic_1164.all;

entity desxor2 is port
(        
	d,l	:	in	std_logic_vector(1 to 32);
	q	:	out	std_logic_vector(1 to 32)
);
end desxor2;                                

architecture behaviour of desxor2 is 
begin
	q<=d xor l;
end;

use ieee.std_logic_1164.all;

entity roundfunc is port
(
	clk		:	in	std_logic;
	li,ri	:	in	std_logic_vector(1 to 32);
	k		:	in	std_logic_vector(1 to 48);
	lo,ro	:	out	std_logic_vector(1 to 32)
);
end roundfunc;

architecture behaviour of roundfunc is

	signal	e	:	std_logic_vector(1 to 48);
	signal	b1x,b2x,b3x,b4x,b5x,b6x,b7x,b8x
				:	std_logic_vector(1 to 6);                                                
	signal	so1x,so2x,so3x,so4x,so5x,so6x,so7x,so8x
				:	std_logic_vector(1 to 4);                               
	signal	ppo	:	std_logic_vector(1 to 32);

begin                                         

	xp:			xp		port map	(	ri=>ri,	e=>e	);               

	desxor1:	desxor1 port map	(	e=>e,	k=>k,	b1x=>b1x,	b2x=>b2x,	b3x=>b3x,	b4x=>b4x,	b5x=>b5x,	b6x=>b6x,	b7x=>b7x,	b8x=>b8x	);

	s1:			s1		port map	(	clk=>clk,	i=>b1x,	o=>so1x	);
	s2:			s2		port map	(	clk=>clk,	i=>b2x,	o=>so2x	);
	s3:			s3		port map	(	clk=>clk,	i=>b3x,	o=>so3x	);
	s4:			s4		port map	(	clk=>clk,	i=>b4x,	o=>so4x	);
	s5:			s5		port map	(	clk=>clk,	i=>b5x,	o=>so5x	);
	s6:			s6		port map	(	clk=>clk,	i=>b6x,	o=>so6x	);
	s7:			s7		port map	(	clk=>clk,	i=>b7x,	o=>so7x	);
	s8:			s8		port map	(	clk=>clk,	i=>b8x,	o=>so8x	);

	pp:			pp		port map	(	so1x=>so1x,	so2x=>so2x,	so3x=>so3x,	so4x=>so4x,	so5x=>so5x,	so6x=>so6x,	so7x=>so7x,	so8x=>so8x,	ppo=>ppo	);
	desxor2:	desxor2	port map	(	d=>ppo,	l=>li,	q=>ro	);

	lo<=ri;
end;

use ieee.std_logic_1164.all;

entity fp is port
(      
	l,r	:	in	std_logic_vector(1 to 32);
	ct	:	out	std_logic_vector(1 to 64)
);
end fp;                                  

architecture behaviour of fp is
begin
	ct(1)<=r(8);	ct(2)<=l(8);	ct(3)<=r(16);	ct(4)<=l(16);	ct(5)<=r(24);	ct(6)<=l(24);	ct(7)<=r(32);	ct(8)<=l(32);
	ct(9)<=r(7);	ct(10)<=l(7);	ct(11)<=r(15);	ct(12)<=l(15);	ct(13)<=r(23);	ct(14)<=l(23);	ct(15)<=r(31);	ct(16)<=l(31);
	ct(17)<=r(6);	ct(18)<=l(6);	ct(19)<=r(14);	ct(20)<=l(14);	ct(21)<=r(22);	ct(22)<=l(22);	ct(23)<=r(30);	ct(24)<=l(30);
	ct(25)<=r(5);	ct(26)<=l(5);	ct(27)<=r(13);	ct(28)<=l(13);	ct(29)<=r(21);	ct(30)<=l(21);	ct(31)<=r(29);	ct(32)<=l(29);
	ct(33)<=r(4);	ct(34)<=l(4);	ct(35)<=r(12);	ct(36)<=l(12);	ct(37)<=r(20);	ct(38)<=l(20);	ct(39)<=r(28);	ct(40)<=l(28);
	ct(41)<=r(3);	ct(42)<=l(3);	ct(43)<=r(11);	ct(44)<=l(11);	ct(45)<=r(19);	ct(46)<=l(19);	ct(47)<=r(27);	ct(48)<=l(27);
	ct(49)<=r(2);	ct(50)<=l(2);	ct(51)<=r(10);	ct(52)<=l(10);	ct(53)<=r(18);	ct(54)<=l(18);	ct(55)<=r(26);	ct(56)<=l(26);
	ct(57)<=r(1);	ct(58)<=l(1);	ct(59)<=r(9);	ct(60)<=l(9);	ct(61)<=r(17);	ct(62)<=l(17);	ct(63)<=r(25);	ct(64)<=l(25);
end;

use ieee.std_logic_1164.all;

entity desenc is port
(
	pt	:	in	std_logic_vector(1 TO 64);
	key	:	in	std_logic_vector(1 TO 64);
	ct	:	out	std_logic_vector(1 TO 64);
	clk	:	in	std_logic
);
end desenc;

architecture behavior of desenc is
	signal	k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x		:	std_logic_vector(1 to 48);
	signal	l0x,l1x,l2x,l3x,l4x,l5x,l6x,l7x,l8x,l9x,l10x,l11x,l12x,l13x,l14x,l15x,l16x	:	std_logic_vector(1 to 32);
	signal	r0x,r1x,r2x,r3x,r4x,r5x,r6x,r7x,r8x,r9x,r10x,r11x,r12x,r13x,r14x,r15x,r16x	:	std_logic_vector(1 to 32);
begin                                                             

	keysched:	keysched	port map	(	key=>key,	k1x=>k1x,	k2x=>k2x,	k3x=>k3x,	k4x=>k4x,	k5x=>k5x,	k6x=>k6x,	k7x=>k7x,	k8x=>k8x,	k9x=>k9x,	k10x=>k10x,	k11x=>k11x,	k12x=>k12x,	k13x=>k13x,	k14x=>k14x,	k15x=>k15x,	k16x=>k16x	);

	ip:			ip 			port map	(	pt=>pt,		l0x=>l0x,	r0x=>r0x	);
                                                                                                  
	round1:		roundfunc	port map	(	clk=>clk,	li=>l0x,	ri=>r0x,  	lo=>l1x,	ro=>r1x,	k=>k1x	);
	round2:		roundfunc	port map	(	clk=>clk,	li=>l1x,	ri=>r1x,  	lo=>l2x,	ro=>r2x,	k=>k2x	);
	round3:		roundfunc	port map	(	clk=>clk,	li=>l2x,	ri=>r2x,  	lo=>l3x,	ro=>r3x,	k=>k3x	);
	round4:		roundfunc	port map	(	clk=>clk,	li=>l3x,	ri=>r3x,  	lo=>l4x,	ro=>r4x,	k=>k4x	);
	round5:		roundfunc	port map	(	clk=>clk,	li=>l4x,	ri=>r4x,  	lo=>l5x,	ro=>r5x,	k=>k5x	);
	round6:		roundfunc	port map	(	clk=>clk,	li=>l5x,	ri=>r5x,  	lo=>l6x,	ro=>r6x,	k=>k6x	);
	round7:		roundfunc	port map	(	clk=>clk,	li=>l6x,	ri=>r6x,  	lo=>l7x,	ro=>r7x,	k=>k7x	);
	round8:		roundfunc	port map	(	clk=>clk,	li=>l7x,	ri=>r7x,  	lo=>l8x,	ro=>r8x,	k=>k8x	);
	round9:		roundfunc	port map	(	clk=>clk,	li=>l8x,	ri=>r8x,  	lo=>l9x,	ro=>r9x,	k=>k9x	);
	round10:	roundfunc	port map	(	clk=>clk,	li=>l9x,	ri=>r9x,  	lo=>l10x,	ro=>r10x,	k=>k10x	);
	round11:	roundfunc	port map	(	clk=>clk,	li=>l10x,	ri=>r10x,  	lo=>l11x,	ro=>r11x,	k=>k11x	);
	round12:	roundfunc	port map	(	clk=>clk,	li=>l11x,	ri=>r11x,  	lo=>l12x,	ro=>r12x,	k=>k12x	);
	round13:	roundfunc	port map	(	clk=>clk,	li=>l12x,	ri=>r12x,  	lo=>l13x,	ro=>r13x,	k=>k13x	);
	round14:	roundfunc	port map	(	clk=>clk,	li=>l13x,	ri=>r13x,  	lo=>l14x,	ro=>r14x,	k=>k14x	);
	round15:	roundfunc	port map	(	clk=>clk,	li=>l14x,	ri=>r14x,  	lo=>l15x,	ro=>r15x,	k=>k15x	);
	round16:	roundfunc	port map	(	clk=>clk,	li=>l15x,	ri=>r15x,  	lo=>l16x,	ro=>r16x,	k=>k16x	);
                        
	fp:			fp			port map	(	l=>r16x,	r=>l16x,	ct=>ct	);
--	fp:			fp			port map	(	l=>r1x,		r=>l1x,		ct=>ct	);

end behavior;
