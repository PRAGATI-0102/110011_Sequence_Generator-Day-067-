library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq_gen is
    port (
		  CLK   : in std_logic;
		  RESET : in std_logic;
        Y     : out std_logic);
end seq_gen;

architecture struct of seq_gen is
	
	component DFF_SET is		
	
			port(D  : in std_logic; 
		       CLK : in std_logic;
		       SET : in std_logic;
             Q   : out std_logic);
				 
	end component;
	
	component DFF_RESET is		
	
			port(D  : in std_logic; 
		       CLK : in std_logic;
		       RESET : in std_logic;
             Q   : out std_logic);
				 
	end component;
	
	signal D0, D1, D2 : std_logic;
	signal Q0, Q1, Q2 : std_logic;
			

begin 

	D0 <= Q2 or (not(Q1) and Q0) or (Q1 and (not(Q0)));
	
	D1 <= (not(Q2) and (not(Q1))) or (not(Q1) and Q0);
	
	D2 <= (not(Q2) and Q1 and (not(Q0))) or (Q2 and (not(Q1)) and Q0);
	
	DFF1 : DFF_RESET port map(D => D2, CLK => CLK, RESET => RESET, Q => Q2);
	DFF2 : DFF_RESET port map(D => D1, CLK => CLK, RESET => RESET, Q => Q1);
	DFF3 : DFF_SET   port map(D => D0, CLK => CLK, SET   => RESET, Q => Q0);
	
	Y <= Q0;
		


end struct;
