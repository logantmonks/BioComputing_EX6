
#usage: bash wages.sh $1

#Question 1:
cat $1 | cut -d, -f1,2 | sort -t, -k1,1 -k2,2n | uniq | tr ',' ' ' > genderyears.txt
 
#Question 2: 
echo "highest earner"
cat $1 | cut -d, -f 1,2,4 | sort -t, -k 3 -n | tail -n 1  

echo "lowest earner"
cat $1 | cut -d, -f 1,2,4 | sort -t, -k 3 -n | head -n 2 | tail -n 1

echo "number of females in top ten earners"
cat $1 | cut -d, -f 1,2,4 | sort -t, -k 3 -n -r | head -n 11 | grep  "female" | wc -l  


#Question 3
highschool_ed=$(cat $1 | cut -d , -f 3,4 | grep -w "12" | sort -t, -k 2 -n | head -n 1 | cut -d, -f 2) 

college_ed=$(cat $1 | cut -d, -f 3,4 | grep -w "16" | sort -t, -k 2 -n | head -n 1 | cut -d, -f 2)

echo "the effect of graduating college on the amount of minimum wage you earn"
echo "$college_ed - $highschool_ed" | bc 
