library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Tri_a_bulles is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           in_data : in STD_LOGIC_VECTOR(31 downto 0);
           out_data : out STD_LOGIC_VECTOR(31 downto 0));
end Tri_a_bulles;

architecture Behavioral of Tri_a_bulles is
    type int_array is array(0 to 9) of integer range 0 to 2**32-1;
    signal data : int_array;
    signal sorted_data : int_array;
    signal i, j : integer range 0 to 9;
    signal sorted : boolean := false;
begin

    -- Lecture des données d'entrée
    read_data : process(clk)
    begin
        if rising_edge(clk) then
            if start = '1' then
                for k in 0 to 9 loop
                    data(k) <= to_integer(unsigned(in_data((k*32)+31 downto k*32)));
                end loop;
            end if;
        end if;
    end process read_data;

    -- Algorithme de tri à bulles
    sort_data : process(clk)
    begin
        if rising_edge(clk) then
            if start = '1' then
                -- Initialisation des valeurs
                for k in 0 to 9 loop
                    sorted_data(k) <= data(k);
                end loop;
                sorted <= false;
                i <= 0;
                j <= 0;
            else
                -- Tri des valeurs
                if not sorted then
                    if j = 9 then
                        if i = 9 then
                            sorted <= true;
                        else
                            i <= i+1;
                            j <= 0;
                        end if;
                    else
                        if sorted_data(j) > sorted_data(j+1) then
                            sorted_data(j) <= sorted_data(j) xor sorted_data(j+1);
                            sorted_data(j+1) <= sorted_data(j) xor sorted_data(j+1);
                            sorted_data(j) <= sorted_data(j) xor sorted_data(j+1);
                        end if;
                        j <= j+1;
                    end if;
                end if;
            end if;
        end if;
    end process sort_data;

    -- Ecriture des données triées
    write_data : process(clk)
    begin
        if rising_edge(clk) then
            if start = '1' and sorted = true then
                for k in 0 to 9 loop
                    out_data((k*32)+31 downto k*32) <= std_logic_vector(to_unsigned(sorted_data(k), 32));
                end loop;
            end if;
        end if;
    end process write_data;

end Behavioral;
