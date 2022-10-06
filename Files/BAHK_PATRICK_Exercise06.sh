#part1: write file containing the unique gender and years Experience for file wages.csv
#part1: the new file created is called unique-gender-yearExperience.txt
cat wages.csv | cut -d , -f 1,2 | tr ',' ' '| sort -n -k 2 | uniq > unique-gender-yearsExperience.txt | echo "new file generated: 'unique-gender-yearsExperience.txt' containing: Gender YearsExperience"


#part2
# need to return gender, yearsExperience, Wage of highest earner to stdout
# do the same for the lowest earner 
# number of females in the top ten earners in the data set 
# make sure to indicate which output is which, so need to echo 

for file in wages.csv 
do
   echo "Highest Earner Description: gender yearsExperience Wage"  
   cat $file | cut -d , -f 1,2,4 | tr ',' '     ' | sort -n -k 3 | tail -n 1 
   echo "Lowest Earner Description: gender yearsExperience Wage"
   cat $file | cut -d , -f 1,2,4 | tr ',' ' ' | sort -n -k 3 | head -n 2 | tail -n 1
   echo "The number of females in the top ten earners of wages.csv"
   cat $file | cut -d, -f 1,2,4 | tr ',' ' ' | sort -n -k 3 | tail -n 10 | grep -w 'female' | wc -l
done


#part3
# return to stdout: the effect of graduating college (12 vs. 16 years of school) on minimum wage for earners 

for file in wages.csv
do 
  echo "The effect of graduating college (12 vs. 16 years of school) on the minimum wage for earners in this dataset:"
 var1=$(cat $file | cut -d , -f 3,4 | tr ',' ' ' | sort -n -k 2 | awk '$1 == "12"' | head -n 1 | cut -d ' ' -f 2) 
 var2=$(cat $file | cut -d , -f 3,4 | tr ',' ' ' | sort -n -k 2 | awk '$1 == "16"' | head -n 1 | cut -d ' ' -f 2)
  echo "$var2 - $var1" | bc
done
