library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port(
        P         : in  std_logic_vector(3 downto 0);
        load      : in  std_logic;
        Clk       : in  std_logic;
        clear     : in  std_logic;
        count_ena : in  std_logic;
        direction : in  std_logic;
        Q         : out std_logic_vector(3 downto 0)
    );
end entity counter;

architecture rtl of counter is
    signal counter_val : unsigned(3 downto 0);
begin
    process(Clk)
    begin
        if rising_edge(Clk) then
            if clear = '1' then
                counter_val <= (others => '0');
            elsif load = '1' and clear = '0' then
                counter_val <= unsigned(P);
            elsif count_ena = '1' then
                if direction = '0' then
                    counter_val <= counter_val - 1;
                else
                    counter_val <= counter_val + 1;
                end if;
            end if;
        end if;
    end process;
    
    Q <= std_logic_vector(counter_val);
end architecture rtl;

