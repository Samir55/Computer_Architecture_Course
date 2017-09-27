library ieee;
use ieee.std_logic_1164.all;

-- Prototyping PartC entity.
Entity PartC is
	port(A: in std_logic_vector(15 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(15 downTo 0));
End Entity PartC;

-- Architecture of PartC. The implementation is done by using simple When else statements for both F(16 bits) and Cout (1 bit).
Architecture PartCImplementation of PartC is
Begin

-- Apply F output.
	F <= '0' & A(15 downTo 1) WHEN S1 = '0' and S0 = '0'
		ELSE A(0)& A(15 downTo 1) WHEN S1 = '0' and S0 = '1'
		ELSE Cin & A(15 downTo 1) WHEN S1 = '1' and S0 = '0'
		ELSE A(15) & A(15 downTo 1);

-- Apply Cout output.
	Cout <= '0' WHEN S1 = '0' and S0 = '0'
		ELSE '0' WHEN S1 = '0' and S0 = '1' 
		ELSE A(0) WHEN S1 = '1' and S0 = '0'
		ELSE '0'; 

End PartCImplementation;
