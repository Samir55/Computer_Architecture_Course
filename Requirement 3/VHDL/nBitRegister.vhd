library ieee;
use ieee.std_logic_1164.all;

-- n-Bit D Flip Flop Register.
Entity nBitRegister is 
	Generic (n: integer := 32);
	port(D: in std_logic_vector(n-1 downTo 0); Q: out std_logic_vector(n-1 downTo 0); Clk, Rst: in std_logic);
End Entity nBitRegister;

Architecture nBitRegisterImplementation of nBitRegister is 
Begin
	Process (Clk, Rst)
	Begin
		If Rst = '1' Then
			Q <= (others => '0'); -- ToDo @Samir And Also Ask is it required to output immediately 'Z' after it.
		ElsIf rising_edge(Clk) Then
			Q <= D;
		End If;
	End Process;
End nBitRegisterImplementation;


