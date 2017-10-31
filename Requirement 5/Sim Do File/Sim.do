vsim -gui work.registerfile
add wave  \
sim:/registerfile/Clk \
sim:/registerfile/Rst \
sim:/registerfile/ResetFromROM \
sim:/registerfile/RomOutput \
sim:/registerfile/Srca \
sim:/registerfile/Dest \
sim:/registerfile/RamInput \
sim:/registerfile/RamOutput \
sim:/registerfile/MAROuatput 
add wave  \
sim:/registerfile/MDR/RegisterInputD \
sim:/registerfile/MDR/RegisterOutputQ
add wave  \
sim:/registerfile/InternalBus
# Clock.
force -freeze sim:/registerfile/Clk 1 0, 0 {50 ns} -r 100

# Reset
force -freeze sim:/registerfile/Rst 1 0
run

# Remove Reset
force -freeze sim:/registerfile/Rst 0 0
run

# Load Internal Bus with 0002
force -freeze sim:/registerfile/InternalBus 16'h0002 0
run

# Noforce Internal Bus
noforce sim:/registerfile/InternalBus

# Load MDR with 9999
force -freeze sim:/registerfile/InternalBus 16'h9999 0
run

# Noforce Internal Bus
noforce sim:/registerfile/InternalBus

# Write Data to ram COMMAND
run

# Load MAR with 0005 COMMAND
force -freeze sim:/registerfile/InternalBus 16'h0005 0
run

# Noforce Internal Bus
noforce sim:/registerfile/InternalBus

# WAIT FOR MDR TO CHECK.
run

# Load MAR with 0002 COMMAND
force -freeze sim:/registerfile/InternalBus 16'h0002 0
run

# Noforce Internal Bus
noforce sim:/registerfile/InternalBus

# Wait for MDR to CHECK.
run
run
