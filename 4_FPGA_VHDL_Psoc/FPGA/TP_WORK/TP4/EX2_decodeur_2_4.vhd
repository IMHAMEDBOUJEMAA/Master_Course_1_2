library ieee;
use ieee.std_logic_1164.all;

entity decoder_2vers4 is
    port (
        A, B : in std_logic;
        s0, s1, s2, s3 : out std_logic
    );
end entity decoder_2vers4;

architecture rtl of decoder_2vers4 is
begin
    s0 <= (not A) and (not B);
    s1 <= (not A) and B;
    s2 <= A and (not B);
    s3 <= A and B;
end architecture rtl;
