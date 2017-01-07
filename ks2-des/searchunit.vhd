-- Vhdl model created from schematic searchunit.sch - Wed Oct 01 20:20:02 2003

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
-- synopsys translate_off
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
-- synopsys translate_on

ENTITY searchunit IS
   PORT ( addr	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          clk	:	IN	STD_LOGIC; 
		busclk : in std_logic;
          ctext	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          id	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          iv	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          ptext	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
          read	:	IN	STD_LOGIC; 
          write	:	IN	STD_LOGIC; 
          data	:	INOUT	STD_LOGIC_VECTOR (47 DOWNTO 0));

end searchunit;

ARCHITECTURE SCHEMATIC OF searchunit IS
   SIGNAL XLXN_28	:	STD_LOGIC_VECTOR (63 DOWNTO 0);
   SIGNAL keyvalid	:	STD_LOGIC;
   SIGNAL match	:	STD_LOGIC;
   SIGNAL nextkey	:	STD_LOGIC;
   SIGNAL ptextvalid	:	STD_LOGIC;
   SIGNAL run	:	STD_LOGIC;
   SIGNAL selread	:	STD_LOGIC;
   SIGNAL selwrite	:	STD_LOGIC;
   SIGNAL trialkey	:	STD_LOGIC_VECTOR (79 DOWNTO 0);

   ATTRIBUTE BOX_TYPE : STRING;

   COMPONENT addr_decode
      PORT ( readin	:	IN	STD_LOGIC; 
             writein	:	IN	STD_LOGIC; 
             addr	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             id	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             readout	:	OUT	STD_LOGIC; 
             writeout	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT compare_statistical_fast
      PORT ( clk	:	IN	STD_LOGIC; 
             valid	:	IN	STD_LOGIC; 
             trial	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             ptext	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             match	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT compare_exact
      PORT ( clk	:	IN	STD_LOGIC; 
             valid	:	IN	STD_LOGIC; 
             trial	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             ptext	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             match	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT counter
      PORT ( clk	:	IN	STD_LOGIC; 
             run	:	IN	STD_LOGIC; 
             load	:	IN	STD_LOGIC; 
             nextkey	:	IN	STD_LOGIC; 
             data	:	IN	STD_LOGIC_VECTOR (47 DOWNTO 0); 
             valid	:	OUT	STD_LOGIC; 
             count	:	OUT	STD_LOGIC_VECTOR (79 DOWNTO 0));
   END COMPONENT;

   COMPONENT rc5_decrypt_top
      PORT ( clk	:	IN	STD_LOGIC; 
             run	:	IN	STD_LOGIC; 
             ctext	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             iv	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             trial_key	:	IN	STD_LOGIC_VECTOR (71 DOWNTO 0); 
             ptext	:	OUT	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             ptext_valid	:	OUT	STD_LOGIC; 
             next_key	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT decryptdes
      PORT ( clk	:	IN	STD_LOGIC; 
             run	:	IN	STD_LOGIC; 
             ctext	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             iv	:	IN	STD_LOGIC_VECTOR (63 DOWNTO 0); 
   		     trial_key : out std_logic_vector(55 downto 0);
             ptext	:	OUT	STD_LOGIC_VECTOR (63 DOWNTO 0); 
             ptext_valid	:	OUT	STD_LOGIC); 
   END COMPONENT;

   COMPONENT run_control
      PORT ( clk	:	IN	STD_LOGIC; 
             match	:	IN	STD_LOGIC; 
             run	:	OUT	STD_LOGIC; 
             keywrite	:	IN	STD_LOGIC; 
             keyvalid	:	IN	STD_LOGIC);
   END COMPONENT;

   COMPONENT sureg
      PORT ( keyvalid	:	IN	STD_LOGIC; 
             match	:	IN	STD_LOGIC; 
             run	:	IN	STD_LOGIC; 
             clk	:	IN	STD_LOGIC; 
             key	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
             data	:	INOUT	STD_LOGIC_VECTOR (47 DOWNTO 0); 
             read	:	IN	STD_LOGIC);
   END COMPONENT;

BEGIN

   addrdecode : addr_decode
      PORT MAP (readin=>read, writein=>write, addr=>addr, id=>id, readout=>selread,
      writeout=>selwrite);

   comparator : compare_exact
      PORT MAP (clk=>clk, valid=>ptextvalid, trial=>XLXN_28,
      ptext=>ptext, match=>match);

	decryptor : decryptdes
	PORT MAP (clk=>clk, run=>run, ctext=>ctext, iv=>iv,
			  trial_key=>trialkey(55 downto 0),
            ptext=>XLXN_28, ptext_valid=>ptextvalid);

	keyvalid <= '1'; -- DES only
   
   runcontrol1 : run_control
      PORT MAP (clk=>clk, match=>match, run=>run, keywrite=>selwrite,
      keyvalid=>keyvalid);

   sureg1 : sureg
      PORT MAP (keyvalid=>keyvalid, match=>match, run=>run, clk=>busclk,
      key=>trialkey(31 downto 0), data=>data, read=>selread);

END SCHEMATIC;



