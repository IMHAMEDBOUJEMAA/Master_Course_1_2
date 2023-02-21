library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity C4 is 
	port ( H, Reset : in std_logic;
	       S : out std_logic_vector(3 downto 0));
	
end C4;

architecture Behavioral of C4 is
    signal compteur : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
    process (H, Reset)
    begin
if ( Reset = '1') then 
	compteur <= "0000";
elsif (rising_edge(H)) then -- inc de 1 
	compteur <= std_logic_vector(unsigned(compteur)+ 1);
end if;
end process;
S <= compteur; 
end Behavioral;

-- process( clk ) 
-- begin
-- if (clk'EVENT) and ( clk = '1') then 
    --q <= d;
-- end if 