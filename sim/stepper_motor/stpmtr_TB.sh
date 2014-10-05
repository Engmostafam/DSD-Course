#!/bin/bash

file=stpmtr_TB.v
lib="-y ../../rtl/assign0b"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
