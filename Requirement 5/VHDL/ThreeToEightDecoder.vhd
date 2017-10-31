library ieee;
use ieee.std_logic_1164.all;

-- 3-8 Decoder
Entity ThreeToEightDecoder is 
	port(Enable, S2, S1, S0: in std_logic; F: out std_logic_vector(7 downTo 0));
End Entity ThreeToEightDecoder;

Architecture ThreeToEightDecoderImplementation of ThreeToEightDecoder is 
Begin
	Process (Enable, S2, S1, S0)
	Begin
		If Enable = '1' Then
			If 	(S2 = '0' and S1 = '0' and S0 = '0') Then
				F <= (0 => '1', others => '0');

			ElsIf  	(S2 = '0' and S1 = '0' and S0 = '1') Then
				F <= (1 => '1', others => '0');

			ElsIf  	(S2 = '0' and S1 = '1' and S0 = '0') Then
				F <= (2 => '1', others => '0');

			ElsIf  	(S2 = '0' and S1 = '1' and S0 = '1') Then
				F <= (3 => '1', others => '0');

			ElsIf  	(S2 = '1' and S1 = '0' and S0 = '0') Then
				F <= (4 => '1', others => '0');

			ElsIf  	(S2 = '1' and S1 = '0' and S0 = '1') Then
				F <= (5 => '1', others => '0');

			Else
				F <= (others => '0');	

			END IF;
		Else 
			F <= (others => '0');
		End If;
	End Process;
End ThreeToEightDecoderImplementation;



