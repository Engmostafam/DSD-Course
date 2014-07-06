#!/bin/bash

file=fifo_TB.v
lib="-y ../../rtl/fifo -y ../../rtl/bin2gry"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
