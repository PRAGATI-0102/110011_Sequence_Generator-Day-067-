library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DFF_SET is
    port (
        D : in std_logic; 
		  CLK : in std_logic;
		  SET : in std_logic;
        Q : out std_logic);
		  
end DFF_SET;

architecture behavioral of DFF_SET is

begin 

	process(CLK,SET)
	
		begin
		
			if (SET = '1') then
				Q <= '1';
				
			elsif(CLK'event and (CLK = '1')) then
				Q <= D;
				
			end if;
	
	end process;

end behavioral;
