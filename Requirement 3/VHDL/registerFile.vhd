library ieee;
use ieee.std_logic_1164.all;

Entity RegisterFile is
	Generic (n : integer :=32);
	-- The Most Significant bit  in Src/Dest is the Enable bit a.k.a Src(2) or Dest(2)
	-- the other two bits are for selecting which register
        -- CLK and Rst are the same for all registers.
	port (Src, Dest : in std_logic_vector (2 downto 0);
			Clk, Rst : in std_logic;
			InternalBus : inout std_logic_vector (n-1 downto 0));
End RegisterFile;

Architecture StructuralModel of RegisterFile is

	Component RegisterWithBus is 
		Generic (n: integer := 32);
		port(InternalBus: inout std_logic_vector(n-1 downTo 0); Clk, Rst, WriteEnable, ReadEnable: in std_logic); -- Write Enable means write a value to this register (i.e. Dest).
	End Component;

	Component TwoToFourDecoder is 
		port(Enable, S1, S0: in std_logic; F: out std_logic_vector(3 downTo 0));
	End Component;

	Signal SrcDecoderOutput, DestDecoderOutput: std_logic_vector(3 downTo 0);
	Signal Temp0,Temp1,Temp2,Temp3: std_logic;
BEGIN
	-- Src and Dest Decoders.
	srcDecoder: TwoToFourDecoder PORT MAP(Src(2), Src(1), Src(0), SrcDecoderOutput);
	DestDecoder: TwoToFourDecoder PORT MAP(Dest(2), Dest(1), Dest(0), DestDecoderOutput);

	Temp0 <= Clk and DestDecoderOutput(0);  -- Used to write only to prevent passing Z to other registers.
	Temp1 <= Clk and DestDecoderOutput(1);
	Temp2 <= Clk and DestDecoderOutput(2);
	Temp3 <= Clk and DestDecoderOutput(3);

	-- The Four Registers.
	AX: RegisterWithBus GENERIC MAP (n=>32) PORT MAP(InternalBus, temp0, Rst, DestDecoderOutput(0), SrcDecoderOutput(0));
	BX: RegisterWithBus GENERIC MAP (n=>32) PORT MAP(InternalBus, temp1, Rst, DestDecoderOutput(1), SrcDecoderOutput(1));
	CX: RegisterWithBus GENERIC MAP (n=>32) PORT MAP(InternalBus, temp2, Rst, DestDecoderOutput(2), SrcDecoderOutput(2));
	DX: RegisterWithBus GENERIC MAP (n=>32) PORT MAP(InternalBus, temp3, Rst, DestDecoderOutput(3), SrcDecoderOutput(3));
	
End StructuralModel;

