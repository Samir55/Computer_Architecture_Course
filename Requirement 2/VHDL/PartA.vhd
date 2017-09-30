library ieee;
use ieee.std_logic_1164.all;

-- N bits partA entity.
-- Inputs A, B, Cin .
-- Outputs  F, Cout.
Entity NPartA is 
	Generic (n: integer := 16);
	port(A, B: in std_logic_vector(n-1 downTo 0); Cin, S0, S1: in std_logic; Cout: out std_logic; F: out std_logic_vector(n-1 downTo 0));
End Entity NPartA;

Architecture NPartAImplementation of NPartA is 

	Component NBitAdder 
		Generic (n : integer := 16);
		Port(A, B: in std_logic_vector(n-1 downTo 0); Cin: in std_logic; S: out std_logic_vector(n-1 downTo 0); Cout: out std_logic);
	End Component;
	Signal AIn: std_logic_vector (n-1 downTo 0);
	Signal BIn: std_logic_vector (n-1 downTo 0);
	Signal CarryIn: std_logic;
Begin
	Process (S1, S0, A, B, Cin) 
	Begin
		IF (S1 = '0' and S0 = '0') THEN
			AIn <= A;
			BIn <= (others => '0');
			CarryIn <= Cin;
		ELSIF  (S1 = '0' and S0 = '1') THEN
			AIn <= A;
			BIn <= B;
			CarryIn <= Cin;
		ELSIF  (S1 = '1' and S0 = '0') THEN
			AIn <= A;
			BIn <= not B;
			CarryIn <= Cin; 
		ELSE
			IF Cin = '0' THEN
				AIn <= A;
				BIn <= (others => '1');
				CarryIn <= Cin; 
			ELSE 
				AIn <= (others => '0');
				BIn <= (others => '0');
				CarryIn <= not Cin;
			END IF;
		END IF;
	End Process;
	
	Adder: NBitAdder GENERIC MAP (n=>16) PORT MAP(AIn, BIn, CarryIn, F, Cout);  -- I am using a sinlge Full adder instance.

End NPartAImplementation;

