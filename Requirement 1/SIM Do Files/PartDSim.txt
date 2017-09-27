vsim -gui work.partd
# vsim 
# Start time: 02:58:21 on Sep 22,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.partd(partdimplementation)
add wave  \
sim:/partd/A \
sim:/partd/Cin \
sim:/partd/Cout \
sim:/partd/F \
sim:/partd/S0 \
sim:/partd/S1
force -freeze sim:/partd/S0 1 0
force -freeze sim:/partd/S1 1 0
run
force -freeze sim:/partd/A 16'h0F0F 0
force -freeze sim:/partd/S0 0 0
force -freeze sim:/partd/S1 0 0
run
force -freeze sim:/partd/S0 1 0
force -freeze sim:/partd/A 16'hF0F0 0
run
force -freeze sim:/partd/S0 0 0
force -freeze sim:/partd/S1 1 0
force -freeze sim:/partd/Cin 0 0
run
force -freeze sim:/partd/Cin 1 0
run
