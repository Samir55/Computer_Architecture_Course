LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY testbench IS
	-- Notice an empty entity because this is only used for testing
	-- this doesn't generate any hardware and is unsynthesizable
END testbench;

ARCHITECTURE testbench_a OF testbench IS
	Component RegisterFile is
		Generic (n : integer :=16);
		-- The Most Significant bit  in Src/Dest is the Enable bit a.k.a Src(3) or Dest(3)
		-- the other two bits are for selecting which register
       		-- CLK and Rst are the same for all registers.
		port (Src, Dest : in std_logic_vector (3 downto 0);
			Clk, Rst, RamWriteEnable  : in std_logic;
			InternalBus : inout std_logic_vector (n-1 downto 0));
	End Component;

	SIGNAL  Src, Dest :  std_logic_vector (3 downto 0);
	SIGNAL Clk, Rst, RamWriteEnable : std_logic;
	SIGNAL InternalBus :  std_logic_vector (15 downto 0);

	-- Notice the use of constants
        CONSTANT timestep : time := 10 ns;
	CONSTANT InternalBusZERO :  std_logic_vector (15 downto 0) := (others =>'0');
	
	BEGIN

	-- make an instants of the component we want to test
	ux: RegisterFile port map (Src, Dest, Clk, Rst, RamWriteEnable, InternalBus);

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
				RamWriteEnable <= '0';	
				-- Test Case 1, Reset All registers and try register ax value
				-- initialization is very important, you should always do it in any simulation
				Rst <= '1';
				Src <= "1000";
				Dest <= "0000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = InternalBusZERO)
				REPORT  " TEST 1: Register is not zero after reset"
				SEVERITY ERROR;
				

				-- Lower the reset signal
				Rst <= '0';

				-- Test Case 2, Load (R2) CX With 8888
				-- put your input test case, write in AX
				Src <= "0000";
				Dest <= "1010";
				InternalBus <= x"8888";
				WAIT FOR 2*timestep;
				-- read the value of BX (r1) on the bus to make sure the value was written to it
				Src <= "1010";
				Dest <= "0000";
				-- wherenever you write a value on a bus, you need to unforce it to allow 
				-- other modules to write on bus
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"8888")
				REPORT  "TEST 2: Register C is not loaded with 8888"
				SEVERITY ERROR;

				-- Test Case 3, Load BX with 9999
				Src <= "0000";
				Dest <= "1001";
				InternalBus <= x"9999";
				WAIT FOR 2*timestep;
				Src <= "1001";
				Dest <= "0000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"9999")
				REPORT  "TEST 3: Register B is not loaded with 9999"
				SEVERITY ERROR;

				-- Test Case 4, Load MAR with 0004
				Src <= "0000";
				Dest <= "1100";
				InternalBus <= x"0004";
				WAIT FOR 2*timestep;
				Src <= "1100";
				Dest <= "0000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"0004")
				REPORT  "TEST 4: Register C is not loaded with 0004"
				SEVERITY ERROR;

				-- Test Case 5, Read data from MDR.
				Src <= "1101";
				Dest <= "0000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"0069")
				REPORT  "TEST 5: MDR is not loaded with 0069"
				SEVERITY ERROR;
				
				-- Test Case 6, Transfer data from register MDR to r1 (Bx)
				Src <= "1101";
				Dest <= "1001";
				--InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				Src <= "1001";
				Dest <= "0000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"0069")
				REPORT  "TEST 6: Transfer: Register B is not loaded with 0069"
				SEVERITY ERROR;
				
				-- Test Case 7, Transfer data from register r2 to MDR, Write data to Ram. load 0001 to MAR and check reading.
				Src <= "1010";
				Dest <= "1101";
				WAIT FOR 2*timestep;
				Src <= "0000";
				Dest <= "0000";
				RamWriteEnable <= '1'; -- Write data to RAM.
				WAIT FOR 2*timestep;
				RamWriteEnable <= '0';			
				Src <= "0000";
				Dest <= "1100";
				InternalBus <= x"0001";
				WAIT FOR 2*timestep;
				Src <= "1101";
				Dest <= "0000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				ASSERT(InternalBus = X"0066")
				REPORT  " TEST 8: Transfer: MDR is not loaded with 0066"
				SEVERITY ERROR;

				-- Test Case 9, Read what is found in address 0004 in Ram from MDR.
				Src <= "0000";
				Dest <= "1100";
				InternalBus <= x"0004";
				--InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				Src <= "1101";
				Dest <= "0000";
				InternalBus <= (others => 'Z');
				WAIT FOR 2*timestep;
				WAIT FOR timestep;
				ASSERT(InternalBus = X"8888")
				REPORT  " TEST 9: Transfer: MDR is not loaded with 8888"
				SEVERITY ERROR;

				-- Stop Simulation
				WAIT;
		END PROCESS;
	
		
		
END testbench_a;
