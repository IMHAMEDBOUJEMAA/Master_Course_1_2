library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparateur_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Egal : out STD_LOGIC;
           Sup : out STD_LOGIC;
           Inf : out STD_LOGIC);
end comparateur_8;

architecture Behavioral of comparateur_8 is
begin

    Egal <= '1' when A = B else '0';
    Sup <= '1' when A > B else '0';
    Inf <= '1' when A < B else '0';

end Behavioral;

