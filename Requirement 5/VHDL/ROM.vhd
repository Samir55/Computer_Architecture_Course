library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- The Rom is of length 25 bits [1-bit WE, 8 bits: Src enable and Src, Dest enable and Dest] and is of size 16.
Entity RomWithCounter is
	Generic (n: integer := 9);
	port( Clk : In std_logic; Rst: In std_logic; DataOut : out std_logic_vector(n-1 downTo 0));
End Entity RomWithCounter;

Architecture RomWithCounterImplementation of RomWithCounter is
	-- Counter.
	Signal counter: std_logic_vector(3 downTo 0);
	Type rom_type is Array(0 TO 15) OF std_logic_vector(n-1 downTo 0);
	Signal rom : rom_type  := ( -- For simulation purposes only. This must not be kept when synthesizing.
	-- [1-bit WE, 8 bits: Src enable and Src, Dest enable and Dest]
	   0     => '0' & X"0C", -- Load MAR with 0002 COMMAND. 
	   1     => '0' & X"0D", -- Load MDR with 9999 COMMAND.
	   2 	 => '1' & X"00", -- Write Data to ram COMMAND.
	   3 	 => '0' & X"0C", -- Load MAR with 0005 COMMAND.
           4 	 => '0' & X"00", -- WAIT FOR MDR TO CHECK.
	   5 	 => '0' & X"0C", -- Load MAR with 0002 COMMAND.
           6 	 => '0' & X"00", -- WAIT FOR MDR TO CHECK.
	  OTHERS => '0' & X"00"  
	);
Begin
	Process (clk) is
		Begin
			If RST = '1' THEN
				counter <= "0000";
				DataOut	 <= (others => '0');
			ElsIf rising_edge(clk) Then  
				counter <= counter + 1;
				DataOut	 <=  rom(to_integer(unsigned(counter)));
			End If;
	End Process;
End RomWithCounterImplementation;

