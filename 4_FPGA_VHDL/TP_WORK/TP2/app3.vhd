library ieee;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_1164.all; -- use library 

entity transcoder is 
	port( 
		input : in std_logic_vector(3 downto 0); -- vect a 4 bits contient les valeurs a transcoder 
		output : out std_logic_vector(6 downto 0)); -- vect a 7 bits contient les segments a allumer 

end transcoder;

architecture Behavioral of transcoder is 
begin 
	with input select 
		output <= "1111110" when "0000",
			  "0110000" when "0001",
			  "1101101" when "0010",
			  "1111001" when "0011",
			  "0110011" when "0100",
			  "1011011" when "0101",
			  "1011111" when "0110",
			  "1110000" when "0111",
			  "1111111" when "1000",
			  "1111110" when "1001",
			  "1111011" when others;
	--true Behavioral;
end Behavioral;
