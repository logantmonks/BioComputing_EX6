#Usage: bash ex6.sh
#Create a file containing the unique genders-yearsExperience combinations contained in wages.
cat wages.csv | tail -n 3294 | cut -d , -f 1,2 | sort -u | sed 's/,/ /g'| sort -u > ex6.txt 
#stdout of gender, yearsExperience, and wage for highest earner
echo high-earner
cat wages.csv | sort -n -t , -k 4 | cut -d , -f 1,2,4 | tail -n 1
#stdout of gender, yearsExperience, and wage for highest earner
echo low-earner   
cat wages.csv | sort -n -t , -k 4 | cut -d , -f 1,2,4 | head -n 2 | tail -n 1
#number of females in top ten earners
echo number-of-females-in-top-ten-earner
cat wages.csv | sort -n -t , -k 4 | cut -d , -f 1,4 | head -n 11 | tail -n 10 | grep "female" | wc -l  
#effect of graduating college on the minimum wage for earners in dataset
echo difference-in-minimum-wage-between-college-and-highschool-grads
college=$(cat wages.csv | grep -E "[a-z]+,[0-9]+,16" | sort -n -t , -k 4 | cut -d , -f 4 | head -n 2 | tail -n 1)
highschool=$(cat wages.csv | grep -E "[a-z]+,[0-9]+,12" | sort -n -t , -k 4 | cut -d , -f 4 | head -n 2 | tail -n 1)
echo $college - $highschool | bc       
