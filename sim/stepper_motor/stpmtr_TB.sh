#!/bin/bash

file=stpmtr_TB.v
lib="-y ../../rtl/stepper_motor"
Vflag="-Wall -o output"

echo "Simulating $file"

iverilog $file $lib $Vflag

vvp output 
