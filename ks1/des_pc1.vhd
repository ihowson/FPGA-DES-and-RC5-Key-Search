
library ieee;
use ieee.std_logic_1164.all;

entity keysched is port
(
	key	:	in	std_logic_vector(1 to 64);
	clk : in std_logic;
	ce : in std_logic;
	k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x
		:	out	std_logic_vector(1 to 48)
);
end keysched;

architecture behaviour of keysched is
	signal c0x,c1x,c2x,c3x,c4x,c5x,c6x,c7x,c8x,c9x,c10x,c11x,c12x,c13x,c14x,c15x,c16x	:	std_logic_vector(1 to 28);
	signal d0x,d1x,d2x,d3x,d4x,d5x,d6x,d7x,d8x,d9x,d10x,d11x,d12x,d13x,d14x,d15x,d16x	:	std_logic_vector(1 to 28);

component pc1 port
(
	key		:	in std_logic_vector(1 TO 64);
	c0x,d0x	:	out std_logic_vector(1 TO 28)
);
end component;
component pc2 port
(
	c,d	: in std_logic_vector(1 TO 28);
	k	: out std_logic_vector(1 TO 48)
);
end component;

begin
	pc1x:	pc1 port map	(	key=>key,	c0x=>c0x,	d0x=>d0x	);

process (clk) begin
	if rising_edge(clk) and ce = '1' then


		c1x <= c0x((c0x'right - 0) to c0x'right) & c0x(c0x'left to (c0x'right - 1));
		c2x <= c1x((c1x'right - 0) to c1x'right) & c1x(c1x'left to (c1x'right - 1));
		c3x <= c2x((c2x'right - 1) to c2x'right) & c2x(c2x'left to (c2x'right - 2));
		c4x <= c3x((c3x'right - 1) to c3x'right) & c3x(c3x'left to (c3x'right - 2));
		c5x <= c4x((c4x'right - 1) to c4x'right) & c4x(c4x'left to (c4x'right - 2));
		c6x <= c5x((c5x'right - 1) to c5x'right) & c5x(c5x'left to (c5x'right - 2));
		c7x <= c6x((c6x'right - 1) to c6x'right) & c6x(c6x'left to (c6x'right - 2));
		c8x <= c7x((c7x'right - 1) to c7x'right) & c7x(c7x'left to (c7x'right - 2));
		c9x <= c8x((c8x'right - 0) to c8x'right) & c8x(c8x'left to (c8x'right - 1));
		c10x <= c9x((c9x'right - 1) to c9x'right) & c9x(c9x'left to (c9x'right - 2));
		c11x <= c10x((c10x'right - 1) to c10x'right) & c10x(c10x'left to (c10x'right - 2));
		c12x <= c11x((c11x'right - 1) to c11x'right) & c11x(c11x'left to (c11x'right - 2));
		c13x <= c12x((c12x'right - 1) to c12x'right) & c12x(c12x'left to (c12x'right - 2));
		c14x <= c13x((c13x'right - 1) to c13x'right) & c13x(c13x'left to (c13x'right - 2));
		c15x <= c14x((c14x'right - 1) to c14x'right) & c14x(c14x'left to (c14x'right - 2));
		c16x <= c15x((c15x'right - 0) to c15x'right) & c15x(c15x'left to (c15x'right - 1));


		d1x <= d0x((d0x'right - 0) to d0x'right) & d0x(d0x'left to (d0x'right - 1));
		d2x <= d1x((d1x'right - 0) to d1x'right) & d1x(d1x'left to (d1x'right - 1));
		d3x <= d2x((d2x'right - 1) to d2x'right) & d2x(d2x'left to (d2x'right - 2));
		d4x <= d3x((d3x'right - 1) to d3x'right) & d3x(d3x'left to (d3x'right - 2));
		d5x <= d4x((d4x'right - 1) to d4x'right) & d4x(d4x'left to (d4x'right - 2));
		d6x <= d5x((d5x'right - 1) to d5x'right) & d5x(d5x'left to (d5x'right - 2));
		d7x <= d6x((d6x'right - 1) to d6x'right) & d6x(d6x'left to (d6x'right - 2));
		d8x <= d7x((d7x'right - 1) to d7x'right) & d7x(d7x'left to (d7x'right - 2));
		d9x <= d8x((d8x'right - 0) to d8x'right) & d8x(d8x'left to (d8x'right - 1));
		d10x <= d9x((d9x'right - 1) to d9x'right) & d9x(d9x'left to (d9x'right - 2));
		d11x <= d10x((d10x'right - 1) to d10x'right) & d10x(d10x'left to (d10x'right - 2));
		d12x <= d11x((d11x'right - 1) to d11x'right) & d11x(d11x'left to (d11x'right - 2));
		d13x <= d12x((d12x'right - 1) to d12x'right) & d12x(d12x'left to (d12x'right - 2));
		d14x <= d13x((d13x'right - 1) to d13x'right) & d13x(d13x'left to (d13x'right - 2));
		d15x <= d14x((d14x'right - 1) to d14x'right) & d14x(d14x'left to (d14x'right - 2));
		d16x <= d15x((d15x'right - 0) to d15x'right) & d15x(d15x'left to (d15x'right - 1));






	end if;
end process;

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

library ieee;
use ieee.std_logic_1164.all;

entity ip is port
(
	pt	:	in std_logic_vector(1 TO 64);
	l0x	:	out std_logic_vector(1 TO 32);
	r0x	:	out std_logic_vector(1 TO 32)
);
end ip;

architecture behaviour of ip is
begin
	l0x(1)<=pt(58);		l0x(2)<=pt(50);		l0x(3)<=pt(42);		l0x(4)<=pt(34);		l0x(5)<=pt(26);		l0x(6)<=pt(18);		l0x(7)<=pt(10);		l0x(8)<=pt(2);
	l0x(9)<=pt(60);		l0x(10)<=pt(52);	l0x(11)<=pt(44);	l0x(12)<=pt(36);	l0x(13)<=pt(28);	l0x(14)<=pt(20);	l0x(15)<=pt(12);	l0x(16)<=pt(4);
	l0x(17)<=pt(62);	l0x(18)<=pt(54);	l0x(19)<=pt(46);	l0x(20)<=pt(38);	l0x(21)<=pt(30);	l0x(22)<=pt(22);	l0x(23)<=pt(14);	l0x(24)<=pt(6);
	l0x(25)<=pt(64);	l0x(26)<=pt(56);	l0x(27)<=pt(48);	l0x(28)<=pt(40);	l0x(29)<=pt(32);	l0x(30)<=pt(24);	l0x(31)<=pt(16);	l0x(32)<=pt(8);

	r0x(1)<=pt(57);		r0x(2)<=pt(49);		r0x(3)<=pt(41);		r0x(4)<=pt(33);		r0x(5)<=pt(25);		r0x(6)<=pt(17);		r0x(7)<=pt(9);		r0x(8)<=pt(1);
	r0x(9)<=pt(59);		r0x(10)<=pt(51);	r0x(11)<=pt(43);	r0x(12)<=pt(35);	r0x(13)<=pt(27);	r0x(14)<=pt(19);	r0x(15)<=pt(11);	r0x(16)<=pt(3);
	r0x(17)<=pt(61);	r0x(18)<=pt(53);	r0x(19)<=pt(45);	r0x(20)<=pt(37);	r0x(21)<=pt(29);	r0x(22)<=pt(21);	r0x(23)<=pt(13);	r0x(24)<=pt(5);
	r0x(25)<=pt(63);	r0x(26)<=pt(55);	r0x(27)<=pt(47);	r0x(28)<=pt(39);	r0x(29)<=pt(31);	r0x(30)<=pt(23);	r0x(31)<=pt(15);	r0x(32)<=pt(7);
end behaviour;

library ieee;
use ieee.std_logic_1164.all;

entity xp is port
(
	ri	: in std_logic_vector(1 TO 32);
	e	: out std_logic_vector(1 TO 48));
end xp;

architecture behaviour of xp is
begin
	e(1)<=ri(32);	e(2)<=ri(1);	e(3)<=ri(2);	e(4)<=ri(3);	e(5)<=ri(4);	e(6)<=ri(5);	e(7)<=ri(4);	e(8)<=ri(5);
	e(9)<=ri(6);	e(10)<=ri(7);	e(11)<=ri(8);	e(12)<=ri(9);	e(13)<=ri(8);	e(14)<=ri(9);	e(15)<=ri(10);	e(16)<=ri(11);
	e(17)<=ri(12);	e(18)<=ri(13);	e(19)<=ri(12);	e(20)<=ri(13);	e(21)<=ri(14);	e(22)<=ri(15);	e(23)<=ri(16);	e(24)<=ri(17);
	e(25)<=ri(16);	e(26)<=ri(17);	e(27)<=ri(18);	e(28)<=ri(19);	e(29)<=ri(20);	e(30)<=ri(21);	e(31)<=ri(20);	e(32)<=ri(21);
	e(33)<=ri(22);	e(34)<=ri(23);	e(35)<=ri(24);	e(36)<=ri(25);	e(37)<=ri(24);	e(38)<=ri(25);	e(39)<=ri(26);	e(40)<=ri(27);
	e(41)<=ri(28);	e(42)<=ri(29);	e(43)<=ri(28);	e(44)<=ri(29);	e(45)<=ri(30);	e(46)<=ri(31);	e(47)<=ri(32);	e(48)<=ri(1);
end behaviour;

library ieee;
use ieee.std_logic_1164.all;

entity desxor1 is port
(
	e	:	in std_logic_vector(1 TO 48);
	b1x,b2x,b3x,b4x,b5x,b6x,b7x,b8x	
		:	out std_logic_vector (1 TO 6);
	k	:	in std_logic_vector (1 TO 48)
);
end desxor1;

architecture behaviour of desxor1 is
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
end behaviour;

library ieee;
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

library ieee;
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
