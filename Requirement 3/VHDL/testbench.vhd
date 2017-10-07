LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY testbench IS
	-- Notice an empty entity because this is only used for testing
	-- this doesn't generate any hardware and is unsynthesizable
END testbench;

ARCHITECTURE testbench_a OF testbench IS
	
	COMPONENT RegisterFile IS
	Generic (n : integer :=32);
	port ( Src, Dest : in std_logic_vector (2 downto 0);
			Clk, Rst : in std_logic;
			InternalBus : inout std_logic_vector (n-1 downto 0));
	END COMPONENT;


	SIGNAL  Src, Dest :  std_logic_vector (2 downto 0);
	SIGNAL Clk, Rst :  std_logic;
	SIGNAL InternalBus :  std_logic_vector (31 downto 0);

	-- Notice the use of constants
        CONSTANT timestep : time :=100 ns;
	CONSTANT InternalBusZERO :  std_logic_vector (31 downto 0) := (others =>'0');
	
	BEGIN

	-- make an instants of the component we want to test
	ux: RegisterFile port map ( Src, Dest,Clk, Rst, InternalBus );

        -- Generate the clock signal
	PROCESS
	Begin
		Clk <= '0';
		wait for timestep;
		Clk <= '1';
		wait for timestep;
	end process;

	-- Create Test Cases
	PROCESS
			BEGIN
				-- Test Case 1, Reset All registers and try register ax value
				-- initialization is very important, you should always do it in any simulation
				Rst <= '1';
				Src <= "100";
				Dest <= "000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = InternalBusZERO)
				REPORT  " 0-Register is not zero after reset"
				SEVERITY ERROR;
				

				-- Lower the reset signal
				Rst <= '0';

				-- Test Case 2, Load AX with 000000AA
				-- put your input test case, write in AX
				Src <= "000";
				Dest <= "100";
				InternalBus <= x"000000AA";
				WAIT FOR 2*timestep;
				-- read the value of Ax (r0) on the bus to make sure the value was written to it
				Src <= "100";
				Dest <= "000";
				-- wherenever you write a value on a bus, you need to unforce it to allow 
				-- other modules to write on bus
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"000000AA")
				REPORT  " 1-Register A is not loaded with 00AA"
				SEVERITY ERROR;

				-- Test Case 3, Load BX with 000000BB
				Src <= "000";
				Dest <= "101";
				InternalBus <= x"000000BB";
				WAIT FOR 2*timestep;
				Src <= "101";
				Dest <= "000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"000000BB")
				REPORT  " 2-Register B is not loaded with 00BB"
				SEVERITY ERROR;

				-- Test Case 4, Load CX with 000000CC
				Src <= "000";
				Dest <= "110";
				InternalBus <= x"000000CC";
				WAIT FOR 2*timestep;
				Src <= "110";
				Dest <= "000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"000000CC")
				REPORT  " 3-Register C is not loaded with 00CC"
				SEVERITY ERROR;

				-- Test Case 5, Load DX with 000000DD
				Src <= "000";
				Dest <= "111";
				InternalBus <= x"000000DD";
				WAIT FOR 2*timestep;
				Src <= "111";
				Dest <= "000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"000000DD")
				REPORT  " 4-Register D is not loaded with 00DD"
				SEVERITY ERROR;
				
				-- Test Case 6, Transfer data from register r0 (ax) to r1 (bx)
				Src <= "100";
				Dest <= "101";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				Src <= "101";
				Dest <= "000";
				--InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"000000AA")
				REPORT  " 5-Transfer: Register B is not loaded with 00AA"
				SEVERITY ERROR;
				
				-- Test Case 7, Transfer data from register r2  to r0 
				Src <= "110";
				Dest <= "100";
				--InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				Src <= "100";
				Dest <= "000";
				--InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"000000CC")
				REPORT  " 6- Transfer: Register A is not loaded with 00CC"
				SEVERITY ERROR;

				-- Test Case 8, Transfer data from register r3  to r0 
				Src <= "111";
				Dest <= "100";
				--InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				Src <= "100";
				Dest <= "000";
				--InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"000000DD")
				REPORT  " 7-Transfer: Register A is not loaded with 00DD"
				SEVERITY ERROR;

				-- Stop Simulation
				WAIT;
		END PROCESS;
	
		
		
END testbench_a;
