library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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

		COMPONENT keysched
	PORT(
		key : IN std_logic_vector(1 to 64);          
		k1x : OUT std_logic_vector(1 to 48);
		k2x : OUT std_logic_vector(1 to 48);
		k3x : OUT std_logic_vector(1 to 48);
		k4x : OUT std_logic_vector(1 to 48);
		k5x : OUT std_logic_vector(1 to 48);
		k6x : OUT std_logic_vector(1 to 48);
		k7x : OUT std_logic_vector(1 to 48);
		k8x : OUT std_logic_vector(1 to 48);
		k9x : OUT std_logic_vector(1 to 48);
		k10x : OUT std_logic_vector(1 to 48);
		k11x : OUT std_logic_vector(1 to 48);
		k12x : OUT std_logic_vector(1 to 48);
		k13x : OUT std_logic_vector(1 to 48);
		k14x : OUT std_logic_vector(1 to 48);
		k15x : OUT std_logic_vector(1 to 48);
		k16x : OUT std_logic_vector(1 to 48)
		);
	END COMPONENT;

	COMPONENT ip
	PORT(
		pt : IN std_logic_vector(1 to 64);          
		l0x : OUT std_logic_vector(1 to 32);
		r0x : OUT std_logic_vector(1 to 32)
		);
	END COMPONENT;

	COMPONENT roundfunc
	PORT(
		clk : IN std_logic;
		li : IN std_logic_vector(1 to 32);
		ri : IN std_logic_vector(1 to 32);
		k : IN std_logic_vector(1 to 48);          
		lo : OUT std_logic_vector(1 to 32);
		ro : OUT std_logic_vector(1 to 32)
		);
	END COMPONENT;

	COMPONENT fp
	PORT(
		l : IN std_logic_vector(1 to 32);
		r : IN std_logic_vector(1 to 32);          
		ct : OUT std_logic_vector(1 to 64)
		);
	END COMPONENT;

begin                                                             

	keysched_i:	keysched	port map	(	key=>key,	k1x=>k1x,	k2x=>k2x,	k3x=>k3x,	k4x=>k4x,	k5x=>k5x,	k6x=>k6x,	k7x=>k7x,	k8x=>k8x,	k9x=>k9x,	k10x=>k10x,	k11x=>k11x,	k12x=>k12x,	k13x=>k13x,	k14x=>k14x,	k15x=>k15x,	k16x=>k16x	);

	ip_i:			ip 			port map	(	pt=>pt,		l0x=>l0x,	r0x=>r0x	);
                                                                                                  
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
                        
	fp_i:			fp			port map	(	l=>r16x,	r=>l16x,	ct=>ct	);
--	fp:			fp			port map	(	l=>r1x,		r=>l1x,		ct=>ct	);

end behavior;
