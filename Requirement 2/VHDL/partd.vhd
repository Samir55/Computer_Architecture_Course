library ieee;
use ieee.std_logic_1164.all;

-- Prototyping PartD entity.
Entity NPartD is
	Generic (n: integer := 16);
	port(A: in std_logic_vector(n-1 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(n-1 downTo 0));
End Entity NPartD;

-- Architecture of PartD. The implementation is done by using simple When else statements for both F(16 bits) and Cout (1 bit).
Architecture NPartDImplementation of NPartD is
Begin

-- Apply F output.
	F <= A(n-2 downTo 0) & '0' WHEN S1 = '0' and S0 = '0'
		ELSE A(n-2 downTo 0) & A(n-1) WHEN S1 = '0' and S0 = '1'
		ELSE A(n-2 downTo 0) & Cin   WHEN S1 = '1' and S0 = '0'
		ELSE (others => '0');

-- Apply Cout output.
	Cout <= A(n-1) WHEN S1 = '0' and S0 = '0'
		ELSE '0' WHEN S1 = '0' and S0 = '1'
		ELSE A(n-1) WHEN S1 = '1' and S0 = '0'
		ELSE '0';

End NPartDImplementation;

