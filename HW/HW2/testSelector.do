vlog -reportprogress 300 -work work multiplexer.v
vsim -voptargs="+acc" testSelector
add wave -position insertpoint  \
sim:/testSelector/addr0_s \
sim:/testSelector/in0_s \
sim:/testSelector/in1_s \
sim:/testSelector/out_s 
run -all
wave zoom full