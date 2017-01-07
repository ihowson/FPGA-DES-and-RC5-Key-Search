library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.all;

entity des is
port (
	clk: in std_logic;
	din: in std_logic_vector(63 downto 0);
	dout: out std_logic_vector(63 downto 0);
	write: in std_logic;	-- active high
	ce	: in std_logic;
	done	: out std_logic
);
end des;

architecture syn of des is

-- component begin --
	component SRL16E
	generic (
		INIT: std_logic_vector(15 downto 0) );
	port (
		D: in std_logic;
		CLK: in std_logic;
		CE: in std_logic;
		A0: in std_logic;
		A1: in std_logic;
		A2: in std_logic;
		A3: in std_logic;
		Q: out std_logic );
	end component;
	
	component desenc port
	(
		pt	:	in	std_logic_vector(1 TO 64);
		key	:	in	std_logic_vector(1 TO 64);
		ct	:	out	std_logic_vector(1 TO 64);
		ce	:	in	std_logic;
		clk	:	in	std_logic
	);
	end component;
	
-- component end --

-- signal begin --
	signal vdd,gnd : std_logic;
	signal docrypt : std_logic;
	signal key : std_logic_vector(63 downto 0);
	signal endcrypt,t : std_logic;
	signal pt : std_logic_vector (63 downto 0);
	signal ct : std_logic_vector (63 downto 0);
--	signal r1,r2,r3,r4,r5,r6,r7,r8,r9,r10 : std_logic_vector (63 downto 0);
--	signal r11,r12,r13,r14,r15,r16 : std_logic_vector (63 downto 0);
-- signal end --


begin
	vdd <= '1';
	gnd <= '0';
		
	key(15 downto 0)  <= "1100110111101111";
	key(31 downto 16) <= "1000100110101011";
	key(47 downto 32) <= "0100010101100111";
	key(63 downto  48)<= "0000000100100011";
	U0: desenc port map(
		pt => pt,
		key => key,
		ct => ct,
		ce => ce,
		clk => clk
	);

	done <= write;
	pt <=din;
	dout <= ct;
	
end syn;
