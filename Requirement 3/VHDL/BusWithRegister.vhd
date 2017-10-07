library ieee;
use ieee.std_logic_1164.all;

-- A register module connected with read/write enable ready to be integrated in the control cicuit.
Entity RegisterWithBus is 
	Generic (n: integer := 32);
	port(InternalBus: inout std_logic_vector(n-1 downTo 0); Clk, Rst, WriteEnable, ReadEnable: in std_logic);
End Entity RegisterWithBus;

Architecture RegisterWithBusImplementation of RegisterWithBus is 

	Component nBitRegister is 
		Generic (n: integer := 32);
		port(D: in std_logic_vector(n-1 downTo 0); Q: out std_logic_vector(n-1 downTo 0); Clk, Rst: in std_logic);
	End Component;

	Component TriStateBuff is 
		Generic (n: integer := 32);
		port(A: in std_logic_vector(n-1 downTo 0); Enable: in std_logic; B: out std_logic_vector(n-1 downTo 0));
	End Component;
	
	Signal RegisterInputD, RegisterOutputQ: std_logic_vector(n-1 downTo 0);
Begin
	WriteTriStateBuffer: TriStateBuff GENERIC MAP (n=>32) PORT MAP(InternalBus, WriteEnable, RegisterInputD); -- Write Enable means write a value to this register.
	ReadTriStateBuffer: TriStateBuff GENERIC MAP (n=>32) PORT MAP(RegisterOutputQ, ReadEnable, InternalBus);
	NRegister : nBitRegister GENERIC MAP (n=>32) PORT MAP(RegisterInputD, RegisterOutputQ, Clk, Rst);

End RegisterWithBusImplementation;



