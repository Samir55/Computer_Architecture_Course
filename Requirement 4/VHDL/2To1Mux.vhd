library ieee;
use ieee.std_logic_1164.all;

Entity TwoToOneMux is  
	Generic (n: integer := 16);
	port(In0, In1: in std_logic_vector(n-1 downTo 0); Sel: in std_logic; F: out std_logic_vector(n-1 downTo 0));
End Entity TwoToOneMux;

Architecture TwoToOneMuxImplementation OF TwoToOneMux IS
Begin
	Process (Sel, In0, In1)
	Begin
		If (Sel = '0') Then
			F <= In0; 
		Else 
			F <= In1; 	
		End If;
	End Process;
End TwoToOneMuxImplementation;

