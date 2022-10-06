# A shell script that takes the input wages.csv and accomplishes the three tasks
# outlined in the assignment
# Usage: bash MARTIN_PETER_Exercise6.sh wages.csv

tail -n +2 "$1" | cut -d, -f 1,2 | tr ', ' ' ' | sort -t ' ' -k1,1 -k2,2nr | uniq > gender_YEsort.txt

tail -n +2 "$1" | cut -d, -f 1,2,4 | sort -n -r -t, -k 3 > earnings_sort.txt
echo ' '
echo "Highest earner's gender, yearsExperience, and wage:"
head -n 1 earnings_sort.txt
echo ' '
echo "Lowest earner's gender, yearsExperience, and wage:" 
tail -n 1 earnings_sort.txt
echo ' '
echo "The number of females in the top ten earners of this data set:"
head -n 10 earnings_sort.txt | grep -w -c 'female'

echo ' '
highschool=$(tail -n +2 "$1" | cut -d, -f 3,4 | tr ', ' ' ' | grep -w -E '12 [1-9]+\.[1-9]{1,}' | sort -t ' ' -k1,1nr -k2,2n | head -n 1 | cut -d ' ' -f 2)
college=$(tail -n +2 "$1" | cut -d, -f 3,4 | tr ', ' ' ' | grep -w -E '16 [1-9]+\.[1-9]{1,}' | sort -t ' ' -k1,1nr -k2,2n | head -n 1 | cut -d ' ' -f 2)
echo "The minimum wage of people who graduated college is"
echo "$college - $highschool" | bc
echo "more dollars than the minimum wage of people who only graduated from high school"
echo ' '
