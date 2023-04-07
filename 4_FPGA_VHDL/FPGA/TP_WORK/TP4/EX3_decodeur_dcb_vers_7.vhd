library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity EX3_BCD is
    port (d: in std_logic_vector(2 downto 0);
          a: out std_logic_vector(6 downto 0));
end entity;

architecture rtl of EX3_BCD is
begin
    process (d)
    begin
        case d is
            when "000" =>
                a <= "0000001";
            when "001" =>
                a <= "1001111";
            when "010" =>
                a <= "0010010";
            when "011" =>
                a <= "0000110";
            when "100" =>
                a <= "1001100";
            when "101" =>
                a <= "0100100";
            when "110" =>
                a <= "0100000";
            when "111" =>
                a <= "0001110";
            when others =>
                a <= "0000000"; -- kif tebda el sortie ghalta 
        end case;
    end process;
end architecture;

