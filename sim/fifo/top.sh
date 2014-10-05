#!/bin/bash

file=top_TB.v
lib="-y ../../rtl/fifo -y ../../rtl/bin2gry -y ../../rtl/lab/ -y ../../rtl/debouncer/"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
