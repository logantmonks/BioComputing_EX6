#Problem 2
cat wages.csv | tail -n +2 | cut -d , -f 1,2 | sed 's/,/ /g'|sort -u -t " " -k1,1 -k2n,2 > probpart1.txt

#Problem 2
echo "This is the highest earner:"
cat wages.csv | tail -n +2 | cut -d , -f 1,2,4 |sort -u -t "," -k3nr | head -n 1
echo "This is the lowest earner:"  
cat wages.csv | tail -n +2 | cut -d , -f 1,2,4 |sort -u -t "," -k3n | head -n 1
echo "This is the number of females in the top ten earners:"
cat wages.csv | tail -n +2 | cut -d , -f 1,2,4 |sort -u -t "," -k3nr | head -n 10 | grep -c ^female 

#Problem 3
wages12sum=$(cat wages.csv | cut -d , -f 3,4 | grep ^12,| cut -d , -f 2 | paste -sd+ | bc)
wages12count=$(cat wages.csv | cut -d , -f 3,4 | grep -c ^12)
wages16sum=$(cat wages.csv | cut -d , -f 3,4 | grep ^16, | cut -d , -f 2 | paste -sd+ | bc)
wages16count=$(cat wages.csv | cut -d , -f 3,4 | grep -c ^16)
avgwage12=$(echo "$wages12sum / $wages12count" | bc -l)
avgwage16=$(echo "$wages16sum / $wages16count" | bc -l)

echo "On average the effect of graduating from college on the minimum wage is:"
echo "$avgwage16 - $avgwage12" | bc -l
