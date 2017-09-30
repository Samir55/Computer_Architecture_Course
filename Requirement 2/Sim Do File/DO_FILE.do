vsim -gui work.alsu
# vsim 
# Start time: 17:43:08 on Sep 30,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.alsu(alsuimplementation)
# Loading work.nparta(npartaimplementation)
# Loading work.nbitadder(nbitadderimplementation)
# Loading work.onebitadder(onebitadderimplementation)
# Loading work.npartb(npartbimplementation)
# Loading work.npartc(npartcimplementation)
# Loading work.npartd(npartdimplementation)
add wave  \
sim:/alsu/A \
sim:/alsu/B \
sim:/alsu/Cin \
sim:/alsu/Cout \
sim:/alsu/F \
sim:/alsu/S0 \
sim:/alsu/S1 \
sim:/alsu/S2 \
sim:/alsu/S3 \
sim:/alsu/n
# Table 1
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/A 16'h0F0F 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/A 16'h0F0F 0
force -freeze sim:/alsu/B 16'h0001 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/A 16'hFFFF 0
force -freeze sim:/alsu/B 16'h0001 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/A 16'hFFFF 0
force -freeze sim:/alsu/B 16'h0001 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/A 16'hFFFF 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/A 16'h0F0E 0
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/A 16'hFFFF 0
force -freeze sim:/alsu/B 16'h0001 0
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/A 16'h0F0F 0
force -freeze sim:/alsu/B 16'h0001 0
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/Cin 1 0
run
# Table 2
force -freeze sim:/alsu/S3 0 0
force -freeze sim:/alsu/S2 1 0
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/A 16'h0F0F 0
force -freeze sim:/alsu/B 16'h000A 0
run
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/S1 0 0
run
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 1 0
run
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/S1 1 0
run
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S3 1 0
run
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S3 1 0
run
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S2 1 0
force -freeze sim:/alsu/S3 1 0
run
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S3 1 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S3 1 0
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/S2 1 0
force -freeze sim:/alsu/S3 1 0
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 0 0
run
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/S1 0 0
force -freeze sim:/alsu/S2 1 0
force -freeze sim:/alsu/S3 1 0
force -freeze sim:/alsu/A 16'hF0F0 0
run
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S2 1 0
force -freeze sim:/alsu/S3 1 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/S0 0 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S2 1 0
force -freeze sim:/alsu/S3 1 0
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/S0 1 0
force -freeze sim:/alsu/S1 1 0
force -freeze sim:/alsu/S2 0 0
force -freeze sim:/alsu/S3 1 0
run

