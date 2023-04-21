library ieee;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_1164.all; -- use library 


entity detecteur_parite is 
	port ( 
		E : in std_logic_vector(7 downto 0 );
		S : out std_logic );

end detecteur_parite;

architecture Behavioral of detecteur_parite is 
begin
	process(E)
		variable sum : integer  range 0 to 8 :=0;
	begin 
		for i in E'range loop
			if E(i) = '1' then 
				sum := sum +1;
			end if;
		end loop;
		if sum mod 2 = 0 then 
			S <= '0';
		else 
			S <= '1';
		end if ;
	end process;
end Behavioral; 