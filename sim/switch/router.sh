#!/bin/bash

file=router_TB.v
lib="-y ../switch -y ../../rtl/fifo -y ../../rtl/bin2gry -y ../../rtl/switch  -y ../../rtl/arbiter "
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
