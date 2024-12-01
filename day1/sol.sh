#!/bin/bash

# part 1

cut -d" " -f1 input.csv | sort > col1.csv;
cut -d" " -f4 input.csv | sort > col2.csv;

paste -d"," col* | awk -F',' '{print ($2 - $1)}' | sed 's/-//g' | paste -sd+ - | bc > ans.txt;

# part 2

echo $(for i in $(uniq col1.csv); do
	echo "$(grep -c $i col2.csv)*$i*$(grep -c $i col1.csv)"
done) | sed 's/ /+/g' | bc >> ans.txt;

rm ./col*;
