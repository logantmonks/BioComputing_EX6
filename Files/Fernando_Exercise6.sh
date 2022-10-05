#usage: bash script.sh $1
#Question 1
cat $1 | cut -d , -f 1,2 | sort -t, -k1,1 -k2,2n | uniq |tr "," " " > Gender_experience.txt

#Question 2
echo "Highest earner"
cat $1 | cut -d , -f 1,2,4 | sort -t, -k 3 -n | tail -n 1

echo "Lowest earner"
cat $1 | cut -d , -f 1,2,4 | sort -t, -k 3 -n | head -n 2 | tail -n 1

echo "The number of females in the top ten earners"
cat $1 |cut -d , -f 1,2,4 | sort -t, -k 3 -n -r | head -n 11 | grep "female" | wc -l

#Question 3
highschool=$(cat $1 | cut -d , -f 3,4 | grep -w "12" | sort -t, -k 2 -n | head -n 1 | cut -d, -f 2)
College=$(cat $1 | cut -d , -f 3,4 | grep -w "16" | sort -t, -k 2 -n | head -n 1 | cut -d, -f 2) 
echo "the effect of graduating college on the minimum wage for earners"
echo "$College - $highschool" | bc
