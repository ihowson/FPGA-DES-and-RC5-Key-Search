library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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

		COMPONENT xp
	PORT(
		ri : IN std_logic_vector(1 to 32);          
		e : OUT std_logic_vector(1 to 48)
		);
	END COMPONENT;

		COMPONENT desxor1
	PORT(
		e : IN std_logic_vector(1 to 48);
		k : IN std_logic_vector(1 to 48);          
		b1x : OUT std_logic_vector(1 to 6);
		b2x : OUT std_logic_vector(1 to 6);
		b3x : OUT std_logic_vector(1 to 6);
		b4x : OUT std_logic_vector(1 to 6);
		b5x : OUT std_logic_vector(1 to 6);
		b6x : OUT std_logic_vector(1 to 6);
		b7x : OUT std_logic_vector(1 to 6);
		b8x : OUT std_logic_vector(1 to 6)
		);
	END COMPONENT;

	COMPONENT s1
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT s2
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT s3
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT s4
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT s5
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT s6
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT s7
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT s8
	PORT(
		i : IN std_logic_vector(1 to 6);
		clk : IN std_logic;          
		o : OUT std_logic_vector(1 to 4)
		);
	END COMPONENT;

	COMPONENT pp
	PORT(
		so1x : IN std_logic_vector(1 to 4);
		so2x : IN std_logic_vector(1 to 4);
		so3x : IN std_logic_vector(1 to 4);
		so4x : IN std_logic_vector(1 to 4);
		so5x : IN std_logic_vector(1 to 4);
		so6x : IN std_logic_vector(1 to 4);
		so7x : IN std_logic_vector(1 to 4);
		so8x : IN std_logic_vector(1 to 4);          
		ppo : OUT std_logic_vector(1 to 32)
		);
	END COMPONENT;

	COMPONENT desxor2
	PORT(
		d : IN std_logic_vector(1 to 32);
		l : IN std_logic_vector(1 to 32);          
		q : OUT std_logic_vector(1 to 32)
		);
	END COMPONENT;


begin                                         

	xp_i:			xp		port map	(	ri=>ri,	e=>e	);               

	desxor1_i:	desxor1 port map	(	e=>e,	k=>k,	b1x=>b1x,	b2x=>b2x,	b3x=>b3x,	b4x=>b4x,	b5x=>b5x,	b6x=>b6x,	b7x=>b7x,	b8x=>b8x	);

	s1_i:			s1		port map	(	clk=>clk,	i=>b1x,	o=>so1x	);
	s2_i:			s2		port map	(	clk=>clk,	i=>b2x,	o=>so2x	);
	s3_i:			s3		port map	(	clk=>clk,	i=>b3x,	o=>so3x	);
	s4_i:			s4		port map	(	clk=>clk,	i=>b4x,	o=>so4x	);
	s5_i:			s5		port map	(	clk=>clk,	i=>b5x,	o=>so5x	);
	s6_i:			s6		port map	(	clk=>clk,	i=>b6x,	o=>so6x	);
	s7_i:			s7		port map	(	clk=>clk,	i=>b7x,	o=>so7x	);
	s8_i:			s8		port map	(	clk=>clk,	i=>b8x,	o=>so8x	);

	pp_i:			pp		port map	(	so1x=>so1x,	so2x=>so2x,	so3x=>so3x,	so4x=>so4x,	so5x=>so5x,	so6x=>so6x,	so7x=>so7x,	so8x=>so8x,	ppo=>ppo	);
	desxor2_i:	desxor2	port map	(	d=>ppo,	l=>li,	q=>ro	);

	lo<=ri;
end;
