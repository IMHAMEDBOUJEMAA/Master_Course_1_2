library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;



entity BD is 
	port ( d : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		set : in std_logic; 
		q : out std_logic);
end BD;

architecture Behaivoral of BD is 

begin 

process(clk, reset, set)
begin 
	if (reset = '1') then
		q <= '0';
	elsif (set = '1') then 
		q <= '1';
	elsif (clk' event and clk = '1') then 
		q <= d;
	end if;
end process;
end Behaivoral;

