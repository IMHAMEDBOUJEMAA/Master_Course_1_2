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

case SEL is 
	when "00" =>
	 s <= E1;
	when "01" =>
	 s <= E2;
	when "10" =>
	 s <= E3;
	when "11" =>
	 s <= E4;
end case; 

end process; 
end struct; 