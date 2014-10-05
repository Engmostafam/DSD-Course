#!/bin/bash

file=clkgen_TB.v
lib="-y ../../rtl/lab"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
