# Script for Exercise 6 (comparison of gender, earnings and years experience from wages.csv)
# Usage: bash Bailey_Jaden_EX6.sh

# question 1
echo "File Created: uniquegender-yearsExp.txt" 
cat wages.csv | tail -n+2 | cut -d ',' -f 1,2 | sort -t ',' -k1,1 -k2,2n | tr "," " " > uniquegender-yearsExp.txt

# part 2
echo "highest earner (gender,yearsExp):"
cat wages.csv | tail -n+2 | sort -t ',' -k 4 -n | tail -n 1 | cut -d ',' -f 1,2,4
echo
echo "lowest earner (gender,yearsExp):"
cat wages.csv | tail -n+2 | sort -t ',' -k 4 -n | head -n 1 | cut -d ',' -f 1,2,4
echo
echo "number of females in top ten earners:"
cat wages.csv | tail -n+2 | sort -t ',' -k 4 -n | tail -n 10 | grep female | wc -l

echo
# part 3
echo "the difference in minimum wage for  earners in this data set based on college graduation"
college=$(cat wages.csv | tail -n+2 | grep .*,.*,16.* | cut -d ',' -f 4 | sort -n | head -n 1)
no_college=$(cat wages.csv | tail -n+2 | grep .*,.*,12.* | cut -d ',' -f 4 | sort -n | head -n 1)
echo $college - $no_college | bc
