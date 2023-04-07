library ieee; 

use ieee.std_logic_1164.all;

entity EX1 is 
	port ( 
		a,b : in std_logic;
		y : out std_logic
	);
end entity EX1;


architecture rtl of EX1 is 
begin 
	y <= ( a and not b) or (b and not a );
end architecture rtl;