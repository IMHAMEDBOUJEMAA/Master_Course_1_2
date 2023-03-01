library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_transcoder is
    Port ( clk: in STD_LOGIC;
           reset: in STD_LOGIC;
           x: in UNSIGNED (3 downto 0);
           y: out STD_LOGIC_VECTOR (6 downto 0));
end counter_transcoder;

architecture rtl of counter_transcoder is
    signal counter : UNSIGNED (3 downto 0) := (others => '0');
begin

    process (clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;

    y <= STD_LOGIC_VECTOR(to_integer(unsigned(counter)) + to_integer(unsigned(x)));

end rtl;

