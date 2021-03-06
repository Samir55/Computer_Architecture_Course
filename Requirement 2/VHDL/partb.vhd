library ieee;
use ieee.std_logic_1164.all;

-- Prototyping PartB entity.
Entity NPartB is
	Generic (n: integer := 16);
	port(A, B: in std_logic_vector(n-1 downTo 0); S0, S1: in std_logic; F: out std_logic_vector(n-1 downTo 0));
End Entity NPartB;

-- Architecture of PartB. The implementation is done by using simple When else statements.
Architecture NPartBImplementation of NPartB is
Begin
	F <= (A and B) WHEN S1 = '0' and S0 = '0'
		ELSE (A or B) WHEN S1 = '0' and S0 = '1'
		ELSE (A xor B) WHEN S1 = '1' and S0 = '0'
		ELSE (not A);
End NPartBImplementation;

