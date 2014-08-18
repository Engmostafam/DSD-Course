#!/bin/bash

file=port_TB.v
lib="-y ../../rtl/fifo -y ../../rtl/bin2gry -y ../../rtl/switch"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
