#HARRIS_JOSEPH_Exercise6.sh: a script to maniuplate wages.csv in three unique ways, as described by Exercise 6
#usage: $bash HARRIS_JOSEPH_Exercise6.sh 
#usage note: wages.csv must be in pwd 

#1
#sorts wages.csv into two space-seperated columns of unique gender and yearsExperience combinations and creates a new file
echo "New File Created: gender_yearsExperience.txt : contains unique gender and yearsExperience combinations"
cat wages.csv | tail -n+2 | cut -d "," -f 1,2 | sort -k1,1 -k2 -V | sed 's/,/ /g' | uniq > gender_yearsExperience.txt

echo " "

#2
#reports highest earner's gender,yearsExperience,wage
echo "HIGHEST EARNER: gender,yearsExperience,wage"
cat wages.csv | cut -d "," -f 1,2,4 | tail -n+2 | sort -t , -k3 -V | tail -n1

echo " "

#reports lowest earner's gender,yearsExperience,wage
echo "LOWEST EARNER: gender,yearsExperience,wage"
cat wages.csv | cut -d "," -f 1,2,4 | tail -n+2 | sort -t , -k3 -V | head -n1

echo " "

#reports the number of females in the top 10 earners
echo "Number of females in the top 10 earners"
cat wages.csv | cut -d "," -f 1,2,4 | tail -n+2 | sort -t , -k3 -V | tail -n10 | grep "female" | wc -l

echo " "

#3
NoCollegeMin=$(cat wages.csv | cut -d "," -f 3,4 | sort -t , -k1 -V | grep "12," | cut -d "," -f 2 | head -n1)
CollegeGradMin=$(cat wages.csv | cut -d "," -f 3,4 | sort -t , -k1 -V | grep "16," | cut -d "," -f 2 | head -n1)
echo "Minimum wage with 12 years of schooling, no college expereince"
echo $NoCollegeMin
echo "Minimum wage with 16 years of schooling, college graduate"
echo $CollegeGradMin
echo "Difference between minium wage after 16 years of schooling (college graduate) and after 12 years of schooling (no college experience)"
echo "$CollegeGradMin - $NoCollegeMin" | bc

