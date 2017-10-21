library ieee;
use ieee.std_logic_1164.all;

Entity RegisterFile is
	Generic (n : integer :=16);
	-- The Most Significant bit  in Src/Dest is the Enable bit a.k.a Src(3) or Dest(3)
	-- the other two bits are for selecting which register
        -- CLK and Rst are the same for all registers.
	port (Src, Dest : in std_logic_vector (3 downto 0);
			Clk, Rst, RamWriteEnable  : in std_logic;
			InternalBus : inout std_logic_vector (n-1 downto 0));
End RegisterFile;

Architecture StructuralModel of RegisterFile is
	Component Ram is
		Generic (n: integer := 16);
		port( Clk : In std_logic; We  : In std_logic; Address : In  std_logic_vector(5 downTo 0); DataIn  : In  std_logic_vector(15 downTo 0); DataOut : out std_logic_vector(15 downTo 0));
	End Component;

	Component RegisterWithBus is 
		Generic (n: integer := 16);
		port(InternalBus: inout std_logic_vector(n-1 downTo 0); Clk, Rst, WriteEnable, ReadEnable: in std_logic); -- Write Enable means write a value to this register (i.e. Dest).
	End Component;
	
	Component MARRegister is 
		Generic (n: integer := 16);
		port(InternalBus: inout std_logic_vector(n-1 downTo 0); RamAddress: out std_logic_vector(n-1 downTo 0); Clk, Rst, WriteEnable, ReadEnable: in std_logic);
	End Component;

	Component MDRRegister is 
		Generic (n: integer := 16);
		port(InternalBus: inout std_logic_vector(n-1 downTo 0); RamOutput: in std_logic_vector(n-1 downTo 0); RamInput: out std_logic_vector(n-1 downTo 0); Clk, Rst, WriteEnable, ReadEnable, RamWriteEnable: in std_logic);	End Component;
	
	Component ThreeToEightDecoder is 
		port(Enable, S2, S1, S0: in std_logic; F: out std_logic_vector(7 downTo 0));
	End Component;

	Signal SrcDecoderOutput, DestDecoderOutput: std_logic_vector(7 downTo 0);
	Signal RamClk, Temp0,Temp1,Temp2,Temp3, Temp4: std_logic;
	Signal RamInput, RamOutput, MAROutput: std_logic_vector(n-1 downto 0);
	Signal RamAddress: std_logic_vector(5 downto 0);
BEGIN
	-- Src and Dest Decoders.
	srcDecoder: ThreeToEightDecoder PORT MAP(Src(3), Src(2), Src(1), Src(0), SrcDecoderOutput);
	DestDecoder: ThreeToEightDecoder PORT MAP(Dest(3), Dest(2), Dest(1), Dest(0), DestDecoderOutput);

	Temp0 <= Clk and DestDecoderOutput(0);  -- Used to write only to prevent passing Z to other registers.
	Temp1 <= Clk and DestDecoderOutput(1);
	Temp2 <= Clk and DestDecoderOutput(2);
	Temp3 <= Clk and DestDecoderOutput(3);
	Temp4 <= ClK and DestDecoderOutput(4);

	-- The Four Registers.
	AX: RegisterWithBus GENERIC MAP (n=>16) PORT MAP(InternalBus, temp0, Rst, DestDecoderOutput(0), SrcDecoderOutput(0));
	BX: RegisterWithBus GENERIC MAP (n=>16) PORT MAP(InternalBus, temp1, Rst, DestDecoderOutput(1), SrcDecoderOutput(1));
	CX: RegisterWithBus GENERIC MAP (n=>16) PORT MAP(InternalBus, temp2, Rst, DestDecoderOutput(2), SrcDecoderOutput(2));
	DX: RegisterWithBus GENERIC MAP (n=>16) PORT MAP(InternalBus, temp3, Rst, DestDecoderOutput(3), SrcDecoderOutput(3));

	-- RAM
	RamClk <= (not Clk);
	RamAddress <= MAROutput(5 downTo 0);
	RAMBLOCK: Ram GENERIC MAP (n=>16) PORT MAP(RamClk, RamWriteEnable, RamAddress, RamInput, RamOutput);
	
	MAR: MARRegister GENERIC MAP (n=>16) PORT MAP(InternalBus, MAROutput, Temp4, Rst, DestDecoderOutput(4), SrcDecoderOutput(4));
	MDR: MDRRegister GENERIC MAP (n=>16) PORT MAP(InternalBus, RamOutput, RamInput, Clk, Rst, DestDecoderOutput(5), SrcDecoderOutput(5), RamWriteEnable);
	
End StructuralModel;

