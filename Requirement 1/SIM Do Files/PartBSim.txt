vsim -gui work.partb
# vsim 
# Start time: 03:06:07 on Sep 22,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.partb(partbimplementation)
add wave  \
sim:/partb/A \
sim:/partb/B \
sim:/partb/F \
sim:/partb/S0 \
sim:/partb/S1
force -freeze sim:/partb/S0 0 0, 1 {50 ns} -r 100
force -freeze sim:/partb/S1 0 0, 1 {100 ns} -r 200
force -freeze sim:/partb/A 16'h0F0F 0
force -freeze sim:/partb/B 16'h000A 0
run
run