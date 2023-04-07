library ieee;
use ieee.std_logic_1164.all;

entity encoder_8_3 is
port (
    e : in std_logic_vector(7 downto 0);
    s : out std_logic_vector(2 downto 0)
);
end encoder_8_3;

architecture behavioral of encoder_8_3 is
begin

    s(0) <= e(0) or e(2) or e(4) or e(6);
    s(1) <= e(1) or e(2) or e(5) or e(6);
    s(2) <= e(3) or e(4) or e(5) or e(6);

end behavioral;

