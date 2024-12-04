#!/bin/bash

# Part 1

cat input.txt | sed "s/mul(\([0-9]*\),\([0-9]*\))/A\1\*\2B/g" | sed -e "s/B[^AB]*A/BA/g" -e "s/^[^A]*A/A/g" -e "s/B[^0-9]*$/B/g" | sed -e "s/A//g" -e "s/B/ + /g" | sed "s/ + $//g" | bc

# Part 2

cat input.txt | sed -e "s/do()/X/g" -e "s/don't()/Y/g" | sed "s/mul(\([0-9]*\),\([0-9]*\))/A\1B\2C/g" | sed "s/[^ABC0-9XY]//g" | sed "s/Y[^X]*X//g" | sed "s/[XY]//g" | sed "s/C[0-9]*A/CA/g" | sed "s/A\([0-9]*\)B\([0-9]*\)C/\1\*\2 + /g" | sed "s/ + $//g" | bc
