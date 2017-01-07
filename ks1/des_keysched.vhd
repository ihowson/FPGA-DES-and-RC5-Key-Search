library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keysched is port
(
	key	:	in	std_logic_vector(1 to 64);
	k1x,k2x,k3x,k4x,k5x,k6x,k7x,k8x,k9x,k10x,k11x,k12x,k13x,k14x,k15x,k16x
		:	out	std_logic_vector(1 to 48)
);
end keysched;

architecture behaviour of keysched is
	COMPONENT pc1
	PORT(
		key : IN std_logic_vector(1 to 64);          
		c0x : OUT std_logic_vector(1 to 28);
		d0x : OUT std_logic_vector(1 to 28)
		);
	END COMPONENT;

	COMPONENT pc2
	PORT(
		c : IN std_logic_vector(1 to 28);
		d : IN std_logic_vector(1 to 28);          
		k : OUT std_logic_vector(1 to 48)
		);
	END COMPONENT;

	signal c0x,c1x,c2x,c3x,c4x,c5x,c6x,c7x,c8x,c9x,c10x,c11x,c12x,c13x,c14x,c15x,c16x	:	std_logic_vector(1 to 28);
	signal d0x,d1x,d2x,d3x,d4x,d5x,d6x,d7x,d8x,d9x,d10x,d11x,d12x,d13x,d14x,d15x,d16x	:	std_logic_vector(1 to 28);
begin

	pc1_i:	pc1 port map	(	key=>key,	c0x=>c0x,	d0x=>d0x	);
    
		c1x<=c0x((c0x'left + 1) to c0x'right) & c0x(c0x'left to (c0x'left + 0));
		d1x<=d0x((d0x'left + 1) to d0x'right) & d0x(d0x'left to (d0x'left + 0));
		c2x<=c1x((c1x'left + 1) to c1x'right) & c1x(c1x'left to (c1x'left + 0));
		d2x<=d1x((d1x'left + 1) to d1x'right) & d1x(d1x'left to (d1x'left + 0));
		c3x<=c2x((c2x'left + 2) to c2x'right) & c2x(c2x'left to (c2x'left + 1));
		d3x<=d2x((d2x'left + 2) to d2x'right) & d2x(d2x'left to (d2x'left + 1));
		c4x<=c3x((c3x'left + 2) to c3x'right) & c3x(c3x'left to (c3x'left + 1));
		d4x<=d3x((d3x'left + 2) to d3x'right) & d3x(d3x'left to (d3x'left + 1));
		c5x<=c4x((c4x'left + 2) to c4x'right) & c4x(c4x'left to (c4x'left + 1));
		d5x<=d4x((d4x'left + 2) to d4x'right) & d4x(d4x'left to (d4x'left + 1));
		c6x<=c5x((c5x'left + 2) to c5x'right) & c5x(c5x'left to (c5x'left + 1));
		d6x<=d5x((d5x'left + 2) to d5x'right) & d5x(d5x'left to (d5x'left + 1));
		c7x<=c6x((c6x'left + 2) to c6x'right) & c6x(c6x'left to (c6x'left + 1));
		d7x<=d6x((d6x'left + 2) to d6x'right) & d6x(d6x'left to (d6x'left + 1));
		c8x<=c7x((c7x'left + 2) to c7x'right) & c7x(c7x'left to (c7x'left + 1));
		d8x<=d7x((d7x'left + 2) to d7x'right) & d7x(d7x'left to (d7x'left + 1));
		c9x<=c8x((c8x'left + 1) to c8x'right) & c8x(c8x'left to (c8x'left + 0));
		d9x<=d8x((d8x'left + 1) to d8x'right) & d8x(d8x'left to (d8x'left + 0));
		c10x<=c9x((c9x'left + 2) to c9x'right) & c9x(c9x'left to (c9x'left + 1));
		d10x<=d9x((d9x'left + 2) to d9x'right) & d9x(d9x'left to (d9x'left + 1));
		c11x<=c10x((c10x'left + 2) to c10x'right) & c10x(c10x'left to (c10x'left + 1));
		d11x<=d10x((d10x'left + 2) to d10x'right) & d10x(d10x'left to (d10x'left + 1));
		c12x<=c11x((c11x'left + 2) to c11x'right) & c11x(c11x'left to (c11x'left + 1));
		d12x<=d11x((d11x'left + 2) to d11x'right) & d11x(d11x'left to (d11x'left + 1));
		c13x<=c12x((c12x'left + 2) to c12x'right) & c12x(c12x'left to (c12x'left + 1));
		d13x<=d12x((d12x'left + 2) to d12x'right) & d12x(d12x'left to (d12x'left + 1));
		c14x<=c13x((c13x'left + 2) to c13x'right) & c13x(c13x'left to (c13x'left + 1));
		d14x<=d13x((d13x'left + 2) to d13x'right) & d13x(d13x'left to (d13x'left + 1));
		c15x<=c14x((c14x'left + 2) to c14x'right) & c14x(c14x'left to (c14x'left + 1));
		d15x<=d14x((d14x'left + 2) to d14x'right) & d14x(d14x'left to (d14x'left + 1));
		c16x<=c15x((c15x'left + 1) to c15x'right) & c15x(c15x'left to (c15x'left + 0));
		d16x<=d15x((d15x'left + 1) to d15x'right) & d15x(d15x'left to (d15x'left + 0));

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
