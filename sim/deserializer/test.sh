#!/bin/bash

file=deserial_TB.v
lib="-y ../../rtl/deserializer"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
