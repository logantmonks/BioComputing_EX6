# new file containing unique gender x yearsExperience combinations using file wages.csv is created
cat wages.csv | sort | cut -d , -f 1,2 |uniq > uniqex6.txt

#gender, yearsExpereience, and wage for the highest earner
echo highest earner
cat wages.csv | sort -n -t , -k 4 | tail -n 1 

#gender, yearsExperience, and wage for the lowest earner
echo lowest earner
cat wages.csv | sort -n -t , -k 4 | head -n 2 | tail -n 1

#number of females in the top ten earners
echo number of females in the top ten earners
cat wages.csv | sort -n -t , -k 4 | tail -n 10 | grep -c female

#Comparing difference in minimum wage between 12 yrs and 16 years of school
12yearsschool=$(cat wages.csv | cut -d , -f 3,4 |tr "," " " | grep -w 12 |sort -n -k 2| head -n 1 |cut -d " " -f 2) 
16yearsschool=$(cat wages.csv | cut -d , -f 3,4 |tr "," " " | grep -w 16 |sort -n -k 2| head -n 1 |cut -d " " -f 2)
echo "$16yearsschool - $12yearsschool" | bc .


