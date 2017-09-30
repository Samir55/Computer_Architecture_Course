library ieee;
use ieee.std_logic_1164.all;

-- Prototyping PartC entity.
Entity NPartC is
	Generic (n: integer := 16);
	port(A: in std_logic_vector(n-1 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(n-1 downTo 0));
End Entity NPartC;

-- Architecture of PartC. The implementation is done by using simple When else statements for both F(16 bits) and Cout (1 bit).
Architecture NPartCImplementation of NPartC is
Begin

-- Apply F output.
	F <= '0' & A(n-1 downTo 1) WHEN S1 = '0' and S0 = '0'
		ELSE A(0)& A(n-1 downTo 1) WHEN S1 = '0' and S0 = '1'
		ELSE Cin & A(n-1 downTo 1) WHEN S1 = '1' and S0 = '0'
		ELSE A(n-1) & A(n-1 downTo 1);

-- Apply Cout output.
	Cout <= A(0) WHEN S1 = '0' and S0 = '0'
		ELSE '0' WHEN S1 = '0' and S0 = '1'
		ELSE A(0) WHEN S1 = '1' and S0 = '0'
		ELSE A(0); 

End NPartCImplementation;

