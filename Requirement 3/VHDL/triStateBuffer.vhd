library ieee;
use ieee.std_logic_1164.all;

-- n-bit Tristate buffer.
Entity TriStateBuff is 
	Generic (n: integer := 32);
	port(A: in std_logic_vector(n-1 downTo 0); Enable: in std_logic; B: out std_logic_vector(n-1 downTo 0));
End Entity TriStateBuff;

Architecture TriStateBuffImplementation of TriStateBuff is 
Begin
	Process (A, Enable)
	Begin
		If (Enable = '1') Then
			B <= A; -- ToDo @Samir: Try to use := and see the difference.
		Else 
			B <= (others => 'Z'); 	
		End If;
	End Process;
End TriStateBuffImplementation;


