#!/bin/bash

file=arbiter_TB.v
lib="-y ../../rtl/arbiter"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
