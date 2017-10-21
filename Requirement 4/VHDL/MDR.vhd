library ieee;
use ieee.std_logic_1164.all;

-- MDR register module connected with read/write enable ready to be integrated in the control cicuit.
Entity MDRRegister is 
	Generic (n: integer := 16);
	port(InternalBus: inout std_logic_vector(n-1 downTo 0); RamOutput: in std_logic_vector(n-1 downTo 0); RamInput: out std_logic_vector(n-1 downTo 0); Clk, Rst, WriteEnable, ReadEnable, RamWriteEnable: in std_logic);
End Entity MDRRegister;

Architecture MDRRegisterImplementation of MDRRegister is 

	Component nBitRegister is 
		Generic (n: integer := 16);
		port(D: in std_logic_vector(n-1 downTo 0); Q: out std_logic_vector(n-1 downTo 0); Clk, Rst: in std_logic);
	End Component;

	Component TriStateBuff is 
		Generic (n: integer := 16);
		port(A: in std_logic_vector(n-1 downTo 0); Enable: in std_logic; B: out std_logic_vector(n-1 downTo 0));
	End Component;

	Component TwoToOneMux is  
		Generic (n: integer := 16);
		port(In0, In1: in std_logic_vector(n-1 downTo 0); Sel: in std_logic; F: out std_logic_vector(n-1 downTo 0));
	End Component;
	
	Signal RegisterInputD, RegisterOutputQ: std_logic_vector(n-1 downTo 0);
	Signal MuxOutput: std_logic_vector(n-1 downTo 0);
Begin
	WriteMultiplexer: TwoToOneMux GENERIC MAP (n=>16) PORT MAP(RamOutput, InternalBus, WriteEnable, MuxOutput);
	RegisterInputD <= MuxOutput;

	NRegister : nBitRegister GENERIC MAP (n=>16) PORT MAP(RegisterInputD, RegisterOutputQ, Clk, Rst);

	ReadTriStateBuffer: TriStateBuff GENERIC MAP (n=>16) PORT MAP(RegisterOutputQ, ReadEnable, InternalBus);

	RamReadTriStateBuffer: TriStateBuff GENERIC MAP (n=>16) PORT MAP(RegisterOutputQ, RamWriteEnable, RamInput);
End MDRRegisterImplementation;




