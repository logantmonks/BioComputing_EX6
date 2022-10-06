####Assignment 1
#This script will create  a file with the unique combinations of years of experience and gender
cat wages.csv | cut -d, -f 1,2 | tr ',' ' ' | sort -t ' ' -k 1,1 -k 2n,2n | uniq | grep -v -e "gender yearsExperience" > uniqueyrsexp.csv

####Assignment 2.1
#This script will print out the gender, years of experience, and the wage value of the highest earner in the data set
cat wages.csv | grep -E "(male|female)" | cut -d, -f1,2,4 | sort -t, -k 3n | tail -n1

####Assignment 2.2
#This script will print out the gender, years of experience, and the wage value of the lowest earner in the data set
cat wages.csv | grep -E "(male|female)" | cut -d, -f1,2,4 | sort -t, -k 3n | head -n1

####Assignment 2.3
#This script will print out the number of females that are in the top 10 earners in the data set
cat wages.csv | cut -d, -f 1,4 | tr ',' ' ' | sort -t ' ' -k 2n | tail -n10 | grep "female" | wc -l

####Assignment 3
#This script will determine the difference between the lowest earners in the college and high school educated populations
college=$(cat wages.csv | cut -d, -f3,4 | grep -E "16," | cut -d, -f 2 | sort -n  | head -n1)
highschool=$(cat wages.csv | cut -d, -f3,4 | grep -E "12," | cut -d, -f 2 | sort -n  | head -n1)
echo "$college - $highschool" | bc
 
