vsim -gui work.alu
# vsim -gui 
# Start time: 03:23:29 on Sep 22,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.alu(aluimplementation)
# Loading work.partb(partbimplementation)
# Loading work.partc(partcimplementation)
# Loading work.partd(partdimplementation)
# //  ModelSim PE Student Edition 10.4a Apr  7 2015 
# //
# //  Copyright 1991-2015 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# //  WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS
# //  LICENSORS AND IS SUBJECT TO LICENSE TERMS.
# //  THIS DOCUMENT CONTAINS TRADE SECRETS AND COMMERCIAL OR FINANCIAL
# //  INFORMATION THAT ARE PRIVILEGED, CONFIDENTIAL, AND EXEMPT FROM
# //  DISCLOSURE UNDER THE FREEDOM OF INFORMATION ACT, 5 U.S.C. SECTION 552.
# //  FURTHERMORE, THIS INFORMATION IS PROHIBITED FROM DISCLOSURE UNDER
# //  THE TRADE SECRETS ACT, 18 U.S.C. SECTION 1905.
# //
# // NOT FOR CORPORATE OR PRODUCTION USE.
# // THE ModelSim PE Student Edition IS NOT A SUPPORTED PRODUCT.
# // FOR HIGHER EDUCATION PURPOSES ONLY
# //
add wave  \
sim:/alu/A \
sim:/alu/B \
sim:/alu/Cin \
sim:/alu/Cout \
sim:/alu/F \
sim:/alu/S0 \
sim:/alu/S1 \
sim:/alu/S2 \
sim:/alu/S3
force -freeze sim:/alu/S3 0 0
force -freeze sim:/alu/S2 1 0
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 0 0
force -freeze sim:/alu/A 16'h0F0F 0
force -freeze sim:/alu/B 16'h000A 0
run
force -freeze sim:/alu/S0 1 0
force -freeze sim:/alu/S1 0 0
run
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 1 0
run
force -freeze sim:/alu/S0 1 0
force -freeze sim:/alu/S1 1 0
run
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 0 0
force -freeze sim:/alu/S2 0 0
force -freeze sim:/alu/S3 1 0
run
force -freeze sim:/alu/S0 1 0
force -freeze sim:/alu/S1 0 0
force -freeze sim:/alu/S2 0 0
force -freeze sim:/alu/S3 1 0
run
force -freeze sim:/alu/S0 1 0
force -freeze sim:/alu/S1 1 0
force -freeze sim:/alu/S2 1 0
force -freeze sim:/alu/S3 1 0
run
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 1 0
force -freeze sim:/alu/S2 0 0
force -freeze sim:/alu/S3 1 0
force -freeze sim:/alu/Cin 0 0
run
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 1 0
force -freeze sim:/alu/S2 0 0
force -freeze sim:/alu/S3 1 0
force -freeze sim:/alu/Cin 1 0
run
force -freeze sim:/alu/S2 1 0
force -freeze sim:/alu/S3 1 0
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 0 0
run
force -freeze sim:/alu/S0 1 0
force -freeze sim:/alu/S1 0 0
force -freeze sim:/alu/S2 1 0
force -freeze sim:/alu/S3 1 0
force -freeze sim:/alu/A 16'hF0F0 0
run
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 1 0
force -freeze sim:/alu/S2 1 0
force -freeze sim:/alu/S3 1 0
force -freeze sim:/alu/Cin 0 0
run
force -freeze sim:/alu/S0 0 0
force -freeze sim:/alu/S1 1 0
force -freeze sim:/alu/S2 1 0
force -freeze sim:/alu/S3 1 0
force -freeze sim:/alu/Cin 1 0
run
force -freeze sim:/alu/S0 1 0
force -freeze sim:/alu/S1 1 0
force -freeze sim:/alu/S2 0 0
force -freeze sim:/alu/S3 1 0
run
