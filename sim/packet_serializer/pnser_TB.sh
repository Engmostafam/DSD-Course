#!/bin/bash

file=pnser_TB.v
lib="-y ../../rtl/packet_serializer"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
