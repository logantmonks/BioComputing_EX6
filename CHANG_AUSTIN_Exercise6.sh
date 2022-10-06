#!/bin/bash

#part 1
cat wages.csv | cut -d , -f 1,2 | tr ',' ' ' | sort -d -k 1,1 -k 2n,2n | uniq | grep -v -e "yearsExperience" > unique_gender_yearsExperience.txt

echo "Part 1 is in unique_gender_yearsExperience.txt"

#part 2
max=$(cat wages.csv | sort -t , -n -r -k 4 | head -n 1 | cut -d , -f 1,2,4)
min=$(cat wages.csv | sort -t , -n -k 4 | head -n 2 | tail -n 1 | cut -d , -f 1,2,4)
top10females=$(cat wages.csv | sort -t , -n -r -k 4 | head -n 10 | grep -e "female" | wc -l)

echo "Part 2"
echo "The gender, yearsExperience, and wage for the highest earner: $max"
echo "The gender, yearsExperience, and wage for the lowest earner: $min"
echo "The number of females in the top 10 earners: $top10females"

#part 3
collegesal=$(cat wages.csv | grep -E "[a-z]{1,6},[0-9]{1,3},16," | sort -t , -n -k 4 | head -n 1 | cut -d , -f 4)
highschoolsal=$(cat wages.csv | grep -E "[a-z]{1,6},[0-9]{1,3},12," | sort -t , -n -k 4 | head -n 1 | cut -d , -f 4)
diff=$(echo "$collegesal - $highschoolsal" | bc)

echo "Part 3"
echo "The difference in minimum wage between college grads and high school grads: $diff"
