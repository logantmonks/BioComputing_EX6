# A script designed to analyze and manipulate the file wages.csv according to Exercise 6
# usage: bash exercise6script.sh (assumes wages.csv is in current working directory)

#1 (create gender-yearsExperience file)

echo "FILE CREATED: gender_yearsExp.txt (unique combinations of gender-yearsExperience)"
cat wages.csv | cut -d , -f 1,2 | sort -t , -k 1,1 -k2,2n | tr "," " " > gender_yearsExp.txt 

#2

#2.1 (highest earner + their gender and yearsExperience)
echo "Highest earner (gender, yearsExperience, wage)"
cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 | tail  -n 2 | head -n 1

#2.2 (lowest earner + their gender and yearsExperience)
echo "Lowest earner (gender, yearsExperience, wage)"
cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 | head -n 1

#2.3 (number of females in the top ten earners)
echo "Number of females in the top ten earners"
cat wages.csv | sort -t , -k 4 | tail -n 11 | head -n 10 | grep 'female' | wc -l


#3
echo "Difference between lowest wage earner with 16 years of schooling and lowest wage earner 
with 12 years of schooling"
college=$(cat wages.csv | cut -d , -f 1,3,4 | grep "16," | sort -t , -k 3 -n | cut -d , -f 3 | 
head -n 1)
notcollege=$(cat wages.csv | cut -d , -f 1,3,4 | grep "12," | sort -t , -k 3 -n | cut -d , -f 3 | head -n 1)
echo "$college - $notcollege" | bc

