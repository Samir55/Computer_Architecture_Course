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
force -freeze sim:/registerfile/Clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/registerfile/Src 3'h0 0
force -freeze sim:/registerfile/Rst 1 0
force -freeze sim:/registerfile/Dest 3'h0 0
run
# Load Ax with 000000AA
force -freeze sim:/registerfile/InternalBus 32'h000000AA 0
force -freeze sim:/registerfile/Dest 3'h4 0
noforce sim:/registerfile/Rst
force -freeze sim:/registerfile/Rst 0 0
run
# Load BX With 000000BB
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Dest 3'h5 0
force -freeze sim:/registerfile/InternalBus 32'h000000BB 0
run
# Load CX With 000000CC
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Dest 3'h6 0
force -freeze sim:/registerfile/InternalBus 32'h000000CC 0
run
# Load DX with 000000DD
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Dest 3'h7 0
force -freeze sim:/registerfile/InternalBus 32'h000000DD 0
run
# Transfer Data from AX to BX
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Src 3'h4 0
force -freeze sim:/registerfile/Dest 3'h5 0
run
# Transfer Data from CX to AX
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Src 3'h6 0
force -freeze sim:/registerfile/Dest 3'h4 0
run
# Transfer Data from DX to AX
noforce sim:/registerfile/InternalBus
force -freeze sim:/registerfile/Src 3'h7 0
force -freeze sim:/registerfile/Dest 3'h4 0
run
run