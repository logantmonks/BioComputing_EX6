# A shell script that takes the input wages.csv and accomplishes the three tasks
# outlined in the assignment
# Usage: bash MARTIN_PETER_Exercise6.sh wages.csv

tail -n +2 "$1" | cut -d, -f 1,2 | tr ', ' ' ' | sort -t ' ' -k1,1 -k2,2nr > gender_YEsort.txt

tail -n +2 wages.csv | cut -d, -f 1,2,4 | sort -n -r -t, -k 3 > earnings_sort.txt
echo ' '
echo "Highest earner's gender, yearsExperience, and wage:"
head -n 1 earnings_sort.txt
echo ' '
echo "Lowest earner's gender, yearsExperience, and wage:" 
tail -n 1 earnings_sort.txt
echo ' '
echo "The number of females in the top ten earners of this data set:"
head -n 10 earnings_sort.txt | grep -w -c 'female'
