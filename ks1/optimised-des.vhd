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

--32-Deep by 1-Wide Static ROM
 
entity s1 is port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end s1;

architecture behaviour of s1 is
 
 component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
     generic (INIT : bit := '1'); 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 


--	attribute init:	string;
--	attribute init of u1: label is "86e67619";
--	attribute init of u2: label is "869d497a";
--	attribute init of u3: label is "497826bd";
--	attribute init of u4: label is "b0c7871b";
--	attribute init of u5: label is "609f1f29";
--	attribute init of u6: label is "27e9d492";
--	attribute init of u7: label is "6f81b478";
--	attribute init of u8: label is "917be906";

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
component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
  -- synthesis translate_off 
     generic (INIT : bit := '1'); 
  -- synthesis translate_on 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 


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
component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
  -- synthesis translate_off 
     generic (INIT : bit := '1'); 
  -- synthesis translate_on 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 

					
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
component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
  -- synthesis translate_off 
     generic (INIT : bit := '1'); 
  -- synthesis translate_on 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 

					
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
component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
  -- synthesis translate_off 
     generic (INIT : bit := '1'); 
  -- synthesis translate_on 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 

					
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
component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
  -- synthesis translate_off 
     generic (INIT : bit := '1'); 
  -- synthesis translate_on 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 

				
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

component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
  -- synthesis translate_off 
     generic (INIT : bit := '1'); 
  -- synthesis translate_on 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 

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
					
component rom32x1
generic (INIT : bit_vector := X"32"); 
  port (
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
     O : out std_logic
  );
end component;
 
component m2_1
    Port ( D0 : in std_logic;
		   D1 : in std_logic;
		   S0 : in std_logic;
		   O : out std_logic);
end component;

component FD 
  -- synthesis translate_off 
     generic (INIT : bit := '1'); 
  -- synthesis translate_on 
  port (Q : out STD_ULOGIC; 
        C : in STD_ULOGIC; 
        D : in STD_ULOGIC); 
end component; 

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

