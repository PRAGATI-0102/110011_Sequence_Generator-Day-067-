library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DFF_RESET is
    port (
        D     : in std_logic; 
		  CLK   : in std_logic;
		  RESET : in std_logic;
        Q     : out std_logic);
end DFF_RESET;

architecture behavioral of DFF_RESET is

begin 

	process(CLK,RESET)
	
		begin
		
			if (RESET = '1') then
				Q <= '0';
				
			elsif(CLK'event and (CLK = '1')) then
				Q <= D;
				
			end if;
	
	end process;

end behavioral;
