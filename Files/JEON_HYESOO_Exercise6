# /bin/bash
# hjeon


# Exercise 06 Task 01
# First define a new FILENAME to write the unique gender yearsExperience combinations
echo "Exercise 06 Task 01"
FILENAME="task1"
# write header row for new file for gender and yearsExperience columns
echo "gender yearsExperience" > $FILENAME
# we use awk to first separate by wages.csv's delimiter ',', then extract the first two columns which would be outputed by a space,
# excluding the header row
# sort by the first column (gender) first, followed by second NUMERICAL column
# append this stdout as stdin to FILENAME set aside earlier
(cat wages.csv | awk -v FS=',' 'NR>1{print $1 " " $2}' | sort -t ' ' -k1,1 -k2,2n) >> $FILENAME
echo "New output file called task1 created in this directory which stores unique gender-yearsExperience combinations"


# Exercise 06 Task 02
printf "\n"
echo "Exercise 06 Task 02"
MAXIMUM_EARNER=$(cat wages.csv | awk -v FS=',' 'NR>1{print $1 " " $2 " " $4}' | sort -t ' ' -k3,3nr | head -1)
MINIMUM_EARNER=$(cat wages.csv | awk -v FS=',' 'NR>1{print $1 " " $2 " " $4}' | sort -t ' ' -k3,3nr | tail -1)
TOP10_NUM_FEMALES=$(cat wages.csv | awk -v FS=',' 'NR>1{print $1 " " $4}' | sort -t ' ' -k2,2nr | head -10 | awk '{
    if ($1 == "female")
        print "Found Top 10 female earner"
}' | wc -l)


echo "Maximum earner: $MAXIMUM_EARNER"
echo "Minimum earner: $MINIMUM_EARNER"
echo "Number of females amongst top 10 earners: $TOP10_NUM_FEMALES"


# Exercise 06 Task 03
printf "\n"
echo "Exercise 06 Task 03"
WAGES_GRADUATED=$(cat wages.csv | awk -v FS=',' 'NR>1{if ($3 == 16) {b+=1; a+=$4}} END {print a / b}')
WAGES_NOT_GRADUATED=$(cat wages.csv | awk -v FS=',' 'NR>1{if ($3 == 12) {b+=1; a+=$4}} END {print a / b}')

echo "College graduates earn more wage than nongraduates on an average of: $(echo "$WAGES_GRADUATED - $WAGES_NOT_GRADUATED" | bc)"
