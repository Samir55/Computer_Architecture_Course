library ieee;
use ieee.std_logic_1164.all;

-- ALU Entity of all inputs(A, B, Cin) and all outputs (F, Cout)
Entity ALSU is 
	Generic (n: integer := 16);
	port(A, B: in std_logic_vector(n-1 downTo 0); Cin, S0, S1, S2, S3: in std_logic; Cout: out std_logic; F: out std_logic_vector(n-1 downTo 0));
End Entity ALSU;


-- ALSU structural model implementation.
-- It consits of four components (nparta, npartb, npartc, npartd) and signal wires connecting the outputs of each part to their corresponding outputs in the ALSU. 
Architecture ALSUImplementation of ALSU is 

	Component NPartA is 
		Generic (n: integer := 16);
		port(A, B: in std_logic_vector(n-1 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(n-1 downTo 0));
	End Component;

	Component NPartB is
		Generic (n : integer := 16);
		port(A, B: in std_logic_vector(n-1 downTo 0); S0, S1: in std_logic; F: out std_logic_vector(n-1 downTo 0));
	End Component; 

	Component NPartC is
		Generic (n : integer := 16);
		port(A: in std_logic_vector(n-1 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(n-1 downTo 0));
	End Component;

	Component NPartD is
		Generic (n : integer := 16);
		port(A: in std_logic_vector(n-1 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(n-1 downTo 0));
	End Component;
	
	Signal FA, FB, FC, FD: std_logic_vector(n-1 downTo 0);
	Signal CoutA, CoutC, CoutD: std_logic;
Begin
-- Declaring the instances of the components in the ALU.
	NAPart: NPartA GENERIC MAP (n=>16) PORT MAP(A, B, Cin, S0, S1, CoutA, FA); 
	NBPart: NPartB GENERIC MAP (n=>16) PORT MAP(A, B, S0, S1, FB); 
	NCPart: NPartC GENERIC MAP (n=>16) PORT MAP(A, Cin, S0, S1, CoutC, FC);
	NDPart: NPartD GENERIC MAP (n=>16) PORT MAP(A, Cin, S0, S1, CoutD, FD);

-- Apply F output.
	F <= FB WHEN S3 = '0' and S2 = '1'
		ELSE FC WHEN S3 = '1' and S2 = '0'
		ELSE FD   WHEN S3 = '1' and S2 = '1'
		ELSE FA;

-- Apply Cout output.
	Cout <= '0' WHEN S3 = '0' and S2 = '1'
		ELSE CoutC WHEN S3 = '1' and S2 = '0'
		ELSE CoutD WHEN S3 = '1' and S2 = '1'
		ELSE CoutA;
End ALSUImplementation;

