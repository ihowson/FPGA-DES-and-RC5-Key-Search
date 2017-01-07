
library ieee;
use ieee.std_logic_1164.all;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
-- synopsys translate_off
library UNISIM;
use UNISIM.VComponents.all;
-- synopsys translate_on

entity roundfunc is port
(
	clk		:	in	std_logic;
	ce		:	in	std_logic;
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
	signal	tlo, tro	:	std_logic_vector(1 to 32);

component xp port
(
	ri	: in std_logic_vector(1 TO 32);
	e	: out std_logic_vector(1 TO 48));
end component;
component desxor1  port
(
	e	:	in std_logic_vector(1 TO 48);
	b1x,b2x,b3x,b4x,b5x,b6x,b7x,b8x	
		:	out std_logic_vector (1 TO 6);
	k	:	in std_logic_vector (1 TO 48)
);
end component;
component s1 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component s2 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component s3 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component s4 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component s5 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component s6 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component s7 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component s8 port
(
	i	:	in	std_logic_vector(1 to 6);
	clk	:	in	std_logic;
	ce	:	in	std_logic;
	o	:	out	std_logic_vector(1 to 4)
);
end component;
component pp port
(      
	so1x,so2x,so3x,so4x,so5x,so6x,so7x,so8x
		:	in	std_logic_vector(1 to 4);
	ppo	:	out	std_logic_vector(1 to 32)
);
end component;
component desxor2  port
(        
	d,l	:	in	std_logic_vector(1 to 32);
	q	:	out	std_logic_vector(1 to 32)
);
end component;                                
                                         
component keysched  port
(
	key	:	in	std_logic_vector(1 to 64);
	k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x
		:	out	std_logic_vector(1 to 48)
);
end component;

component ip port
(
	pt	:	in std_logic_vector(1 TO 64);
	l0x	:	out std_logic_vector(1 TO 32);
	r0x	:	out std_logic_vector(1 TO 32)
);
end component;

begin                                         

	Uxp:			xp		port map	(	ri=>ri,	e=>e	);               

	Udesxor1:	desxor1 port map	(	e=>e,	k=>k,	b1x=>b1x,	b2x=>b2x,	b3x=>b3x,	b4x=>b4x,	b5x=>b5x,	b6x=>b6x,	b7x=>b7x,	b8x=>b8x	);

	Us1:			s1		port map	(	clk=>clk, ce=>ce,	i=>b1x,	o=>so1x	);
	Us2:			s2		port map	(	clk=>clk, ce=>ce,	i=>b2x,	o=>so2x	);
	Us3:			s3		port map	(	clk=>clk, ce=>ce,	i=>b3x,	o=>so3x	);
	Us4:			s4		port map	(	clk=>clk, ce=>ce,	i=>b4x,	o=>so4x	);
	Us5:			s5		port map	(	clk=>clk, ce=>ce,	i=>b5x,	o=>so5x	);
	Us6:			s6		port map	(	clk=>clk, ce=>ce,	i=>b6x,	o=>so6x	);
	Us7:			s7		port map	(	clk=>clk, ce=>ce,	i=>b7x,	o=>so7x	);
	Us8:			s8		port map	(	clk=>clk, ce=>ce,	i=>b8x,	o=>so8x	);

	Upp:			pp		port map	(	so1x=>so1x,	so2x=>so2x,	so3x=>so3x,	so4x=>so4x,	so5x=>so5x,	so6x=>so6x,	so7x=>so7x,	so8x=>so8x,	ppo=>ppo	);
	Udesxor2:	desxor2	port map	(	d=>ppo,	l=>li,	q=>tro	);

	tlo<=ri;
	-- pipeline stage
	 process(clk)
  	 begin
		 if (rising_edge(clk) and ce = '1') then
			ro <= tro;
			lo <= tlo;
		 end if;
	 end process;
end;

library ieee;
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
