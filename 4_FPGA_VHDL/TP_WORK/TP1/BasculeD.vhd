library IEEE;
use IEEE.std_logic_1164.all;

entity BD is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end BD;

architecture Behavioral of BD is
begin
    process(CLK)
    begin
-- la bascule est sensible au front montant de l'horloge
        if rising_edge(CLK) then 
            Q <= D;
        end if;
    end process;
end Behavioral;
