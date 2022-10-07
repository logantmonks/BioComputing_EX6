#usage: $ bash ex6.sh in the directory containing wages.csv


#sorting wages by sex and salary
cat wages.csv | cut -d, -f 1,2,4 | grep female | sort -t, -k 2 -n > wagessorted.txt
cat wages.csv | cut -d, -f 1,2,4 | grep -w  male | sort -t, -k 2 -n>> wagessorted.txt

#Highest and Lowest earners
echo "Highest Earner"
cat wages.csv | sort -t, -k 4 -rn | cut -d, -f 1,2,4 | head -n 1
echo "Lowest Earner"
cat wages.csv | sort -t, -k 4 -rn | cut -d, -f 1,2,4 | tail -n 2 | head -n 1
#Number of women in the top 10 earners
echo "Females in top earning positions"
cat wages.csv | sort -t, -k 4 -rn | cut -d, -f 1,2,4 | head -n 10 | grep -c female

#minimum wage with college degree
college_wage=$(cat wages.csv | cut -d, -f 1,3,4 | sort -t, -k 3 -n | grep -m 1 -w "16" | cut -d, -f 3)
#minimum wage without college degree
highschool_wage=$(cat wages.csv | cut -d, -f 1,3,4 | sort -t, -k 3 -n | grep -w -m 1 "12" | cut -d, -f 3)
#math to find the difference between our minimum wage workers
echo "difference in minimum wage between degree holding and non degree holding employees"
echo "$college_wage - $highschool_wage" | bc
