# Usage: Run when in files folder of BioComputing_EX6 by bash Exercise6.sh
# Completes the tasks associated with Exercise06, see individual comments 

# Task 1: Creates file with unique gender-yearsExperience combinations in sorted order
cat wages.csv | cut -d , -f1,2 | sort | uniq | grep -vwE 'gender' |
sed 's/,/ /g' | sort -k1,1 -k2n > Gender_YearsExperience.txt

# Task 2: Returns gender, years experience, and wage for the highest earner, lowest earner
# and number of females in the top ten earners
echo "Stats for the highest earner"
cat wages.csv | sort -n -k4 -t, | cut -d , -f1,2,4 | tail -1
echo "Stats for the lowest earner"
cat wages.csv | sort -n -k4 -t, | cut -d , -f1,2,4 | grep -vwE 'gender' | head -1
echo "Number of females in the top ten earners"
cat wages.csv | sort -n -k4 -t, | cut -d , -f1,2,4 | tail -10 > highest_earners.txt 
cat highest_earners.txt | grep -E 'female' > female_top_earners.txt
wc -l < female_top_earners.txt
rm highest_earners.txt female_top_earners.txt

# Task 3: Compares the minimum wage of college graduates vs. high school graduates
echo "Minimum wage for a college graduate"
VAR1=$(cat wages.csv | cut -d, -f3,4 | sort -n -k4 -t,| grep -vwE 'yearsSchool' | grep '16,' | cut -d, -f2 | sort -n | head -1) 
echo "$VAR1"
echo "Minimum wage for a high school graduate"
VAR2=$(cat wages.csv | cut -d, -f3,4 | sort -n -k4 -t,| grep -vwE 'yearsSchool'  | grep '12,' | cut -d, -f2 | sort -n | head -1)
echo "$VAR2"
echo "What difference does college make?"
echo "$VAR1 - $VAR2" | bc
