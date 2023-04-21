library IEEE; 
use IEEE.STD_logic_1164.all;

entity MUX is 
port (SEL : std_logic_vector(1 downto 0);
	E1, E2, E3, E4 : in std_logic;
	s : out std_logic);
end MUX;

architecture struct of MUX is 
begin 
	process(E1, E2, E3, E4, SEL) 
	begin 
if ( SEL = "00" ) Then 
	s <= E1;
elsif ( SEL = "01") Then 
	s <= E2;
elsif ( SEL = "10" ) Then
	s <= E3;
elsif ( SEL = "11" ) Then 
	s <= E4; 

end if; 
end process; 
end struct; 