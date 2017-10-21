vsim -gui work.registerfile
# Start time: 18:16:28 on Oct 06,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.registerfile(structuralmodel)
# Loading work.twotofourdecoder(twotofourdecoderimplementation)
# Loading work.registerwithbus(registerwithbusimplementation)
# Loading work.tristatebuff(tristatebuffimplementation)
# Loading work.nbitregister(nbitregisterimplementation)
mem load -i MemoryTest.mem /registerfile/RAMBLOCK/ram
add wave -position insertpoint  \
sim:/registerfile/Clk \
sim:/registerfile/Dest \
sim:/registerfile/InternalBus \
sim:/registerfile/Rst \
sim:/registerfile/Src \
sim:/registerfile/n
add wave -position insertpoint  \
sim:/registerfile/AX/RegisterInputD \
sim:/registerfile/AX/RegisterOutputQ
add wave -position insertpoint  \
sim:/registerfile/BX/RegisterInputD \
sim:/registerfile/BX/RegisterOutputQ
add wave -position insertpoint  \
sim:/registerfile/CX/RegisterInputD \
sim:/registerfile/CX/RegisterOutputQ
add wave -position insertpoint  \
sim:/registerfile/DX/RegisterInputD \
sim:/registerfile/DX/RegisterOutputQ
add wave  \
sim:/registerfile/MDR/RegisterInputD \
sim:/registerfile/MDR/RegisterOutputQ
add wave  \
sim:/registerfile/MAR/RegisterInputD \
sim:/registerfile/MAR/RegisterOutputQ
add wave  \
sim:/registerfile/RAMBLOCK/We

# Reset.
force -freeze sim:/registerfile/Clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/registerfile/Src 3'h0 0
force -freeze sim:/registerfile/Rst 1 0
force -freeze sim:/registerfile/Dest 3'h0 0
run
# Load BX With 8888
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Dest 3'h9 0
force -freeze sim:/registerfile/InternalBus 32'h8888 0
run
# Load Ax with 000000AA
force -freeze sim:/registerfile/InternalBus 32'h9999 0
force -freeze sim:/registerfile/Dest 3'h8 0

run

# Load MAR with 0004
force -freeze sim:/registerfile/InternalBus 32'h0004 0
force -freeze sim:/registerfile/Dest 3'hC 0
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
run

# WAIT 
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Dest 3'h0 0
force -freeze sim:/registerfile/SRC 3'h0 0
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
run 

# Transfer Data from MDR to AX
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Src 3'hD 0
force -freeze sim:/registerfile/Dest 3'h8 0
run

# Transfer Data from BX to MDR
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Src 3'h9 0
force -freeze sim:/registerfile/Dest 3'hD 0
run

# Write Data to ram
force -freeze sim:/registerfile/RAMBLOCK/We 1 0
force -freeze sim:/registerfile/Src 3'h0 0
force -freeze sim:/registerfile/Dest 3'h0 0
run

#Disable Ram Write Enable
force -freeze sim:/registerfile/RAMBLOCK/We 0 0

# Load MAR with 0001
force -freeze sim:/registerfile/InternalBus 32'h0001 0
force -freeze sim:/registerfile/Dest 3'hC 0
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
run

# WAIT 
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Dest 3'h0 0
force -freeze sim:/registerfile/SRC 3'h0 0
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
run 

# Load MAR with 0004
force -freeze sim:/registerfile/InternalBus 32'h0004 0
force -freeze sim:/registerfile/Dest 3'hC 0
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
run

# WAIT 
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Dest 3'h0 0
force -freeze sim:/registerfile/SRC 3'h0 0
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
run 