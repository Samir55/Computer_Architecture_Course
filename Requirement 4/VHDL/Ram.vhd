library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity Ram is
	Generic (n: integer := 16);
	port( Clk : In std_logic; We  : In std_logic; Address : In  std_logic_vector(5 downTo 0); DataIn  : In  std_logic_vector(n-1 downTo 0); DataOut : out std_logic_vector(n-1 downTo 0));
End Entity Ram;

Architecture RamImplementation of Ram is
	Type ram_type is Array(0 TO 63) OF std_logic_vector(n-1 downTo 0);
	Signal ram : ram_type  := ( -- For simulation purposes only. This must not be kept when synthesizing. 
	   0     => X"0065",
	   1     => X"0066",
	   2     => X"0067",
	   3 	 => X"0068",
	   4 	 => X"0069",
	  OTHERS => X"0000"    -- I also used MemoryTest.mem file to initialize memory.
	);
Begin
	Process (clk) IS
		Begin
			If rising_edge(clk) Then  
				If we = '1' Then
					ram(to_integer(unsigned(address))) <= datain;
				End If;
			End If;
	End Process;
	dataout <= ram(to_integer(unsigned(address)));
End RamImplementation;
