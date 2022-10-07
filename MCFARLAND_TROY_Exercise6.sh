!#/bin/bash

#Part 1

cat wages.csv | sed 1d | cut -d ',' -f 1,2 | sed 's/,/ /' | sort -k 1d,1 -k 2n,2n -u > part1.txt

#Part 2

echo "The highest earner's gender, years of experience, and wage:"
cat wages.csv | cut -d ',' -f 1,2,4 | sed 's/,/ /g' | sort -k 3n | tail -n1

echo "The lowest earner's gender, years of experience, and wage:"
cat wages.csv | sed 1d | cut -d ',' -f 1,2,4 | sed 's/,/ /g' | sort -k 3n | head -n1 

echo "Number of female top 10 earners:"
cat wages.csv | sed 1d | cut -d ',' -f 1,2,4 | sed 's/,/ /g' | sort -k 3n | tail | grep -c 'female'

#Part 3

college_minwage=$(cat wages.csv | sed 1d | cut -d ',' -f 3,4 | sed 's/,/ /g' | grep -E "16 .+" | sort -k 2n | head -n1 | cut -d ' ' -f 2)


highschool_minwage=$(cat wages.csv | sed 1d | cut -d ',' -f 3,4 | sed 's/,/ /g' | grep -E "12 .+" | sort -k 2n | head -n1 | cut -d ' ' -f 2 )

echo "The college graduate employee with the lowest wage makes" 
echo "$college_minwage - $highschool_minwage" | bc
echo "more than the lowest paid high school graduate employee."
