--
--	Name:			testbench1.vhdl
--
--	Author:			Chris Eilbeck, chris@yordas.demon.co.uk
--
--	Purpose:		VHDL testbench for a DES encryptor.
--
--	IP Status:		Free use is hereby granted for all civil use including personal, educational and commercial use.
--					The use of this code for military, diplomatic or governmental purposes is specifically forbidden.
--
--	Warranty:		There is absolutely no warranty given with this code.  You accept all responsibility for the use
--					of this code and any damage so caused.
--
--	Vers Info:		v0.1 14/11/1998 - Creation.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_desenc is end test_desenc;

architecture des_tb of test_desenc is

component desenc port
(
	key	:	in std_logic_vector(1 to 64);
	pt	:	in std_logic_vector(1 to 64);
	ct	:	out std_logic_vector(1 to 64);
	clk	:	in std_logic
);
end component;

type test_vector is record
	key	:	std_logic_vector(1 to 64);
	pt	:	std_logic_vector(1 to 64);
	ct	:	std_logic_vector(1 to 64);
end record;

type test_vector_array is array(natural range <>) of test_vector;

constant test_vectors: test_vector_array :=(
	(	key=>x"0000000000000000",	pt=>x"0000000000000000",	ct=>x"8ca64de9c1b123a7"	),
  	(	key=>x"ffffffffffffffff",	pt=>x"ffffffffffffffff",	ct=>x"7359b2163e4edc58"	),
  	(	key=>x"3000000000000000",	pt=>x"1000000000000001",	ct=>x"958e6e627a05557b"	),
  	(	key=>x"1111111111111111",	pt=>x"1111111111111111",	ct=>x"f40379ab9e0ec533"	),
  	(	key=>x"0123456789abcdef",	pt=>x"1111111111111111",	ct=>x"17668dfc7292532d"	),
  	(	key=>x"1111111111111111",	pt=>x"0123456789abcdef",	ct=>x"8a5ae1f81ab8f2dd"	),
	(	key=>x"0000000000000000",	pt=>x"0000000000000000",	ct=>x"8ca64de9c1b123a7"	),
  	(	key=>x"fedcba9876543210",	pt=>x"0123456789abcdef",	ct=>x"ed39d950fa74bcc4"	),
  	(	key=>x"7ca110454a1a6e57",	pt=>x"01a1d6d039776742",	ct=>x"690f5b0d9a26939b"	),
  	(	key=>x"0131d9619dc1376e",	pt=>x"5cd54ca83def57da",	ct=>x"7a389d10354bd271"	),
  	(	key=>x"07a1133e4a0b2686",	pt=>x"0248d43806f67172",	ct=>x"868ebb51cab4599a"	),
  	(	key=>x"3849674c2602319e",	pt=>x"51454b582ddf440a",	ct=>x"7178876e01f19b2a"	),
  	(	key=>x"04b915ba43feb5b6",	pt=>x"42fd443059577fa2",	ct=>x"af37fb421f8c4095"	),
  	(	key=>x"0113b970fd34f2ce",	pt=>x"059b5e0851cf143a",	ct=>x"86a560f10ec6d85b"	),
  	(	key=>x"0170f175468fb5e6",	pt=>x"0756d8e0774761d2",	ct=>x"0cd3da020021dc09"	),
  	(	key=>x"43297fad38e373fe",	pt=>x"762514b829bf486a",	ct=>x"ea676b2cb7db2b7a"	),
  	(	key=>x"07a7137045da2a16",	pt=>x"3bdd119049372802",	ct=>x"dfd64a815caf1a0f"	),
  	(	key=>x"04689104c2fd3b2f",	pt=>x"26955f6835af609a",	ct=>x"5c513c9c4886c088"	),
  	(	key=>x"37d06bb516cb7546",	pt=>x"164d5e404f275232",	ct=>x"0a2aeeae3ff4ab77"	),
  	(	key=>x"1f08260d1ac2465e",	pt=>x"6b056e18759f5cca",	ct=>x"ef1bf03e5dfa575a"	),
  	(	key=>x"584023641aba6176",	pt=>x"004bd6ef09176062",	ct=>x"88bf0db6d70dee56"	),
  	(	key=>x"025816164629b007",	pt=>x"480d39006ee762f2",	ct=>x"a1f9915541020b56"	),
  	(	key=>x"49793ebc79b3258f",	pt=>x"437540c8698f3cfa",	ct=>x"6fbf1cafcffd0556"	),
  	(	key=>x"4fb05e1515ab73a7",	pt=>x"072d43a077075292",	ct=>x"2f22e49bab7ca1ac"	),
  	(	key=>x"49e95d6d4ca229bf",	pt=>x"02fe55778117f12a",	ct=>x"5a6b612cc26cce4a"	),
  	(	key=>x"018310dc409b26d6",	pt=>x"1d9d5c5018f728c2",	ct=>x"5f4c038ed12b2e41"	),
  	(	key=>x"1c587f1c13924fef",	pt=>x"305532286d6f295a",	ct=>x"63fac0d034d9f793"	),
  	(	key=>x"0101010101010101",	pt=>x"0123456789abcdef",	ct=>x"617b3a0ce8f07100"	),
  	(	key=>x"1f1f1f1f0e0e0e0e",	pt=>x"0123456789abcdef",	ct=>x"db958605f8c8c606"	),
  	(	key=>x"e0fee0fef1fef1fe",	pt=>x"0123456789abcdef",	ct=>x"edbfd1c66c29ccc7"	),
  	(	key=>x"0000000000000000",	pt=>x"ffffffffffffffff",	ct=>x"355550b2150e2451"	),
  	(	key=>x"ffffffffffffffff",	pt=>x"0000000000000000",	ct=>x"caaaaf4deaf1dbae"	),
	(	key=>x"0123456789abcdef",	pt=>x"0000000000000000",	ct=>x"d5d44ff720683d0d"	),
	(	key=>x"fedcba9876543210",	pt=>x"ffffffffffffffff",	ct=>x"2a2bb008df97c2f2"	)
);

	signal   key : std_logic_vector(1 to 64);
	signal   pt : std_logic_vector(1 to 64);
	signal   ct : std_logic_vector(1 to 64);
	signal   clk : std_logic;

begin

dut:	desenc	port map	(     key=>key,     pt=>pt,     ct=>ct,     clk=>clk	);
    
	process
		variable	vector	:	test_vector;
		variable	errors	:	boolean:=false;
	begin
		for i in test_vectors'range loop
			vector:=test_vectors(i);
			key<=vector.key;	pt<=vector.pt;  

			for j in 0 to 15 loop	clk<='0';	wait for 250 ns;	clk<='1';	wait for 250 ns;	end loop;

			if(ct/=vector.ct) then
				assert false
					report "Implementation Failure"
					severity note;
				errors:=true;
			end if;
		end loop;             

	    assert not errors
			report "Test vectors failed"
		severity note;
		assert errors
			report "Test vectors passed"
			severity note;
		wait;

	end process;

end des_tb;
