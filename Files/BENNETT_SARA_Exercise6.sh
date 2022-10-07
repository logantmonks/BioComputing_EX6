#usage bash BENNETT_SARA_Exercise6.sh

#1 (this code works when i run it in the terminal but when i run the bash usage command it shows up blank?)
cat wages.csv | cut -d , -f 1,2 | tail -n +2 | sort -u | sed 's/,/ /g'| > uniqGenYr.txt 

#2
low=$(cat wages.csv | grep -v -E "years" | sort -t, -n -k 4 | head -n 1 | cut -d, -f 1,2,4)
echo "The lowest earner was: $low "
high=$(cat wages.csv | sort -t , -n -r -k 4 | head -n 1 | cut -d, -f 1,2,4)
echo "The highest earner was: $high "
tenF=$(cat wages.csv | sort -t , -n -r -k 4 | head -n 10 | grep "female" | wc -l)
echo "The number of females in the top ten earners is: $tenF "

#3
college=$(cat wages.csv | grep -E "[a-z]+,[0-9]+,16," | sort -n -t , -k 4 | head -n 1 | cut -d , -f 4)
hs=$(cat wages.csv | grep -E "[a-z]+,[0-9]+,12," | sort -n -t , -k 4 | head -n 1 | cut -d , -f 4)

echo "The difference in min wage between college and highschool graduates is:"
echo "$college - $hs" | bc
