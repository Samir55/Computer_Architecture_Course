vsim -gui work.partc
# vsim 
# Start time: 02:46:34 on Sep 22,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.partc(partcimplementation)
add wave  \
sim:/partc/A \
sim:/partc/Cin \
sim:/partc/Cout \
sim:/partc/F \
sim:/partc/S0 \
sim:/partc/S1
force -freeze sim:/partc/A 16'h0F0F 0
force -freeze sim:/partc/S0 0 0
force -freeze sim:/partc/S1 0 0
run
force -freeze sim:/partc/S0 1 0
run
force -freeze sim:/partc/S0 0 0
force -freeze sim:/partc/S1 1 0
force -freeze sim:/partc/Cin 0 0
run
force -freeze sim:/partc/Cin 1 0
run
force -freeze sim:/partc/S0 1 0
force -freeze sim:/partc/S1 1 0
force -freeze sim:/partc/A 16'hF0F0 0
run
run