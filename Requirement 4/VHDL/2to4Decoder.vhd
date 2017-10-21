library ieee;
use ieee.std_logic_1164.all;

-- 2-4 Decoder
Entity TwoToFourDecoder is 
	port(Enable, S1, S0: in std_logic; F: out std_logic_vector(3 downTo 0));
End Entity TwoToFourDecoder;

Architecture TwoToFourDecoderImplementation of TwoToFourDecoder is 
Begin
	Process (Enable, S1, S0)
	Begin
		If Enable = '1' Then
			If (S1 = '0' and S0 = '0') Then
				F <= (0 => '1', others => '0');
				--F <= (others => 'Z');
			ElsIf  (S1 = '0' and S0 = '1') Then
				F <= (1 => '1', others => '0');
				--F <= (others => 'Z');
			ElsIf  (S1 = '1' and S0 = '0') Then
				F <= (2 => '1', others => '0');
				--F <= (others => 'Z');
			Else
				F <= (3 => '1', others => '0');
				--F <= (others => 'Z');
			END IF;
		Else 
			F <= (others => '0');
			--F <= (others => 'Z');
		End If;
	End Process;
End TwoToFourDecoderImplementation;


