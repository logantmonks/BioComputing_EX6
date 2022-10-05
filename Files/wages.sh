#usage bash $1

#Question 1: unique gender-yearsExperience combinations
cat $1 | cut -d "," -f 1,2 | 
sort -t , -k1,1 -k2,2n | uniq | tr "," " " > uniqgenderexp.txt 

#Question 2:
#1)
echo "highest_earner" 
cat $1 | cut -d , -f 1,2,4 | sort -t, -k 3 -n | tail -n 1 
#2)
echo "lowest_earner"  
cat $1 | cut -d , -f 1,2,4 | sort -t, -k 3 -n -r | tail -n 2 | head -n 1
#3)
echo "the number of females in the top ten earners" 
cat $1 | cut -d , -f 1,2,4 | sort -t, -k 3 -n -r | head -n 10 | grep "female" | wc -l

#Question 3:
highschool=$(cat $1 | cut -d , -f 3,4 | grep -w "12"| 
sort -t , -k 2 -n | head -n 1 | cut -d , -f 2)
college=$(cat $1 | cut -d , -f 3,4 | grep -w "16"| 
sort -t , -k 2 -n | head -n 1 | cut -d , -f 2)
echo "the effect of graduating college on the minimum wage for earners"
echo "$college - $highschool" | bc  


