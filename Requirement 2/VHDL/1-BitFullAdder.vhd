library ieee;
use ieee.std_logic_1164.all;

-- 1 bit full adder entity.
-- Inputs a, b, cin.
-- O utputs s, cout.
Entity OneBitAdder is 
	Port(a, b: in std_logic; cin: in std_logic; s, cout: out std_logic);
End Entity OneBitAdder;

Architecture OneBitAdderImplementation of OneBitAdder is 
Begin
	-- A process invoked whenever one of the inputs is altered.
	Process (a, b, cin)
	Begin
		s <= a xor b xor cin;
		cout <= (a AND b) or (cin AND (a XOR b));
	End Process;

End OneBitAdderImplementation;
