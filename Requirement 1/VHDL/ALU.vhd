library ieee;
use ieee.std_logic_1164.all;

-- ALU Entity of all inputs(A, B, Cin) and all outputs (F, Cout)
Entity ALU is 
	port(A, B: in std_logic_vector(15 downTo 0); Cin, S0, S1, S2, S3: in std_logic; Cout: out std_logic; F: out std_logic_vector(15 downTo 0));
End Entity ALU;


-- ALU structural model implementation.
-- It consits of three components (partb, partc, partd) and signal wires connecting the outputs of each part to their corresponding outputs in the ALU. 
Architecture ALUImplementation of ALU is 

	Component PartB is
		port(A, B: in std_logic_vector(15 downTo 0); S0, S1: in std_logic; F: out std_logic_vector(15 downTo 0));
	End Component; 

	Component PartC is
		port(A: in std_logic_vector(15 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(15 downTo 0));
	End Component;

	Component PartD is
		port(A: in std_logic_vector(15 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(15 downTo 0));
	End Component;
	
	Signal FB, FC, FD: std_logic_vector(15 downTo 0);
	Signal CoutC, CoutD: std_logic;
Begin
-- Declaring the instances of the components in the ALU.
	BPart: PartB PORT MAP(A, B, S0, S1, FB); 
	CPart: PartC PORT MAP(A, Cin, S0, S1, CoutC, FC);
	DPart: PartD PORT MAP(A, Cin, S0, S1, CoutD, FD);

-- Apply F output.
	F <= FB WHEN S3 = '0' and S2 = '1'
		ELSE FC WHEN S3 = '1' and S2 = '0'
		ELSE FD   WHEN S3 = '1' and S2 = '1'
		ELSE (others => '0');

-- Apply Cout output.
	Cout <= '0' WHEN S3 = '0' and S2 = '1'
		ELSE CoutC WHEN S3 = '1' and S2 = '0'
		ELSE CoutD WHEN S3 = '1' and S2 = '1'
		ELSE '0';
End ALUImplementation;

