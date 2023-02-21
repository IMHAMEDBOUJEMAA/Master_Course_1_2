-- FULL ADDER ( 1 bit)
-- Entity 
entity FULLADD is 
port (A,B,CIN : in bit;
	COUT,S: out bit);
end FULLADD; 
--Architecture 
architecture struct of FULLADD is 
-- signals 
signal I1, I2, I3 : bit;
-- use HALF ADDER 
component HALFADD 
port (A,B : in bit;
		S,C : out bit);
end component;
-- Begin 

begin 
HA1:HALFADD port map (A,B,I1,I2); 
HA2:HALFADD port map (I1,CIN,S,I3);
COUT <= I3 or I2;
end struct; 
