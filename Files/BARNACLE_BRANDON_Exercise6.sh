#!/bin/bash

# part 1
cat wages.csv | cut -d , -f 1,2 | tr -s ',' ' ' | sort -d -k 1,1 -k 2n,2n | uniq | grep -v -E "years" > uniqueGender-yearsExperience.txt

# part 2
max=$(cat wages.csv | sort -t , -n  -r -k 4 | head -n 1 | cut -d , -f 1,2,4)
min=$(cat wages.csv | grep -v -E "years" |  sort -t , -n -k 4 | head -n 1 | cut -d , -f 1,2,4)
top_ten=$(cat wages.csv | sort -t , -n -r -k 4 | head -n 10 | grep "female" | wc -l)

echo "Exercise 06 part 2:"
echo "The gender, years of experience, and wage of the highest earner are $max"
echo "The gender, years of experience, and wage of the lowest earner are $min"
echo "The number of females in the top ten earners are: $top_ten"

# part 3, for this part from what I got from OH and from the question
# we should be comparing the minimum wage of a person who has 16 years of 
# school to someone who has 12 years of school
college=$(cat wages.csv | grep -E "[a-z]{1,10},[0-9]{1,3},16," | sort -n -t , -k 4,4| head -n 1 | cut -d , -f 4)
highschool=$(cat wages.csv | grep -E "[a-z]{1,10},[0-9]{1,3},12," | sort -n -t , -k 4,4 | head -n 1 | cut -d , -f 4)
difference=$(echo "$college - $highschool" | bc)

echo ""
echo "Exercise 06 part 3:"
echo "The difference in minimum wage between 16 and 12 years of school is(college-highschool): $difference"
