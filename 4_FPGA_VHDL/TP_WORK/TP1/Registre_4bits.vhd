library IEEE;
use IEEE.std_logic_1164.all;

entity register_4 is
    Port ( CLK : in STD_LOGIC;
           SI : in STD_LOGIC;
           SO : out STD_LOGIC;
           RST : in STD_LOGIC);
end register_4;

architecture Behavioral of register_4 is
    signal Q1, Q2, Q3, Q4 : STD_LOGIC;

begin
    -- Instanciation de 4 bascules D
    d1: entity work.BD port map(D => SI, CLK => CLK, Q => Q1);
    d2: entity work.BD port map(D => Q1, CLK => CLK, Q => Q2);
    d3: entity work.BD port map(D => Q2, CLK => CLK, Q => Q3);
    d4: entity work.BD port map(D => Q3, CLK => CLK, Q => Q4);
    
    -- Sortie de la dernière bascule
    SO <= Q4;

    -- Réinitialisation
    process(RST)
    begin
        if RST = '1' then
            Q1 <= '0';
            Q2 <= '0';
            Q3 <= '0';
            Q4 <= '0';
        end if;
    end process;
    
end Behavioral;
