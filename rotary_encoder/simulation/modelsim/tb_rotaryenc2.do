add wave rot_a rot_b lout2 lout1 lout0
force rot_a 1 1, 0 5ns, 1 15ns -repeat 20ns
force rot_b 0 0, 1 10ns -repeat 20ns
run 1030ns

